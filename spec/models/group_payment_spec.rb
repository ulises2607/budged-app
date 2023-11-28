require 'rails_helper'

RSpec.describe GroupPayment, type: :model do
    it "is valid with valid attributes" do
        group_payment = build(:group_payment)
        expect(group_payment).to be_valid
    end
    
    it "is invalid without a group" do
        group_payment = build(:group_payment, group: nil)
        group_payment.valid?
        expect(group_payment.errors[:group]).to include("can't be blank")
    end
    
    it "is invalid without a payment" do
        group_payment = build(:group_payment, payment: nil)
        group_payment.valid?
        expect(group_payment.errors[:payment]).to include("can't be blank")
    end
  
end