$(document).ready ->
  $(".more-recipients").on "click", (e) ->
    e.preventDefault()
    profileUrl = "@{UserViewR mempty}".replace(/-$/, "")
    $.ajax "@{MessageRecipientsViewR mid}",
      type: "POST"
      contentType: "application/json"
      success: (data, status, xhr) ->
        names = (e.rendered for e in data).join(", ")
        $(".single-message .to .recipients").html("#{names}")
