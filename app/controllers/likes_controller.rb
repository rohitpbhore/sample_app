class LikesController < ApplicationController

  before_filter :authenticate_user!

  def create
    @like = Like.create(params[:like])
    @issue = @like.issue
    render :toggle
  end

  def destroy
    like = Like.find(params[:id]).destroy
    @issue = like.issue
    render :toggle
  end
end
