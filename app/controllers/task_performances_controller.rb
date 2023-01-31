class TaskPerformancesController < ApplicationController
  before_action :authorize_access, only: %i[destroy complete]
  before_action :authorize_task_owner, only: %i[new create]

  def index
    @active_performances = task.performances.active
    @future_performances = task.performances.future
    @completed_performances = task.performances.completed
    @expired_performances = task.performances.expired
  end

  def new
    @task_performance = TaskPerformance.new
  end

  def create
    @task_performance = task.performances.new(task_performance_params)
    task_performance.user = current_user

    task_performance.save
  end

  def destroy
    task_performance.destroy
  end

  def complete
    redirect_to tasks_path, alert: t('.failure') and return unless task_performance.pending?

    task_performance.comment = task_performance_complete_params[:comment]
    task_performance.complete!
  end

  private

  def task_performance_params
    params.require(:task_performance).permit(:start_at, :end_at)
  end

  def task_performance_complete_params
    params.require(:task_performance).permit(:comment)
  end

  def authorize_access
    authorize task_performance
  end

  def authorize_task_owner
    redirect_to task_path(task) unless current_user == task.user
  end

  def task
    @task ||= Task.find(params[:task_id])
  end
  helper_method :task

  def task_performance
    @task_performance ||= task.performances.find_by!(id: params[:id])
  end
  helper_method :task_performance
end
