class StaticController < ApplicationController
  unloadable

  before_filter :find_project, :authorize

  def index
    @contents = Content.find :all
    @content  = Content.new
  end

  def show
    @content = Content.find params[:id]
  end

  def new_content
    begin
      success = true
      @content = Content.create(params[:content])
      @content.project = @project
      @content.save!
    rescue Exception => e
      success = false
      @contents = Content.find :all
      render :action => :index
    end

    redirect_to :action => :show,
                :id => @content.id,
                :project_id => params[:content][:project_id] if success
  end

  def delete_content
    @content = Content.find(params[:id])
    @content.delete unless @content.nil?
    redirect_to :action => :index, :project_id => @project.id
  end

  private
  def find_project
    if !params[:id].nil?
      @project = Content.find(params[:id]).project
    elsif !params[:project_id].nil?
      @project = Project.find(params[:project_id])
    elsif !params[:content].nil? && !params[:content][:project_id].nil?
      @project = Project.find(params[:content][:project_id])
    end
  end

end
