class Group < ApplicationRecord
  has_many :group_payments, dependent: :destroy
  has_many :payments, through: :group_payments
  belongs_to :user

  validates :name, presence: true
  validates :user, presence: true
  validates :icon, presence: true
end
