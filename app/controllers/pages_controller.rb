class PagesController < ApplicationController
  def search
    @filtered_users = User.filter_users(params[:search]).paginate(:page => params[:page])
    @user_groups = current_user.groups.uniq
  end

  def profile
    @invitations = current_user.received_invitations
    @user_groups = current_user.groups.uniq
    @debts = current_user.contributors.decorate
  end
end
