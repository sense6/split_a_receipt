class Group < ApplicationRecord
  has_many :memberships
  has_many :members, through: :memberships, source: :user
  has_many :invitations

  def member?(user)
    members.include?(user)
  end

  def has_admin?
    memberships.admin.present?
  end

  def set_admin
    memberships.first.admin!
  end
end
