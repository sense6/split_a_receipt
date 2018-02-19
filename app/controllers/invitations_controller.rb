class InvitationsController < ApplicationController
  def create
    @invitation = Invitation.new(sender_id: params[:sender_id],
                                 receiver_id: params[:receiver_id],
                                 group_id: params[:group_id])
    if @invitation.save
      redirect_to '/search', notice: 'User invited'
    else
      redirect_to '/search', notice: 'Could not send invite'
    end
  end

  def destroy
    @invitation = Invitation.find(params[:id])
    @invitation.destroy
    redirect_to '/profile'
  end

  def check_invitation
    @invitation = Invitation.where(sender_id: params[:sender_id],
                                   receiver_id: params[:receiver_id],
                                   group_id: params[:group_id])

    respond_to do |format|
      format.json {render :json => {invitation_exists: @invitation.present?}}
    end
  end
end
