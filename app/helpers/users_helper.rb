def current_user
  if session[:id]
    User.find(session[:id])
  end
end

def logged_in?
  !!current_user
end
