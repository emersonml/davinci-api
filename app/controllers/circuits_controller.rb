class CircuitsController < ApplicationController
  before_action :set_circuit, only: [:show, :update, :destroy]

  # GET /circuits
  def index
    @circuits = Circuit.all

    render json: @circuits
  end

  # GET /circuits/1
  def show
    render json: @circuit
    # render json: ActiveModelSerializers::Deserialization.jsonapi_parse(@circuit)

    # render json: circuit_params(@circuit)
  end

  # POST /circuits
  def create
    @circuit = Circuit.new(circuit_params)

    if @circuit.save
      render json: @circuit, status: :created, location: @circuit
    else
      render json: @circuit.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /circuits/1
  def update
    if @circuit.update(circuit_params)
      # respond_to :json
      render json: @circuit
      
      # console
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

    ### Only allow a list of trusted parameters through.
  
    # def circuit_params
    #   params.require(:circuit).permit(:sttus, :name, :btn_id, :dev_id)
    # end

    def circuit_params
      # ActiveModelSerializers::Deserialization.jsonapi_parse(params, only: [:sttus])
      ActiveModelSerializers::Deserialization.jsonapi_parse(params)
      # ActiveModel::Serializer::Adapter::JsonApi::Deserialization.parse(params.to_h) 
      # ActiveModel::Serializer::Adapter::JsonApi::Deserialization.parse(params) 
    end

end
