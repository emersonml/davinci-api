class PatrimoniosController < ApplicationController
  before_action :set_patrimonio, only: [:show, :update, :destroy]

  # GET /patrimonios
  def index
    @patrimonios = Patrimonio.all

    render json: @patrimonios
  end

  # GET /patrimonios/1
  def show
    render json: @patrimonio
  end

  # POST /patrimonios
  def create
    @patrimonio = Patrimonio.new(patrimonio_params)

    if @patrimonio.save
      render json: @patrimonio, status: :created, location: @patrimonio
    else
      render json: @patrimonio.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /patrimonios/1
  def update
    if @patrimonio.update(patrimonio_params)
      render json: @patrimonio
    else
      render json: @patrimonio.errors, status: :unprocessable_entity
    end
  end

  # DELETE /patrimonios/1
  def destroy
    @patrimonio.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patrimonio
      @patrimonio = Patrimonio.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def patrimonio_params
      params.require(:patrimonio).permit(:name)
    end
end
