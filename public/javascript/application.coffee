$ ->
  load_data = ->
    $.ajax
      type: "GET"
      url:  "/stats"
      dataType: "html"
      success: (data) -> $("#stats").html(data)

  setInterval(load_data, 15000)
