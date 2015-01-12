module ApplicationHelper
  def fix_url(str)
    if str.starts_with?('http://') || str.starts_with?('https://')
      str    
    else
      "http://#{str}"
    end
  end

  def display_datetime(dt) 
    if logged_in? && !current_user.time_zone.blank?
      dt = dt.in_time_zone(current_user.time_zone)
    end  
    dt.strftime("at %m/%d/%y %l:%M:%P %Z") 
  end

 
end
