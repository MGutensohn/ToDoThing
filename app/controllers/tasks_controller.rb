class TasksController < ApplicationController

  def update
    set_task
    if !@task.completed
      @task.update_attribute(:completed, true)
    else
      @task.update_attribute(:completed, false)
    end
    redirect_to lists_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end
end
