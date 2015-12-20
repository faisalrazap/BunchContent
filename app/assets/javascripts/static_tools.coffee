$(document).ready ->
  if $('.answer-option').length > 0
    $('.answer-option').click (e) ->
      e.preventDefault()
      question_number = parseInt(@id.split('_')[1])
      answer = parseInt(@id.split('_')[2])
      selected_list_answer this
      setTimeout (->
        load_next_question question_number
      ), 300
    return

load_next_question = (question_number) ->
  $(".ques_#{question_number}").addClass('hidden')
  $('.static-quiz-content').animate({ scrollTop: 0 }, 400);
  next_question = question_number + 1
  if $(".ques_#{next_question}").length > 0
    $(".ques_#{next_question}").fadeIn 1200
  else
    $('#static_quiz_form').submit();

selected_list_answer = (list) ->
  list_checkbox = $(list).find('input[type=checkbox]')
  if list_checkbox.length > 0
    list_checkbox[0].checked = true
