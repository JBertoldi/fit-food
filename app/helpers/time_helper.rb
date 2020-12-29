module TimeHelper
  def format_time(total_min)
    min = total_min % 60
    hours = (total_min - min) / 60

    if min.zero?
      "#{hours}h"
    elsif total_min > 60
      "#{hours}h#{format '%02d', min}"
    else
      "#{total_min} min"
    end
  end
end
