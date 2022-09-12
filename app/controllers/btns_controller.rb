class BtnsController < ApplicationController
  before_action :set_btn, only: [:show, :update, :destroy]

  # GET /btns
  def index
    @btns = Btn.all

    render json: @btns

  end

  # GET /btns/1
  def show
    render json: @btn, 
      include: [:kindbtn]
      # meta: { author: "Emerson Marques"}
  end

  # POST /btns
  def create
    @btn = Btn.new(btn_params)

    if @btn.save
      render json: @btn, status: :created, location: @btn
    else
      render json: @btn.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /btns/1
  def update
    if @btn.update(btn_params)
      render json: @btn
    else
      render json: @btn.errors, status: :unprocessable_entity
    end
  end

  # DELETE /btns/1
  def destroy
    @btn.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_btn
      @btn = Btn.find(params[:id])
    end

    #### Only allow a list of trusted parameters through.
    # def btn_params
    #   params.require(:btn).permit(
    #     :sttus, 
    #     :name, 
    #     :kindbtn_id
    #   )
    # end
    def btn_params
      ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    end
end
