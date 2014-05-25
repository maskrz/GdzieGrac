class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :set_players, only: [:new, :edit, :update, :show]
  before_action :set_nerbys, only: [:show]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @fields = Field.all
    @hash = Gmaps4rails.build_markers(@fields) do |field, marker|
      marker.lat field.latitude
      marker.lng field.longitude
      marker.infowindow field.desc
      marker.picture({
        "url" => "/assets/darkgreen_MarkerB.png",
        "width" => 32,
        "height" => 32
      })
    end
    @hash2 = Gmaps4rails.build_markers(@participants) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      marker.infowindow user.display_name
      marker.picture({
        "url" => "/assets/blue_MarkerG.png",
        "width" => 32,
        "height" => 32
      })
    end
    @hash.concat @hash2
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.create(event_params)
    create_players_events(@event.id)
    
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render action: 'show', status: :created, location: @event }
      else
        format.html { render action: 'new' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    manage_player_event(@event)
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
      @participants = @event.players
    end
    
    def set_players
      @players = Player.all
    end
    
    def manage_player_event(event)
      remove_players_events(event)
      create_players_events(event.id)
    end
    
    def remove_players_events(event)
      @eplayers = event.eplayers
      @eplayers.each do |eplayer|
        if !params["post"]["players_ids"].include?(eplayer)
          eplayer.destroy
        end
      end
    end
    
    def create_players_events(event_id)
      params["post"]["players_ids"].each do |id| 
        @eplayer = Eplayer.where(player_id: id, event_id: event_id).take
        if(!@eplayer)
          @eplayer = Eplayer.new
          @eplayer.player_id = id
          @eplayer.event_id = event_id
          @eplayer.save
        end
      end
    end
    
    def set_nerbys
      @nerbys = Hash.new(0)
      @fields = Field.all
      @fields.each do |field|
        dist = 0
        @participants.each do |p|
          dist += (1.602 * field.distance_to(p)).round(2)
        end
        @nerbys[field] = dist 
      end
      @nerbys.sort_by {|k,v| v}.reverse
      @nerbys = @nerbys.sort_by {|k,v| v}
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :date, :time)
    end
end
