class Expense < ActiveRecord::Base
  belongs_to :category
  belongs_to :user

  validates :amount, presence: true
  validates :category, presence: true
  validates :name, presence: true

  delegate :name, to: :category, prefix: true
  delegate :name, to: :user, prefix: true
end
