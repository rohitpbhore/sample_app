class IssuesController < ApplicationController
  # GET /issues
  # GET /issues.json
  before_filter :authenticate_user!, except: [:index, :show, :search]
  def index
    @issues = Issue
    @issues = Issue.order(params[:sort]) if params[:sort]
    @issues = @issues.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @issues }
      format.xml { render xml: @issues }
    end
  end

  # GET /issues/1
  # GET /issues/1.json
  def show
    begin
      @issue = Issue.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      Rails.logger.warn { "Not found" }
      nil
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @issue }
    end
  end

  # GET /issues/new
  # GET /issues/new.json
  def new
    @issue = Issue.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @issue }
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
  # POST /issues.json
  def create
    @issue = Issue.new(params[:issue])

    respond_to do |format|
      if @issue.save
        # IssueMailer.issue_created(@issue).deliver
        format.html { redirect_to @issue, notice: 'Issue was successfully created.' }
        format.json { render json: @issue, status: :created, location: @issue }
      else
        format.html { render action: "new" }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /issues/1
  # PUT /issues/1.json
  def update
    @issue = Issue.find(params[:id])

    respond_to do |format|
      if @issue.update_attributes(params[:issue])
        format.html { redirect_to @issue, notice: 'Issue was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issues/1
  # DELETE /issues/1.json
  def destroy
    @issue = Issue.find(params[:id])
    @issue.destroy
    respond_to do |format|
      format.html { redirect_to issues_url }
      format.js
    end
  end
end
