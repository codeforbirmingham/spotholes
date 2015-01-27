class Api::V1::LeaderboardController < Api::ApiController
  respond_to :json

  def show
    respond_with User.all.order(score: :desc), each_serializer: ShortUserSerializer
  end
end