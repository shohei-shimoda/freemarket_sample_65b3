module ItemsHelper

  #金額にコンマを入れるための記述です！
  def number_to_currency(price)
    "¥#{price.to_s(:delimited, delimiter: ',')}"
  end
  
end
