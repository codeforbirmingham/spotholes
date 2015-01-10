class Api::V1::PotholesController < Api::ApiController
  respond_to :json

  before_action :authenticate, only: [:create]

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
    @pothole = Pothole.create(pothole_params)
  end

  def pothole_params
    params.require(:name).require(:longitude).require(:latitude)
  end

end