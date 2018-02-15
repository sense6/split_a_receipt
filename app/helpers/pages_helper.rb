module PagesHelper

  def invitation_handler(invitation)
    (link_to "accept invitation to group #{invitation.group.name}
             from #{invitation.sender.email}",
             memberships_create_path(user_id: invitation.receiver_id,
                                     group_id: invitation.group.id)) +
    "<br>".html_safe +
    (link_to "decline invitation", invitation_path(invitation), method: :delete)
  end
end
