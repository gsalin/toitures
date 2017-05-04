class ProjectsController < ApplicationController


before_action :set_project, only: [:edit, :update, :destroy]

def index
  @projects = Project.all
end

def new
  @project = Project.new
  id = current_user.id
  @projects = Project.where(user_id: id)
end

def create
  @project = Project.new(project_params)
  @project.user = current_user
  if @project.save
    redirect_to new_project_path(current_user)
  else
    render :new
  end
end

def edit
  id = current_user.id
  @project = Project.find(params[:id])
  if @project.user_id != id
    redirect_to new_project_path(current_user)
  end
end

def update
  @project = Project.find(params[:id])
  @project.update(project_params)

  redirect_to new_project_path(current_user)
end

  def destroy
  @project.destroy

  redirect_to new_project_path(current_user)
  end

private

def set_project
  @project = Project.find(params[:id])
end

def project_params
  params.require(:project).permit(:title, :description, :cost, :address, :date, photos_projet_1: [], photos_projet_2: [], photos_projet_3: [], photos_projet_4: [])
end

end
