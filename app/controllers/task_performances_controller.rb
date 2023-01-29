class TaskPerformancesController < ApplicationController
  before_action :authorize_access, only: %i[destroy complete]

  def index
    @task_performances = task.performances

    case params[:scope]
    when 'active'
      @task_performances = @task_performances.active
    when 'completed'
      @task_performances = @task_performances.completed
    when 'future'
      @task_performances = @task_performances.future
    when 'past'
      @task_performances = @task_performances.past
    end
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

  def task
    @task ||= Task.find(params[:task_id])
  end
  helper_method :task

  def task_performance
    @task_performance ||= task.performances.find_by!(id: params[:id])
  end
  helper_method :task_performance
end
