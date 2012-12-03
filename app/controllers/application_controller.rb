class ApplicationController < ActionController::Base
  protect_from_forgery

  layout :none_for_xhr
  def none_for_xhr
    'application' unless request.xhr?
  end
end
