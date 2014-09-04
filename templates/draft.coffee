$(document).ready ->
  $ws = new WebSocket "@{DraftR}".replace(/^http/, "ws")
  $ws.onmessage = (e) ->
    $("#main .container").append("<p>#{e.data}</p>") if e

  $("form").on "submit", (e) ->
    e.preventDefault()
    $ws.send($("#message").val())
    $("#message").val("")
