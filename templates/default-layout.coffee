$("[data-confirm]").on "click", ->
  confirm $(this).data("confirm")
