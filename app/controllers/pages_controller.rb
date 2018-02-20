class PagesController < ApplicationController
  def home
  end

  def search
    @users = User.where.not(id: current_user.id)
    @filtered_users = User.filter_users(params[:search])
    @user_groups = current_user.groups.uniq
  end

  def profile
    @invitations = current_user.received_invitations
  end
end
