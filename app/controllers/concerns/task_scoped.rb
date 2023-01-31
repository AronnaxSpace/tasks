module TaskScoped
  extend ActiveSupport::Concern

  included do
    before_action :authorize_task
    helper_method :task
  end

  private

  def task
    @task ||= Task.find(params[:task_id])
  end

  def authorize_task
    authorize task, :show?
  end

  def check_task_owner
    redirect_to task_path(task) unless current_user == task.user
  end
end
