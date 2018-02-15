class Membership < ApplicationRecord
  enum member_type: { member: 0, admin: 1 }
  validate :user_cant_join_same_group_twice

  belongs_to :user
  belongs_to :group

  def user_cant_join_same_group_twice
    if Membership.where(user_id: user_id, group_id: group_id).exists?
      errors.add(:group_id, "cant join same group twice")
    end
  end
end
