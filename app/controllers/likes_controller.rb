class LikesController < ApplicationController
  def create
    @like = Like.create(params[:issue])
    @issue = @like.issue
    render :toggle
  end

  def destroy
    like = Like.find(params[:id]).destroy
    @issue = like.issue
    render :toggle
  end
end
