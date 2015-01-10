class Api::V1::PotholesController < ApplicationController
  respond_to :json

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

end