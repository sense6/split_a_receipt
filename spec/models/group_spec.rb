require 'rails_helper'

RSpec.describe Group, type: :model do
  describe "associations" do
    it { should have_many(:members).through(:memberships) }
    it { should have_many(:memberships) }
    it { should have_many(:invitations) }
  end

  user = FactoryBot.create(:user)
  user2 = FactoryBot.create(:user)
  group = FactoryBot.create(:group)
  membership = FactoryBot.create(:membership, user_id: user.id, group_id: group.id)

  describe "member?" do
    it "checks if user is a member of a group" do
      expect(group.member?(user)).to be true
    end
    it "checks if user is not a member of a group" do
      expect(group.member?(user2)).to be false
    end
  end
  describe "has_admin? and set_admin" do
    it "checks if group doesn't have an admin" do
      expect(group.has_admin?).to be false
    end
    it "checks if group has an admin" do
      group.set_admin
      expect(group.has_admin?).to be true
    end
  end

end
