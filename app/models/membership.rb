class Membership < ApplicationRecord
  enum member_type: { member: 0, admin: 1 }

  belongs_to :user
  belongs_to :group
end
