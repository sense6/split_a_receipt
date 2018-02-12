require 'rails_helper'

RSpec.describe User, type: :model do
  describe "associations" do
    it { should have_many(:groups).through(:memberships) }
    it { should have_many(:memberships) }

    it { should have_many(:sent_invitations).class_name("Invitation") }
    it { should have_many(:receved_invitations).class_name("Invitation") }
  end
end
