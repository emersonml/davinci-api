class CompartimentosController < ApplicationController
  before_action :set_compartimento, only: [:show, :update, :destroy]

  # GET /compartimentos
  def index
    @compartimentos = Compartimento.all

    render json: @compartimentos
  end

  # GET /compartimentos/1
  def show
    render json: @compartimento
  end

  # POST /compartimentos
  def create
    @compartimento = Compartimento.new(compartimento_params)

    if @compartimento.save
      render json: @compartimento, status: :created, location: @compartimento
    else
      render json: @compartimento.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /compartimentos/1
  def update
    if @compartimento.update(compartimento_params)
      render json: @compartimento
    else
      render json: @compartimento.errors, status: :unprocessable_entity
    end
  end

  # DELETE /compartimentos/1
  def destroy
    @compartimento.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_compartimento
      @compartimento = Compartimento.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def compartimento_params
      params.require(:compartimento).permit(:name, :patrimonio_id)
    end
end
