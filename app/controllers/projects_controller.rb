class ProjectsController < ApplicationController

before_action :set_project

def create

end

def edit

end

def update

end

private

def set_project
  @project = Project.find(params[:project_id])
end

def project_params
  params.require(:project).permit(:title, :description, :cost, :address, :date)
end

end
