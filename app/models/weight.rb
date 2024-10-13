class Weight < ApplicationRecord
  belongs_to :user

  validates :weight, presence: true

  validates :date, presence: { message: '日付を入力してください。' }

  def difference_from_goal
    return nil unless goal_weight

    goal_weight - weight
  end
end
