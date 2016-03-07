class Api::V1::TasksController < ApplicationController
  before_action :user_exist
  before_action :task_exist, only: [:show, :destroy, :complete]

  def index
    completed_tasks = @user.tasks.where(completed: true)
    pending_tasks = @user.tasks.where(completed: false)
    render json: {completed: completed_tasks, pending: pending_tasks}
  end

  def create
    task = @user.tasks.create(task_params)
    render json: task
  end

  def show
    render json: @task
  end

  def destroy
    @task.destroy
    render json: @task
  end

  def complete
    @task.complete!
    render json: @task
  end

  private

  def user_exist
    @user = User.find_by(id: params[:user_id])
    unless @user
      render json: {error: "user not found"}, status: 404
      return
    end
  end

  def task_params
    params.require(:task).permit(:name, :due_date)
  end

  def task_exist
    @task = @user.tasks.find_by(id: params[:user_id])
    unless @task
      render json: {error: "user not found"}, status: 404
      return
    end

  end

end
