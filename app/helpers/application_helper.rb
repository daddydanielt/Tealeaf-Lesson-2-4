module ApplicationHelper
  def fix_url(str)
    if str.starts_with?('http://') || str.starts_with?('https://')
      str    
    else
      "http://#{str}"
    end
  end

  def display_datetime(dt)
    dt.strftime("at %m/%d/%y %l:%M:%P %Z") 
  end

end
