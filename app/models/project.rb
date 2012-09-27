class Project < ActiveRecord::Base
  attr_accessible :name, :url
  has_many :pledges
  has_many :user, :through => :pledges
end
