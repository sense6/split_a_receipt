class ContributorDecorator < Draper::Decorator
  delegate_all

  def short_email
    object.user.email.gsub(/@[[:graph:]]+/, "")
  end

  def debt_with_currency
    "#{object.debt} #{object.receipt.currency}"
  end
end
