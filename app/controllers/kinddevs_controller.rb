class KinddevsController < ApplicationController
  before_action :set_kinddev, only: [:show, :update, :destroy]

  # GET /kinddevs
  def index
    @kinddevs = Kinddev.all

    render json: @kinddevs
  end

  # GET /kinddevs/1
  def show
    render json: @kinddev
  end

  # POST /kinddevs
  def create
    @kinddev = Kinddev.new(kinddev_params)

    if @kinddev.save
      render json: @kinddev, status: :created, location: @kinddev
    else
      render json: @kinddev.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /kinddevs/1
  def update
    if @kinddev.update(kinddev_params)
      render json: @kinddev
    else
      render json: @kinddev.errors, status: :unprocessable_entity
    end
  end

  # DELETE /kinddevs/1
  def destroy
    @kinddev.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kinddev
      @kinddev = Kinddev.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def kinddev_params
      params.require(:kinddev).permit(:name)
    end
end
