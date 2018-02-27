require 'rails_helper'

RSpec.describe InvitationsController, type: :controller do
  login_user

  describe "post #create" do
    user1 = FactoryBot.create(:user)
    user2 = FactoryBot.create(:user)
    group = FactoryBot.create(:group)
    subject { post :create, params: { sender_id: user1.id,
                                      receiver_id: user2.id,
                                      group_id: group.id } }

    context "creates invitation" do
      it "redirects to /search" do
        subject
        expect(response).to have_http_status(302)
        expect(subject).to redirect_to("/search")
      end
      it "saves invitation" do
        expect { subject }.to change{ Invitation.count }.by(1)
      end
      it "sets success notification" do
        subject
        expect(flash[:notice]).to eq("User invited")
      end
    end

    context "fails to create invitation" do
      subject { post :create, params: { sender_id: nil,
                                        receiver_id: user2.id,
                                        group_id: group.id } }
      it "redirects to /search" do
        subject
        expect(response).to have_http_status(302)
        expect(subject).to redirect_to("/search")
      end
      it "doesnt save invitation" do
        expect { subject }.to change{ Invitation.count }.by(0)
      end
      it "sets failure notification" do
        subject
        expect(flash[:notice]).to eq("Could not send invite")
      end
    end
  end

  describe "delete #destroy" do
    invitation = FactoryBot.create(:invitation)
    subject { delete :destroy, params: { id: invitation.id } }

    it "redirects to /profile" do
      subject
      expect(response).to have_http_status(302)
      expect(subject).to redirect_to("/profile")
    end
    it "destroys invitation" do
      expect { subject }.to change { Invitation.count }.by(-1)
    end
  end

  describe "post #check_invitation" do
    invitation = FactoryBot.create(:invitation)
    subject { post :check_invitation, params: { sender_id: invitation.sender_id,
                                                receiver_id: invitation.receiver_id,
                                                group_id: invitation.group_id }, format: :json }
    context "invitation exists" do
      it "returns true" do
        subject
        parsed_response = JSON.parse(response.body)
        expect(parsed_response.value?(true)).to be true
      end
    end
    context "invitation doesnt exist" do
      subject { post :check_invitation, params: { sender_id: nil,
                                                  receiver_id: invitation.receiver_id,
                                                  group_id: invitation.group_id }, format: :json }
      it "returns false" do
        subject
        parsed_response = JSON.parse(response.body)
        expect(parsed_response.value?(false)).to be true
      end
    end
  end
end
