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
    if stash = session[:stash]
      session[:stash] = nil
      redirect_to stash
    else
      redirect_to default
    end
  end
end
