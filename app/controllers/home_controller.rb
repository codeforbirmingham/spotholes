class HomeController < ApplicationController
  def index
    @potholes = Pothole.all
  end
end