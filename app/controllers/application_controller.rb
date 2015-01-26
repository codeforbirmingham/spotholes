class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  def user_for_paper_trail
    # Save the user responsible for the action
    admin_user_signed_in? ? current_admin_user.id : AdminUser.all.first.id
  end

end
