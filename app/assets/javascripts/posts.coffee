$(document).on 'click', '#post_button', (e) ->
  action = $('.post-form form').attr('action')
  e.preventDefault()
  $.post
    url: action
    beforeSend: (xhr) ->
      xhr.setRequestHeader 'X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')
      return
    data:
      post:
        title: $('#post_title').val()
        body: $('#post_body').val()
    dataType: 'script'
    success: ->
      $('#post_title').val("")
      $('#post_body').val("")
