class Pledge < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  
  attr_accessible :amount, :title, :issue_url, :user_id, :user, :project_id
  
  validates :amount, presence: true
  
  def user_name
    user.name if user
  end
end
