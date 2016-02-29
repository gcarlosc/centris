class ProjectsController < ApplicationController

  before_action :require_login

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if  @project.save
      flash[:notice] = "Se guardo satisfactoriamente"
      redirect_to new_project_path
    else
      render :new
    end
  end

private

  def project_params
    params.require(:project).permit(:name, :address, :organization_id)
  end
end
