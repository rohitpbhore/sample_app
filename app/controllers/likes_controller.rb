class LikesController < ApplicationController

  before_filter :authenticate_user!

  def create
    @like = Like.create(like_params)
    @issue = @like.issue
    render :toggle
  end

  def destroy
    like = Like.find(params[:id]).destroy
    @issue = like.issue
    render :toggle
  end

  private

  def like_params
    params.require(:like).permit(:issue_id, :user_id)
  end
end
