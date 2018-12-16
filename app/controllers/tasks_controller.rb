class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def new
  end

  def create
    if Task.create(create_params)
      flash[:notice] = "New task created succesfully"
      redirect_to tasks_path
    else
      flash[:error] = "An error have ocurred"
      redirect_to 'new'
    end
  end

  private
  def create_params
    params.require(:task).permit(:description, :priority).merge(status: "pending")
  end
end
