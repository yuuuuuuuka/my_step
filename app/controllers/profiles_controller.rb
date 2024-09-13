class ProfilesController < ApplicationController
  before_action :move_to_index, only: [:index, :show]

  def index
    @profiles = Profile.all
  end

  def new
    @profile = Profile.new
  end

  # BMI計算を実行して結果を表示
  def create
    @profile = Profile.create(profile_params)
    if @profile.height.present? && @profile.weight.present?

      redirect_to user_profile_path(current_user, @profile)
    else
      render :new
    end
  end

  def show
    @profile = Profile.find(params[:id])
    @bmi = @profile.bmi
  end

  private

  def profile_params
    params.require(:profile).permit(:height, :weight, :goal_weight).merge(user_id: current_user.id)
  end

  def move_to_index
    return unless user_signed_in? && @profile.present? && current_user.id != @profile.id

    redirect_to root_path
  end
end
