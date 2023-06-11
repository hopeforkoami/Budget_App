class SplashController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    redirect_to group_index_path if user_signed_in?
  end

  def logout
    sign_out current_user
    redirect_to splash_index_path
  end
end
