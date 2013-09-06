class User < ActiveRecord::Base
  has_many :messages
  has_many :contacts
  has_many :numbers
end
