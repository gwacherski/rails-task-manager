class TasksController < ApplicationController

  def index
   @tasks = Task.all
 end

  def details
   @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save!

    redirect_to tasks_path(@task)
  end

  def edit

  end

  def update
    @task.update(task_params)

    redirect_to task_details_path(@task)
  end

end

private

  def task_params
    params.require(:task).permit(:title, :details)
  end

  def set_task
    @task = Task.find(params[:id])
  end
