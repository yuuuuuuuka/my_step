class LogsController < ApplicationController
  # before_action :authenticate_user!, only: [:new, :create, :show, :edit, :update, :destroy]
  before_action :move_to_index, except: [:index, :show, :destroy]
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  before_action :set_log, only: [:show, :edit, :update]

  def index
    @logs = current_user&.logs || []
  end

  def new
    @log = Log.new
  end

  def create
    @log = Log.new(log_params)
    @log.calculate_calories
    respond_to do |format|
      if @log.invalid? || current_user&.profile&.weight.blank?
        flash[:alert] = '体重を登録してください。' if current_user&.profile&.weight.blank?
        format.json { render json: @log.errors, status: :unprocessable_entity }
        format.html { redirect_to new_user_profile_path(current_user) }

      else
        @log.save
        format.json { render json: { message: '記録が成功しました！' }, status: :created }
        format.html { redirect_to root_path, notice: '記録が成功しました！' }
        format.turbo_stream
      end
    end
  end

  def show
    @logs = current_user.logs
  end

  def edit
  end

  def update
    @log = Log.find(params[:id])
    if @log.update(log_params)
      redirect_to log_path(@log)
    else
      render :edit
    end
  end

  def destroy
    log = Log.find(params[:id])
    return unless log.user == current_user

    log.destroy
    redirect_to root_path
  end

  private

  def log_params
    params.require(:log).permit(:date, :name, :duration, :reps, :memo).merge(user_id: current_user&.id)
  end

  def move_to_index
    return if user_signed_in? || action_name == 'new'

    redirect_to action: :index
  end

  def correct_user
    @log = current_user.logs.find_by(id: params[:id])
    return unless @log.nil?

    redirect_to logs_path
  end

  def set_log
    @log = Log.find(params[:id])
  end
end
