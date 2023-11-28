require 'rails_helper'

RSpec.describe Group, type: :model do
  it "is valid with valid attributes" do
    group = build(:group)
    expect(group).to be_valid
  end

  it "is invalid without a name" do
    group = build(:group, name: nil)
    group.valid?
    expect(group.errors[:name]).to include("can't be blank")
  end

  it "is invalid without an icon" do
    group = build(:group, icon: nil)
    group.valid?
    expect(group.errors[:icon]).to include("can't be blank")
  end

  it "is invalid without a user" do
    group = build(:group, user: nil)
    group.valid?
    expect(group.errors[:user]).to include("can't be blank")
  end
end