class CommentsController < ApplicationController
  def create
    @issue = Issue.find(params[:issue_id])
    @comment = @issue.comments.create(comment_params)
    respond_to do |format|
      format.html { redirect_to issue_path(@issue) }
      format.js
    end
  end

  def destroy
    @issue = Issue.find(params[:issue_id])
    @comment = @issue.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to issue_path(@issue) }
      format.js
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id)
  end
end
