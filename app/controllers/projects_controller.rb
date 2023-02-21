class ProjectsController < ApplicationController
  before_action :authorize_project, only: %i[edit update destroy]

  def index
    @projects = current_user.projects.order(id: :desc)
  end

  def new
    @project = Project.new
  end

  def create
    @project = current_user.owned_projects.create(project_params)
  end

  def update
    project.update(project_params)
  end

  def destroy
    project.destroy

    redirect_to projects_path
  end

  private

  def project
    @project ||= current_user.projects.find(params[:id])
  end
  helper_method :project

  def authorize_project
    authorize project
  end

  def project_params
    params.require(:project)
          .permit(:code, :name)
  end
end
