class User < ActiveRecord::Base
  attr_accessor :password_digest, :password
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :password, :presence => true
  validates :password, length: { in: 6..20 }
  validates_confirmation_of :password
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  has_secure_password
end
