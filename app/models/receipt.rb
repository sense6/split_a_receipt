class Receipt < ApplicationRecord
  belongs_to :group

  has_many :contributors, dependent: :destroy
  has_many :contributing_users, through: :contributors, source: :user
end
