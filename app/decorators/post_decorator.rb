class PostDecorator < Draper::Decorator
  delegate_all

  def created_at
    object.created_at.strftime("%m/%d/%Y %H:%M")
  end
  
end
