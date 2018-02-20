class Group < ApplicationRecord
  has_many :memberships
  has_many :members, through: :memberships, source: :user
  has_many :invitations

  def member?(user)
    self.members.include?(user)
  end
end
