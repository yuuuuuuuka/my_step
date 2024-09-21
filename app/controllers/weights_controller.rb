class WeightsController < ApplicationController
  before_action :authenticate_user!

  def index
    period = params[:period]
    @weights = case period
               when '1_week'
                 current_user.weights.where(date: 6.days.ago.to_date..Time.zone.today).select(:date, :weight).order(:date)
               when '1_month'
                 current_user.weights.where(date: 29.days.ago.to_date..Time.zone.today).select(:date, :weight).order(:date)
               when '3_months'
                 current_user.weights.where(date: 90.days.ago.to_date..Time.zone.today).select(:date, :weight).order(:date)
               else
                 current_user.weights.select(:date, :weight).order(:date)
               end
  end

  def new
    @weight = Weight.new
    @user_weights = current_user.weights.all.order(:date)
  end

  def create
    @weight = current_user.weights.build(weight_params)
    if @weight.save
      redirect_to root_path
    else
      @user_weights = current_user.weights.order(date: :desc)
      render :new
    end
  end

  private

  def weight_params
    params.require(:weight).permit(:date, :weight).merge(user_id: current_user.id)
  end
end
