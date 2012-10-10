class Pledge < ActiveRecord::Base
  belongs_to :user
  attr_accessible :amount, :issue_title, :issue_url
end
