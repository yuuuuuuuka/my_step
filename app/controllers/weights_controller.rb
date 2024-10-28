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
    @latest_weight = current_user.weights.order(date: :desc).first
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

  def update
    @weight = Weight.find(params[:id])

    # params[:field] でどのフィールドを更新するかを確認
    if params[:field] == 'date'
      @weight.update(date: Date.parse(params[:value]))
    elsif params[:field] == 'weight'
      @weight.update(weight: params[:value])
    end

    # 成功時にはJSONでレスポンスを返す
    render json: { success: true }
  end

  def destroy
    @weight = current_user.weights.find(params[:id])

    respond_to do |format|
      if @weight.destroy
        format.html { redirect_to weights_path, notice: 'Weight was successfully deleted.' }
        format.json { head :no_content }
      else
        format.html { redirect_to weights_path, alert: 'Failed to delete weight.' }
        format.json { render json: { success: false, errors: @weight.errors.full_messages }, status: :unprocessable_entity }
      end
    end
  end

  private

  def weight_params
    params.require(:weight).permit(:date, :weight, :goal_weight).merge(user_id: current_user.id)
  end
end
