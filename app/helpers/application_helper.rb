module ApplicationHelper
  def current_user_time
    Time.current.in_time_zone(current_user.profile.time_zone)
  end

  def datetime_format(datetime)
    format = if datetime.year != Time.current.year
               '%d %b %Y, %H:%M'
             else
               '%d %b %H:%M'
             end

    datetime.strftime(format)
  end
end
