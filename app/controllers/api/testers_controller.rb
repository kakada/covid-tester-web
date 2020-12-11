class Api::TestersController < ::ApplicationController
  skip_before_action :verify_authenticity_token
  
  def create
    TesterJob.perform_later protected_params

    render json: protected_params, status: :ok
  end

  private
  
  def protected_params
    params.permit(:phone_number, :age, :gender, :lab_id, :visited_at)
  end
end
