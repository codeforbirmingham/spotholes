class Api::V1::UsersController < Api::ApiController
  respond_to :json

  before_action :authenticate, only: [:report]

  def show
    if user_params[:imei].blank?
      head status: :bad_request
    else
      @user = User.find_by_imei(user_params[:imei])

      if @user.blank?
        head status: :not_found
      else
        respond_with @user
      end
    end
  end

  def create
    if user_params[:name].blank? or user_params[:imei].blank?
      head status: :bad_request
    else
      respond_with User.create(name: user_params[:name], imei: user_params[:imei], score: 0), location: nil
    end
  end

  def report
    respond_with Pothole.where(user_id: @user.id).order(score: :desc), each_serializer: ShortPotholeSerializer
  end

  def user_params
    params.permit(:name, :imei, :subdomain)
  end
end
