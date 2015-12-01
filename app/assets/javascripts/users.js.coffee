$(document).ready ->
  if $('#user-edit').length > 0
    $('#user-edit #user_password').removeAttr 'required'
    $('#user-edit #user_password_confirmation').removeAttr 'required'

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
