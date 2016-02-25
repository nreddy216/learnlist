class User < ActiveRecord::Base

  #using bcrypt
  has_secure_password

  #Rubular regex - for valid email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, length: {maximum: 255},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}

  validates :first_name, presence: true, length: {maximum: 50}

  validates :password, presence: true, length: {minimum: 6}

end