class CommentsController < ApplicationController
  def create
    @issue = Issue.find(params[:issue_id])
    @comment = @issue.comments.create(params[:comment])
    respond_to do |format|
      format.html { redirect_to issue_path(@issue) }
      format.js
    end
  end

  def destroy
    @issue = Issue.find(params[:issue_id])
    @comment = @issue.comments.find(params[:id])
    @comment.destroy
    redirect_to issue_path(@issue)
  end
end
