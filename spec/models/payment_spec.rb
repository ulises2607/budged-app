require 'rails_helper'

RSpec.describe Payment, type: :model do
  it 'is valid with valid attributes' do
    payment = build(:payment)
    expect(payment).to be_valid
  end

  it 'is invalid without an amount' do
    payment = build(:payment, amount: nil)
    payment.valid?
    expect(payment.errors[:amount]).to include("can't be blank")
  end

  it 'is invalid with a non-positive amount' do
    payment = build(:payment, amount: -10.00)
    payment.valid?
    expect(payment.errors[:amount]).to include('must be greater than 0')
  end

  it 'is invalid without an author (user)' do
    payment = build(:payment, author: nil)
    payment.valid?
    expect(payment.errors[:author]).to include("can't be blank")
  end
end
