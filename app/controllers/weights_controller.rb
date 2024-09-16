class WeightsController < ApplicationController
  before_action :authenticate_user!

  def index
    @weights = current_user.weights.select(:date, :weight).order(:date)
  end

  def filter
    period = params[:period]
    @filtered_weights = case period
                        when '1_week'
                          current_user.weights.where('date >= ?', 1.week.ago).select(:date, :weight).order(:date)
                        when '1_month'
                          current_user.weights.where('date >= ?', 1.month.ago).select(:date, :weight).order(:date)
                        when '3_months'
                          current_user.weights.where('date >= ?', 3.months.ago).select(:date, :weight).order(:date)
                        else
                          current_user.weights.select(:date, :weight).order(:date)
                        end

    respond_to do |format|
      format.js { render 'chart' }
    end
  end

  def new
    @weight = Weight.new
  end

  def create
    @weight = current_user.weights.build(weight_params)
    if @weight.save
      redirect_to weights_path, notice: '体重を記録しました。'
    else
      render :new
    end
  end

  private

  def weight_params
    params.require(:weight).permit(:date, :weight).merge(user_id: current_user.id)
  end
end
