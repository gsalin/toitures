module UsersHelper
  def format_phone_number(number)
    cleaned_number = number.gsub(' ', '')
    regex = /(?:(?:\+|00)33|0)([1-9])(\d{2})(\d{2})(\d{2})(\d{2})/
    match_data = cleaned_number.match(regex)

    "0#{match_data[1]} #{match_data[2]} #{match_data[3]} #{match_data[4]} #{match_data[5]}"
  end
end
