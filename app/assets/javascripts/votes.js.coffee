jQuery ->
  $('.suggestions').sortable update: (event, ui) ->
    $('#vote_suggestion_ids_string').val($(this).sortable( "toArray" ).join(','))