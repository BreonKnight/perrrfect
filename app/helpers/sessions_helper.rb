module SessionsHelper

  #logging user in by session
  def login(user)
    session[:user_id] = user.id
    @current_user = user
  end
  #defining the current user by id upon logging in
  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end
  #is the user logged in?
  def logged_in?
    if current_user == nil
      redirect_to new_session_path
    end
  end
  #session helper to logout
  def logout
    @current_user = session[:user_id] = nil
  end
  
end
