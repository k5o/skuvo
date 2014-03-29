class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  def no_photo
    flash[:notice] = "Image not found. Check the url again, or it may have been deleted."
    redirect_to root_path
  end

  def no_photo?(url)
    !url.blank? and !Photo.exists?(:short_url => url)
  end

  def no_user
    flash[:notice] = "No user by that name exists."
    redirect_to root_path
  end

  def no_user?(name)
    !name.blank? and !User.exists?(:username => name)
  end

  protected
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
