class User < ActiveRecord::Base
  include BCrypt
  has_many :symptoms

  validates :username, :email, :phone, :password, presence: true
  validates :email, :username, uniqueness: true

  #password handling and user auth
  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
