class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :groups, class_name: 'Group', foreign_key: 'user_id'
  has_many :payments, class_name: 'Payment', foreign_key: 'user_id'

  validates :name, presence: true, length: {in: 2..250 }

  def admin?
    role == 'admin'
  end
end
