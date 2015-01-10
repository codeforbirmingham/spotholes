module Api
  module V1
    class PotholesController < ApplicationController

      respond_to :json

      def index
        respond_with Pothole.all
      end

      def show
        respond_with Pothole.find(params[:id])
      end
    end
  end
end