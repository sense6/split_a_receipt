class Receipt < ApplicationRecord
  belongs_to :group
  has_many :contributors, dependent: :destroy
end
