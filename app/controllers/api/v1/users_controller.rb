class Api::V1::UsersController < Api::ApiController
  respond_to :json

  def show
    if user_params[:imei].blank?
      head status: :bad_request
    else
      @user = User.find_by_imei(user_params[:imei])

      if @user.blank?
        head status: :not_found
      else
        respond_with @user, root: false
      end
    end
  end

  def create
    if user_params[:name].blank? or user_params[:imei].blank?
      head status: :bad_request
    else
      respond_with User.create(name: user_params[:name], imei: user_params[:imei], score: 0), root: false, location: nil
    end
  end

  def user_params
    params.permit(:name, :imei, :format, :subdomain)
  end
end
