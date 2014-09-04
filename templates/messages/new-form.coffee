$(document).ready ->
  $("#%{rawJS (fvId recipientsView)}").selectize
    valueField: "id"
    labelField: "name"
    searchField: "name"
    create: false
    render:
      option: (item, escape) ->
        "<div>#{escape(item.name)}</div>"
    onChange: (v) -> console.log(v)
    load: (query, callback) ->
      if query.length >= 2
        $.ajax
          url: "@{MessageRecipientSearchR}"
          type: "POST"
          data:
            query: query
          error: -> callback()
          success: (res) ->
            results = for obj in res
              obj.entity.id = "#{obj.id}"
              obj.entity
            callback(results)
      else
        callback()
