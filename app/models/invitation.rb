class Invitation < ApplicationRecord
  validate :user_cant_be_invited_to_the_same_group_twice

  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"
  belongs_to :group

  def user_cant_be_invited_to_the_same_group_twice
    if Invitation.where(receiver: receiver_id, group_id: group_id).exists?
      errors.add(:group_id, "cant invite same user twice")
    end
  end
end
