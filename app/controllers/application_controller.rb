class ApplicationController < ActionController::Base
  protect_from_forgery

  layout :none_for_xhr
  def none_for_xhr
    'application' unless request.xhr?
  end

  def stash_referrer
    session[:stash] = request.referrer unless request.referrer == request.path
  end

  def redirect_back_or default
    redirect_to stashed_or(default)
  end

  def stashed_or default
    session[:stash] || default
  end
  helper_method :stashed_or

end
