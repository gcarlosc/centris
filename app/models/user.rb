class User < ActiveRecord::Base

  has_many :movements, foreign_key: :creator_id

  before_save :to_lower

  validates :fullname, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  def to_lower
    self.email.downcase!
    self.fullname.downcase!
  end
end
