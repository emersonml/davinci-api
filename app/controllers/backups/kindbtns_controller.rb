class KindbtnsController < ApplicationController
  before_action :set_kindbtn, only: [:show, :update, :destroy]

  # GET /kindbtns
  def index
    @kindbtns = Kindbtn.all

    render json: @kindbtns
  end

  # GET /kindbtns/1
  def show
    render json: @kindbtn
  end

  # POST /kindbtns
  def create
    @kindbtn = Kindbtn.new(kindbtn_params)

    if @kindbtn.save
      render json: @kindbtn, status: :created, location: @kindbtn
    else
      render json: @kindbtn.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /kindbtns/1
  def update
    if @kindbtn.update(kindbtn_params)
      render json: @kindbtn
    else
      render json: @kindbtn.errors, status: :unprocessable_entity
    end
  end

  # DELETE /kindbtns/1
  def destroy
    @kindbtn.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kindbtn
      @kindbtn = Kindbtn.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def kindbtn_params
      params.require(:kindbtn).permit(:name)
    end
end
