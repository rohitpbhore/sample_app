class UsersController < ApplicationController
  def show
    @user = User.find_by_id(params[:id])
    Rails.logger.debug @user.inspect
  end
end
