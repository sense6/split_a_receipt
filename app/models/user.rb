class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :memberships
  has_many :groups, through: :memberships

  has_many :sent_invitations, class_name: "Invitation", foreign_key: :sender_id
  has_many :receved_invitations, class_name: "Invitation", foreign_key: :reciver_id

end
