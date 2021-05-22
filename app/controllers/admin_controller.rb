class AdminController < ApplicationController
  def admin
  end
  
  def is_logged_in
    ifloggedin = false
    if(session[:current_user_id])
      ifloggedin = true
    end
  end
  helper_method :is_logged_in
  
  def is_admin
    isAdmin = false
    if(session[:current_user_id] && User.find_by_id(session[:current_user_id]).name == "admin")
      ifloggedin = true
    end
  end
  helper_method :is_admin
  
  def to_main
    redirect_to main_main_path
  end
  helper_method  :to_main
  
end
