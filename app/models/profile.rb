class Profile < ApplicationRecord
  belongs_to :user
  validates :weight, presence: true

  def bmi
    return nil if height.zero? || weight.zero?

    (weight / (height / 100.0)**2).round(1)
  end
end
