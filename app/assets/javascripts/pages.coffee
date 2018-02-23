toggleButton =  (id, bool) ->
  $("#invite_button"+id).attr("disabled", bool)

ajaxPost = (sender_id, receiver_id, group_id) ->
  $.post
      url: "/check_invitation"
      beforeSend: (xhr) ->
        xhr.setRequestHeader 'X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')
        return
      data:
          sender_id: sender_id
          receiver_id: receiver_id
          group_id: group_id
      dataType: "json"
      success: (data) ->
        if data.invitation_exists
          toggleButton(receiver_id, true)
        else
          toggleButton(receiver_id, false)
  return

readyFn = () ->
  $.each $('.item-form'), (i, obj) ->
    group_id = $(@).find('#group_id').val()
    receiver_id = $(@).find('#receiver_id').val()
    sender_id = $(@).find('#sender_id').val()

    ajaxPost(sender_id, receiver_id, group_id)

$ ->
  readyFn()

$(document).on 'change', '#group_id', (e) ->
  sender_id = $(@).parent().find('#sender_id').val()
  receiver_id = $(@).parent().find('#receiver_id').val()
  group_id = @options[e.target.selectedIndex].value

  ajaxPost(sender_id, receiver_id, group_id)
