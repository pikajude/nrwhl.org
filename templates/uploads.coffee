$(document).on "ready", ->
  fileTypes =
    'image/png': true
    'image/jpeg': true

  $("#file-preview input").on "change", (e) ->
    reader = new FileReader()
    reader.onload = (ev) ->
      i = $("#file-preview img")[0]
      i.src = ev.target.result

    file = e.target.files[0]

    if fileTypes[file.type]
      reader.readAsDataURL file
    else
      $(this).val ""
      $("#file-preview img").attr "src", "@{StaticR img_preview_png}"
      alert "That doesn't look like an image."
