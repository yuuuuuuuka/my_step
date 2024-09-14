module ApplicationHelper
  def bmi_category(bmi)
    case bmi
    when 0...18.5
      '低体重'
    when 18.5...25
      '普通体重'
    when 25...30
      '肥満（1度）'
    when 30...35
      '肥満（2度）'
    when 35...40
      '肥満（3度）'
    else
      '肥満（4度）'
    end
  end
end
