### teste dev:migrations
class Api::CircuitsController < ApplicationController
  before_action :set_circuit, only: [:show, :update, :destroy]

  # GET /circuits
  def index
    @circuits = Circuit.all

    render json: @circuits
  end

  # GET /circuits/1
  def show
    render json: @circuit
  end

  # POST /circuits
  def create
    @circuit = Circuit.new(circuit_params)

    if @circuit.save
      render json: @circuit, status: :created, location: api_circuit_path(@circuit)
    else
      render json: @circuit.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /circuits/1
  def update
    if @circuit.update(circuit_params)
      render json: @circuit
    else
      render json: @circuit.errors, status: :unprocessable_entity
    end
  end

  # DELETE /circuits/1
  def destroy
    @circuit.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_circuit
      @circuit = Circuit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    # def circuit_params
    #   params.require(:circuit).permit(:sttus, :name, :description, :compartimento_id, :kindbtn_id, :kinddev_id)
    # end
    def circuit_params
      ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    end
end
