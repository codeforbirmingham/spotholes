class Api::ApiController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def default_serializer_options
    {root: false}
  end

  private

  def authenticate
    api_key = request.headers['X-Api-Key']
    @user = User.where(api_key: api_key).first if api_key

    unless @user
      head status: :unauthorized
    end
  end
end