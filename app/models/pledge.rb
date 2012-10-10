class Pledge < ActiveRecord::Base
  belongs_to :user
  attr_accessible :amount, :issue_title, :issue_url, :user_id, :user
  
  def user_name
    user.name if user
  end
end
