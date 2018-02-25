module PagesHelper
  def badge_type(group)
    current_user.admin?(group) ? badge("Admin") : badge("Member")
  end

  def badge(content)
    "<span class='badge badge-pill badge-primary'>#{content}</span>".html_safe
  end
end
