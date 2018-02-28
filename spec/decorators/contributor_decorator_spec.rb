require 'rails_helper'

RSpec.describe ContributorDecorator do
  user = FactoryBot.create(:user)
  contributor = FactoryBot.create(:contributor, user: user, debt: 10)
  decorated_contributor = ContributorDecorator.new(contributor)

  describe "short_email" do
    short_email = user.email.gsub(/@[[:graph:]]+/, "")
    it { expect(decorated_contributor.short_email).to eq(short_email) }
  end

  describe "debt_with_currency" do
    it { expect(decorated_contributor.debt_with_currency).to eq("owes: 10.0 EUR") }
  end
end
