class CentralsController < ApplicationController
  before_action :set_central, only: [:show, :update, :destroy]

  # GET /centrals
  def index
    @centrals = Central.all

    render json: @centrals
  end

  # GET /centrals/1
  def show
    render json: @central
  end

  # POST /centrals
  def create
    @central = Central.new(central_params)

    if @central.save
      render json: @central, status: :created, location: @central
    else
      render json: @central.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /centrals/1
  def update
    if @central.update(central_params)
      render json: @central
    else
      render json: @central.errors, status: :unprocessable_entity
    end
  end

  # DELETE /centrals/1
  def destroy
    @central.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_central
      @central = Central.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def central_params
      params.require(:central).permit(:name, :tipo, :sttus)
    end
end
