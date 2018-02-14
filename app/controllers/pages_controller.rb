class PagesController < ApplicationController
  def home
  end

  def search
    @users = User.all
    @filered_users
  end
end
