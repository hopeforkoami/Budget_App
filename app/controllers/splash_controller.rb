class SplashController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    redirect_to group_index_path if user_signed_in?
  end
end