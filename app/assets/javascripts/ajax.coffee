$(document).on 'turbolinks:load' , ->
  $(document).ajaxStart ->
    $('#progress').html '通信中...'
  .ajaxComplete ->
    $('#progress').html ''
  $('#ajax_form').on 'ajaz:success', (e, data) ->
    $('#result').empty()
    $.each data, ->
      $('#result').append(
        $('<li></li>').append(
          $('<a></a>').attr('href', @URL).append("#{@Title} (#{@Description}) ")
        )
      )
