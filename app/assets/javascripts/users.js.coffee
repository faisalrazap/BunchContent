$(document).ready ->
  if $('#user-edit').length > 0
    $('#user-edit #user_password').removeAttr 'required'
    $('#user-edit #user_password_confirmation').removeAttr 'required'

  if $('.user-form').length > 0
    $.validator.addMethod 'role_selected', ((value) ->
      value != ''
    ), 'Please select a role'

    $('.user-form').validate
      debug: true
      errorElement: 'span'
      rules: {
        'user[password]': {
          minlength : 8
        }
        'user[password_confirmation]': {
          minlength : 8
          equalTo : "#user_password"
        }
        'user[role]': {
          role_selected: true
        }
      }
      submitHandler: (form) ->
        form.submit()

  if $('#modal').length > 0
    modal = do ->
      method = {}
      $overlay = $('#overlay')
      $modal = $('#modal')
      $content = $('#content')
      $modal.hide()
      $overlay.hide()
      $modal.prependTo 'body'
      $overlay.prependTo 'body'

      method.center = ->
        top = Math.max($(window).height() - $modal.outerHeight(), 0) / 2
        left = Math.max($(window).width() - $modal.outerWidth(), 0) / 2
        $modal.css
          top: top + $(window).scrollTop()
          left: left + $(window).scrollLeft()

      method.open = (settings) ->
        method.center()
        $(window).bind 'resize.modal', method.center
        $modal.show()
        $overlay.show()

      method

    modal.open()
