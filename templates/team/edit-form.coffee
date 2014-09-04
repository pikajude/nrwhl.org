$(document).on "ready", ->
  $("select").selectize()

$(document).on "colorchange", (_, c) ->
  $("a.team-link").css color: c
