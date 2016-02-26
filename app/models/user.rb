class User < ActiveRecord::Base

  has_many :lists, dependent: :destroy
  has_many :items, through: :lists 

  #using bcrypt
  has_secure_password


  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user.try(:authenticate, params[:password])
  end

  #Rubular regex - for valid email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, length: {maximum: 255},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}

# Bug with Rails 4 - not using Devise,  first name blank error
  validates :first_name, presence: true, length: {maximum: 50}

  validates :password, presence: true, length: {minimum: 6}

end
