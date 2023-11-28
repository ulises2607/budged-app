class Payment < ApplicationRecord
  belongs_to :user, foreign_key: :author

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :author, presence: true

end
