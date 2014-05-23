class AthsController < ApplicationController
  before_action :set_ath, only: [:show, :edit, :update, :destroy]

  # GET /aths
  # GET /aths.json
  def index
    @aths = Ath.all
  end

  # GET /aths/1
  # GET /aths/1.json
  def show
  end

  # GET /aths/new
  def new
    @ath = Ath.new
  end

  # GET /aths/1/edit
  def edit
  end

  # POST /aths
  # POST /aths.json
  def create
    @ath = Ath.new(ath_params)

    respond_to do |format|
      if @ath.save
        format.html { redirect_to @ath, notice: 'Ath was successfully created.' }
        format.json { render action: 'show', status: :created, location: @ath }
      else
        format.html { render action: 'new' }
        format.json { render json: @ath.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aths/1
  # PATCH/PUT /aths/1.json
  def update
    respond_to do |format|
      if @ath.update(ath_params)
        format.html { redirect_to @ath, notice: 'Ath was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @ath.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aths/1
  # DELETE /aths/1.json
  def destroy
    @ath.destroy
    respond_to do |format|
      format.html { redirect_to aths_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ath
      @ath = Ath.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ath_params
      params.require(:ath).permit(:name)
    end
end
