class ApplicationController < ActionController::Base
  include Pundit::Authorization

  before_action :authenticate_user!

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def aronnax_oauth_client
    @aronnax_oauth_client ||= OAuth2::Client.new(
      ENV.fetch('ARONNAX_APP_ID'),
      ENV.fetch('ARONNAX_APP_SECRET'),
      site: ENV.fetch('ARONNAX_APP_URL')
    )
  end

  def aronnax_access_token
    @aronnax_access_token ||=
      if current_user
        OAuth2::AccessToken.new(
          aronnax_oauth_client, current_user.aronnax_access_token
        )
      end
  end

  def user_not_authorized
    redirect_to root_path, alert: t('not_authorized')
  end
end
