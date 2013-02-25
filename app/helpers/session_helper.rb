module SessionHelper
  
  def sign_in(user)
    cookies.permanent[:current_user_id] = user.id
    self.current_user = user
  end

  def sign_out_user
    cookies.delete :current_user_id
  end

  def current_user=(user)
    @current_user_id = user
  end
  
  def current_user
    @current_user_id ||= User.find_by_id(cookies[:user_id])
  end

  def signed_in?
    !current_user.nil?
  end

  def redirect_home_if_signed_in
    redirect_to root_path if signed_in?
  end
end