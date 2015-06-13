class Api::V1::PotholesController < Api::ApiController
  respond_to :json
  before_action :authenticate, only: [:create, :score]

  def index
    attributes = Hash.new

    attributes[:status] = Pothole.statuses[pothole_params[:status]] if pothole_params[:status].present?
    if pothole_params[:lower_left_longitude].present? && pothole_params[:lower_left_latitude].present? &&
        pothole_params[:upper_right_longitude].present? && pothole_params[:upper_right_latitude].present?

      attributes[:latitude] = (pothole_params[:lower_left_latitude]..pothole_params[:upper_right_latitude])
      attributes[:longitude] = (pothole_params[:lower_left_longitude]..pothole_params[:upper_right_longitude])
    end

    render json: Pothole.where(attributes).all, density: @density

  end

  def show
    respond_with Pothole.find(params[:id]), density: @density
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
    if pothole_params[:pothole_id].blank?
      head status: :bad_request
    else
      pothole = Pothole.find(pothole_params[:pothole_id])
      pothole.score = pothole.score + pothole_params[:score_delta].to_i
      pothole.save

      if pothole.user.present?
        update_user_score(pothole.user_id, pothole_params[:score_delta])
      end

      head status: :ok
    end
  end

  private

  def update_user_score(user_id, score_delta)
    user = User.find(user_id)
    user.score = user.score + score_delta.to_i
    user.save
  end

  def pothole_params
    params.permit(:pothole_id, :id, :name, :latitude, :longitude, :image, :subdomain, :user_id, :score_delta, :status, :lower_left_longitude, :lower_left_latitude, :upper_right_longitude, :upper_right_latitude)
  end

end