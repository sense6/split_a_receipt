class Invitation < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :reciver, class_name: "User"
  belongs_to :group
end
