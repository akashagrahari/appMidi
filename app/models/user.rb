class User < ActiveRecord::Base

  has_many :tracks
  enum type: [:default, :premium]

  scope :email, lambda {|email| where(:email => email)}


end
