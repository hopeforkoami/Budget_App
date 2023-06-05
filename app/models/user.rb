class User < ApplicationRecord
  has_many :groups, class_name: 'Group', foreign_key: 'user_id'

  validates :name, presence: true, length: {in: 2..250 }
end
