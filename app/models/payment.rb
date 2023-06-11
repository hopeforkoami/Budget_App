class Payment < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :group_payments
  has_many :groups, through: :group_payments

  validates :name, presence: true, length: { in: 2..250 }
  validates :amount, presence: true, numericality: { only_float: true, greater_than_or_equal_to: 0 }
end
