class ProjectsController < ApplicationController

  before_action :require_login

  add_breadcrumb "Proyecto", :projects_path

  def index
    @projects = Project.all.order(created_at: :asc)
  end

  def new
    @project = Project.new
    add_breadcrumb "Nuevo Proyecto", new_project_path
  end

  def create
    @project = Project.new(project_params)
    @project.organization_id = 1
    if  @project.save
      flash[:notice] = "Se guardo satisfactoriamente"
      redirect_to projects_path
    else
      render :new
    end
  end

private

  def project_params
    params.require(:project).permit(:name, :code, :address, :organization_id)
  end
end
