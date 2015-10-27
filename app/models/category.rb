class Category < ActiveRecord::Base
  has_many :expenses, -> { order(created_at: :desc) }

  validates :name, presence: true
  validates :name, uniqueness: true
end
