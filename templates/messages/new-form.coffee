$(document).ready ->
  $("#%{rawJS (fvId recipientsView)}").selectize
    valueField: "id"
    labelField: "name"
    searchField: "name"
    create: false
    render:
      option: (item, escape) ->
        color = if item.current_team_color
          " style='color: ##{item.current_team_color}'"
        "<div><span#{color}>#{escape(item.name)}</span></div>"
    load: (query, callback) ->
      if query.length >= 2
        $.ajax
          url: "@{MessageRecipientSearchR}"
          type: "POST"
          data:
            query: query
          error: -> callback()
          success: callback
      else
        callback()
