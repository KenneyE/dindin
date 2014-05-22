window.Dindin = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    new Dindin.Routers.AppRouter();
    Backbone.history.start();
  }
};

$(document).ready(function() {
  Dindin.initialize();
});