class Admin::BaseController < ApplicationController
  before_action :check_admin

  private

  def check_admin
    redirect_to root_path, alert: t('not_authorized') unless current_user.admin?
  end
end
