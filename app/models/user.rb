class User < ApplicationRecord
  has_many :payments, dependent: :destroy
  has_many :groups, dependent: :destroy

  validates :name, presence: true
end
