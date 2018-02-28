class Contributor < ApplicationRecord
  before_create :set_debt

  belongs_to :user
  belongs_to :receipt

  def set_debt
    self.debt = receipt.amount / receipt.contributors.size.to_f
  end
end
