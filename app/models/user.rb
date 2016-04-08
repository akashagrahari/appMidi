class User < ActiveRecord::Base

  has_many :tracks
  enum type: [:default, :premium]

  has_secure_password

  scope :email, lambda {|email| where(:email => email)}


end
