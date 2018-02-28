class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :memberships
  has_many :groups, through: :memberships

  has_many :sent_invitations, class_name: "Invitation", foreign_key: :sender_id
  has_many :received_invitations, class_name: "Invitation", foreign_key: :receiver_id

  has_many :posts
  has_many :contributors

  self.per_page = 10

  def self.admins(group)
    find(group.memberships.where(member_type: "admin").pluck(:user_id))
  end

  def self.filter_users(search)
    search.nil? ? all : where("email LIKE ?","%#{search}%")
  end

  def admin?(group)
    User.admins(group).include?(self)
  end


end
