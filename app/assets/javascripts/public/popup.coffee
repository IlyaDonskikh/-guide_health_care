@popupOpen = (content) ->
  $.magnificPopup.open
    items:
      src: "<div class='white-popup'>#{content}</div>",
      type: 'inline'
@popupClose = ->
  $.magnificPopup.close()
