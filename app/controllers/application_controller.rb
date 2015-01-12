class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.  
  protect_from_forgery with: :exception

  #----------------------------->>
  # for all controllers and view_templates
  helper_method :current_user, :logged_in?, :display_model_class_name_with_slug, :display_model_class_name_with_id

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    access_denied "Must be logged in." unless logged_in?        
  end

  def require_user_of_admin    
    access_denied unless logged_in? && current_user.admin?
  end

  def access_denied(msg = "Permission denied!")
    flash[:error] =  msg
    redirect_to root_path    
  end

  #----------------------------->>

  def display_model_class_name_with_slug(obj)    
    "#{obj.class.name.downcase}-#{obj.slug}"  
  end

  def display_model_class_name_with_id(obj)    
    "#{obj.class.name.downcase}-#{obj.id}"  
  end

  

end
