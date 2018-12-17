class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def new
  end

  def create
    if Task.create(task_params)
      flash[:notice] = "New task created succesfully"
      redirect_to tasks_path
    else
      flash[:error] = "An error has ocurred"
      redirect_to 'new'
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:notice] = "The task was updated!"
      redirect_to tasks_path
    else
      flash[:error] = "An error has ocurred"
      redirect_to edit_task_path(@task)
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    flash[:alert] = "The task was deleted"
    redirect_to tasks_path
  end

  private
  def task_params
    params.require(:task).permit(:description, :priority, :status)
  end
end
