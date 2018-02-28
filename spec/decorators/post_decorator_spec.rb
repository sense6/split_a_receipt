require 'rails_helper'

RSpec.describe PostDecorator do
  post = FactoryBot.create(:post, created_at: DateTime.new(2018, 5, 15, 14, 30))


  describe "created_at" do
    decorated_post = PostDecorator.new(post)
    it { expect(decorated_post.created_at).to eq("05/15/2018 14:30") }
  end
end
