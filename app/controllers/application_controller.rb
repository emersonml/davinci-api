class ApplicationController < ActionController::API
  


  before_action :status, :ensure_json_request

  def ensure_json_request
    return if request.headers["Accept"] =~ /vnd\.api\+json/
    render :nothing => true, :status => 406

  end


  def statusx
    @status = 'on'
    # render json: @status, status: :ok
    render json: @status
  end

end
