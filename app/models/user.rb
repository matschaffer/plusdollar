class User < ActiveRecord::Base
  attr_accessible :email, :github_username, :name
  has_many :pledges
end
