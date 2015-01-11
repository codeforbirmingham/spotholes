class Api::V1::PotholesController < Api::ApiController
  respond_to :json


  # before_action :authenticate, only: [:create]

  def index
    if params[:status].blank?
      respond_with Pothole.all, root: false
    else
      respond_with Pothole.where(status: Pothole.statuses[params[:status]]).all, root: false
    end
  end

  def show
    respond_with Pothole.find(params[:id]), root: false
  end

  def create
    if pothole_params[:name].blank? or pothole_params[:latitude].blank? or pothole_params[:longitude].blank? or pothole_params[:image].blank?
      head status: :bad_request
    else
      @pothole = Pothole.new(name: pothole_params[:name], latitude: pothole_params[:latitude], longitude: pothole_params[:longitude], image: pothole_params[:image], status: Pothole.statuses[:unverified], score: 0, user_id: @user.id)
      @pothole.save

      unless @pothole
        head status: :bad_request
      end
      head status: :ok
    end
  end

  private

  def pothole_params
    params.permit(:name, :latitude, :longitude, :image, :format, :subdomain)
  end

end