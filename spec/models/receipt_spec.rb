require 'rails_helper'

RSpec.describe Receipt, type: :model do
  it { should have_many(:contributors) }
  it { should have_many(:contributing_users).through(:contributors) }
end
