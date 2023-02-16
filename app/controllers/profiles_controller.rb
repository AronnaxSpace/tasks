class ProfilesController < ApplicationController
  skip_before_action :setup_profile, only: %i[new create]
  before_action :check_profile, only: %i[new create]

  def new
    @profile = Profile.new

    render layout: 'profile'
  end

  def create
    @profile = current_user.build_profile(profile_params)

    if profile.save
      redirect_to root_path, notice: t('.success')
    else
      render :new, layout: 'profile', status: :unprocessable_entity
    end
  end

  def update
    if profile.update(profile_params)
      redirect_to root_path, notice: t('.success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def profile_params
    params.require(:profile)
          .permit(:nickname, :time_zone)
  end

  def profile
    @profile ||= current_user.profile
  end
  helper_method :profile

  def check_profile
    redirect_to edit_profile_path if profile
  end
end
