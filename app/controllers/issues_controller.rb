class IssuesController < ApplicationController
  # GET /issues
  before_filter :authenticate_user!, except: [:index, :show, :search]
  def index
    @issues = Issue
    @issues = @issues.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /issues/1
  def show
    begin
      @issue = Issue.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      Rails.logger.warn { "Not found" }
      nil
    end

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /issues/new
  def new
    @issue = Issue.new
    respond_to do |format|
      format.html # new.html.erb
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
    @issue = Issue.new(params[:issue])

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
      if @issue.update_attributes(params[:issue])
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
end
