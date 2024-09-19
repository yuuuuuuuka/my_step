class Log < ApplicationRecord
  belongs_to :user

  validates :date, presence: { message: '運動を行った日付を入力してください。' }
  validates :duration, numericality: { only_integer: true, greater_than_or_equal_to: 0, message: '運動時間は0分以上の整数値を入力してください。' }
  validates :reps, numericality: { only_integer: true, greater_than: 0, message: '回数は1回以上の整数値を入力してください。' }
  validates :name, presence: { message: '運動した名前を入力してください' }, length: { minimum: 2, maximum: 50 }

  def calculate_calories
    user_weight = user.profile&.weight
    if user_weight.nil?
      errors.add(:user, 'ユーザーの体重が設定されていません')
      return
    end

    calories_per_minute = case name
                          when 'ランニング'
                            10 # 1分あたり10kcal消費
                          when '縄跳び'
                            8
                          when '散歩'
                            5  # 1分あたり5kcal消費
                          when '腹筋'
                            3  # 1分あたり8kcal消費
                          when 'プランク'
                            2
                          else
                            4  # その他の運動は1分あたり4kcal
                          end

    # 消費カロリーを計算 (運動時間×体重の調整×運動係数)
    self.calories_burned = (calories_per_minute || 0) * (duration || 0) * ((user_weight || 50) / 50.0)
  end
end
