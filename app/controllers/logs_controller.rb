class LogsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  before_action :move_to_index, except: [:index, :show, :destroy]
  before_action :correct_user, only: [:show, :edit, :update, :destroy]

  def index
    @logs = current_user.logs
  end

  def new
    @log = Log.new
  end

  def create
    @log = Log.new(log_params)
    @log.calculate_calories
    if @log.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @log = Log.find(params[:id])
    @logs = current_user.logs
  end

  def edit
    @log = Log.find(params[:id])
  end

  def update
    @log = Log.find(params[:id])
    if @log.update(log_params)
      redirect_to root_path, notice: '運動記録が更新されました。'
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
    params.require(:log).permit(:date, :name, :duration, :reps, :memo).merge(user_id: current_user.id)
  end

  def move_to_index
    return if user_signed_in?

    redirect_to action: :index
  end

  def correct_user
    @log = current_user.logs.find_by(id: params[:id])
    return unless @log.nil?

    redirect_to logs_path
  end
end
