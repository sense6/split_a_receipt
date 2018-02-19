# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

buttonOff = (jQuery) ->
  $('#invite_button').attr("disabled", true)

buttonOn = (jQuery) ->
  $('#invite_button').attr("disabled", false)

readyFn = (jQuery) ->
  buttonOff()
  $("#group_id").change()
  return

$(document).ready readyFn

$(document).on 'change', '#group_id', (e) ->
  console.log @options[e.target.selectedIndex].value
  $.post
      url: "/check_invitation"
      beforeSend: (xhr) ->
        xhr.setRequestHeader 'X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')
        return
      data:
          sender_id: sender_id.value
          receiver_id: receiver_id.value
          group_id: group_id.value
      dataType: "json"
      success: (data) ->
        console.log data.invitation_exists
        if data.invitation_exists
          buttonOff()
        else
          buttonOn()
  return
