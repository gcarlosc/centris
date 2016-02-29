class User < ActiveRecord::Base

  before_save :to_lower

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  def to_lower
    self.email.downcase!
    self.fullname.downcase!
  end
end
