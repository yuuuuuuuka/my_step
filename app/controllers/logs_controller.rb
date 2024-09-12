class LogsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  def index
    @logs = Log.all
  end

  def new
    @log = Log.new
  end

  def create
    @log = Log.new(log_params)
    if @log.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @log = Log.find(params[:id])
    @logs = Log.all
  end

  def edit
  end

  def update
  end

  private

  def log_params
    params.require(:log).permit(:date, :name, :duration, :reps, :memo).merge(user_id: current_user.id)
  end

  def move_to_index
    return if user_signed_in?

    redirect_to action: :index
  end
end
