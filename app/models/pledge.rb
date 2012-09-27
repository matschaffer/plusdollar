class Pledge < ActiveRecord::Base
  attr_accessible :amount, :issue_title, :issue_url
  belongs_to :user
  belongs_to :project
end
