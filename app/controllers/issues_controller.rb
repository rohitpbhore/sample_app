class IssuesController < ApplicationController
  # GET /issues
  before_filter :authenticate_user!, except: [:index, :show, :search]
  def index
    # @issues = Issue
    # @issues = @issues.all

    # @query = Issue.search do
    #   fulltext params[:search]
    # end
    # @issues = @query.results
    if params[:search] == nil
      @issues = Issue.all
    else
      @search = Issue.search do
        fulltext params[:search]
      end
      @issues = @search.results
    end

    respond_to do |format|
      format.html
      format.json { render json: @issues }
    end
  end

  # GET /issues/1
  def show
    begin
      @issue = Issue.find(params[:id])

      @u = Like.joins(:issue, :user).where('issue_id' => params[:id])
      @followers = []
      @u.each do |y|
        @records = User.where(:id => "#{y.user_id}")
        @followers += User.where(id: @records.map {|i| i.id })
      end

    rescue ActiveRecord::RecordNotFound
      Rails.logger.warn { "Not found" }
      nil
    end

    respond_to do |format|
      format.html
    end
  end

  # GET /issues/new
  def new
    @issue = Issue.new
    respond_to do |format|
      format.html
    end
  end

  # GET /issues/1/edit
  def edit
    @issue = Issue.find(params[:id])
  end

  def search
    @issue = Issue.find_by_title(params[:search_con])
    redirect_to @issue if @issue.present?
  end

  # POST /issues
  def create
    @issue = Issue.new(issue_params)

    respond_to do |format|
      if @issue.save
        # IssueMailer.issue_created(@issue).deliver
        format.html { redirect_to @issue, notice: 'Post was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /issues/1
  def update
    @issue = Issue.find(params[:id])

    respond_to do |format|
      if @issue.update_attributes(issue_params)
        format.html { redirect_to @issue, notice: 'Post was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /issues/1
  def destroy
    @issue = Issue.find(params[:id])
    @issue.destroy
    respond_to do |format|
      format.html { redirect_to issues_url }
      format.js
    end
  end

  private

  def issue_params
    params.require(:issue).permit(:user_id, :description, :title, comments_attributes: [:body, :user_id], likes_attributes: [:issue_id, :user_id])
  end
end
