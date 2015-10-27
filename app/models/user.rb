class User < ActiveRecord::Base
  has_many :expenses, -> { order(created_at: :desc) }

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
end
