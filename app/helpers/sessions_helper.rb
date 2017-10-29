module SessionsHelper

  def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    # The same
    # cookies[:remember_token] = { value: remember_token, expires: 20.years.from_now.utc }
    user.update_attribute(:remember_token, User.encrypt(remember_token))
    self.current_user = user
  end

  def signed_in?
    !current_user.nil?
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    remember_token = User.encrypt(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  def current_user?(user)
    user == current_user
  end

  def sign_out
    current_user.update_attribute(:remember_token,
                                  User.encrypt(User.new_remember_token))
    cookies.delete(:remember_token)
    self.current_user = nil
  end

  # Alternative implementation

  # # Logs in the given user.
  # def log_in(user)
  #   session[:user_id] = user.id
  # end
  #
  # # Returns the current logged-in user (if any).
  # def current_user
  #   @current_user ||= User.find_by(id: session[:user_id])
  # end
  #
  # # Returns true if the user is logged in, false otherwise.
  # def logged_in?
  #   !current_user.nil?
  # end
end
