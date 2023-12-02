class Payment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :group_payments, dependent: :destroy

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :author, presence: true
  validates :name, presence: true
end
