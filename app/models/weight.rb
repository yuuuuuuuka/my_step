class Weight < ApplicationRecord
  belongs_to :user
  validates :weight, presence: true
  validates :date, presence: { message: '日付を入力してください。' }
end
