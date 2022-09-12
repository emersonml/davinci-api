class DevsController < ApplicationController
  before_action :set_dev, only: [:show, :update, :destroy]

  # GET /devs
  def index
    @devs = Dev.all

    render json: @devs
  end

  # GET /devs/1
  def show
    render json: @dev
  end

  # POST /devs
  def create
    @dev = Dev.new(dev_params)

    if @dev.save
      render json: @dev, status: :created, location: @dev
    else
      render json: @dev.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /devs/1
  def update
    if @dev.update(dev_params)
      render json: @dev
    else
      render json: @dev.errors, status: :unprocessable_entity
    end
  end

  # DELETE /devs/1
  def destroy
    @dev.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dev
      @dev = Dev.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    # def dev_params
    #   params.require(:dev).permit(:sttus, :name, :tipo)
    # end
    def dev_params
      ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    end




end
