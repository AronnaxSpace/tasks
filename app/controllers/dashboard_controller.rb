class DashboardController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    redirect_to user_session_path and return unless user_signed_in?

    @my_tasks = current_user.assigned_tasks
    @tasks = current_user.tasks
  end
end
