class EplayersController < ApplicationController
  before_action :set_eplayer, only: [:show, :edit, :update, :destroy]

  # GET /eplayers
  # GET /eplayers.json
  def index
    @eplayers = Eplayer.all
  end

  # GET /eplayers/1
  # GET /eplayers/1.json
  def show
  end

  # GET /eplayers/new
  def new
    @eplayer = Eplayer.new
  end

  # GET /eplayers/1/edit
  def edit
  end

  # POST /eplayers
  # POST /eplayers.json
  def create
    @eplayer = Eplayer.new(eplayer_params)

    respond_to do |format|
      if @eplayer.save
        format.html { redirect_to @eplayer, notice: 'Eplayer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @eplayer }
      else
        format.html { render action: 'new' }
        format.json { render json: @eplayer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /eplayers/1
  # PATCH/PUT /eplayers/1.json
  def update
    respond_to do |format|
      if @eplayer.update(eplayer_params)
        format.html { redirect_to @eplayer, notice: 'Eplayer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @eplayer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eplayers/1
  # DELETE /eplayers/1.json
  def destroy
    @eplayer.destroy
    respond_to do |format|
      format.html { redirect_to eplayers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_eplayer
      @eplayer = Eplayer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def eplayer_params
      params[:eplayer]
    end
end
