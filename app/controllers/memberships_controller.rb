class MembershipsController < ApplicationController
  def create
    @membership = Membership.new(user_id: params[:user_id], group_id: params[:group_id])

    if @membership.save
      redirect_to @membership.group, notice: "joined #{@membership.group.name} group"
    else
      redirect_to '/profile', notice: 'couldnt join this group'
    end
  end

  def destroy
  end
end
