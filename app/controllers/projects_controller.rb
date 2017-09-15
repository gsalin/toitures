class ProjectsController < ApplicationController

  before_action :set_project, only: [:edit, :update, :destroy]

  def index
    @projects = Project.all
  end


  def new
    @project = Project.new
    @projects = current_user.projects
  end


  def create
    @projects = current_user.projects
    @project = Project.new(project_params)
    @project.user = current_user
    if @project.save
      redirect_to new_project_path(current_user)
    else
      render :new
    end
  end


  def edit
    @user = current_user
    if @project.user != current_user
      redirect_to new_project_path(current_user)
    end
  end


  def update
    if @project.user != current_user
      redirect_to new_project_path(current_user)
    end

    if @project.update(project_params)
      redirect_to new_project_path(@project)
    else
      render :edit
    end
  end


  def destroy
  @project.destroy
  redirect_to new_project_path(current_user)
  end



  private



  def set_project
    @project = Project.friendly.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description, :cost, :address, :date, project_photos: [])
  end

end
