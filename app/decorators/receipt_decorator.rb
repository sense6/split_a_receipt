class ReceiptDecorator < Draper::Decorator
  delegate_all
  decorates_association :contributors

  def created_at
    object.created_at.strftime("%m/%d/%Y")
  end

end
