// For more information see: http://emberjs.com/guides/routing/

Backend.IndexRoute = Ember.Route.extend({
  beforeModel: function () {
    $.ajaxPrefilter(function(options, originalOptions, xhr) {
      var token = $('meta[name="csrf-token"]').attr('content');
      xhr.setRequestHeader('X-CSRF-Token', token);
    });
  }
});
