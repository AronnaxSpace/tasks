class TaskEventsController < ApplicationController
  def index
    @task_events = task.task_events
  end

  def new
    @task_event = TaskEvent.new
  end

  def create
    @task_event = task.task_events.new(task_event_params)
    task_event.user = current_user

    task_event.save
  end

  def destroy
    task_event.destroy
  end

  private

  def task_event_params
    params.require(:task_event).permit(:start_at, :end_at)
  end

  def task
    @task ||= Task.find(params[:task_id])
  end
  helper_method :task

  def task_event
    @task_event ||= task.task_events.find_by!(id: params[:id])
  end
  helper_method :task_event
end
