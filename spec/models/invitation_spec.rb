require 'rails_helper'

RSpec.describe Invitation, type: :model do
  describe "associations" do
    it { should belong_to(:sender).class_name("User") }
    it { should belong_to(:reciver).class_name("User") }
    it { should belong_to(:group) }
  end
end
