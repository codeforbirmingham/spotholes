class Api::V1::PotholesController < Api::ApiController
  respond_to :json

  before_action :authenticate, only: [:create, :score]

  def index
    if params[:status].blank?
      respond_with Pothole.all
    else
      respond_with Pothole.where(status: Pothole.statuses[params[:status]]).all
    end
  end

  def show
    respond_with Pothole.find(params[:id])
  end

  def create
    if pothole_params[:name].blank? or pothole_params[:latitude].blank? or pothole_params[:longitude].blank? or pothole_params[:image].blank?
      head status: :bad_request
    else
      pothole = Pothole.new(
          name: pothole_params[:name],
          latitude: pothole_params[:latitude],
          longitude: pothole_params[:longitude],
          image: pothole_params[:image],
          status: Pothole.statuses[:unverified],
          score: 0,
          user_id: @user.id)
      pothole.save

      if pothole.valid?
        head status: :ok
      else
        head status: :bad_request
      end
    end
  end

  def score
    if pothole_params[:id].blank?
      head status: :bad_request
    else
      pothole = Pothole.find(pothole_params[:id])
      pothole.score = pothole.score + pothole_params[:score_delta].to_i
      pothole.save
      update_user_score(pothole_params[:score_delta])

      head status: :ok
    end
  end

  private

  def update_user_score(score_delta)
    @user.score = @user.score + score_delta.to_i
    @user.save
  end

  def pothole_params
    params.permit(:id, :name, :latitude, :longitude, :image, :format, :subdomain, :user_id, :score_delta)
  end

end