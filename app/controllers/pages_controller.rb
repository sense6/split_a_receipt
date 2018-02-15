class PagesController < ApplicationController
  def home
  end

  def search
    @users = User.all
    @filered_users
    @user_groups = current_user.groups
  end

  def profile
    @invitations = current_user.received_invitations
  end
end
