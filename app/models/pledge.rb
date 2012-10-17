class Pledge < ActiveRecord::Base
  belongs_to :user
  attr_accessible :amount, :title, :issue_url, :user_id, :user
  
  validates :amount, presence: true
  
  def user_name
    user.name if user
  end
end
