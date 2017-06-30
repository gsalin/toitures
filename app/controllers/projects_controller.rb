class ProjectsController < ApplicationController

  before_action :set_project, only: [:edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
    this_id = current_user.id
    @projects = Project.where(user_id: this_id)
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
    @user = current_user
    this_id = current_user.id
    if @project.user_id != this_id
      redirect_to new_project_path(current_user)
    end

  end

  def update
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
