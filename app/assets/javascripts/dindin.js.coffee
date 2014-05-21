window.Dindin =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new Dindin.Routers.AppRouter()
    Backbone.history.start()
    return

$(document).ready ->
  Dindin.initialize()
