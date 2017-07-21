// for more details see: http://emberjs.com/guides/components/

Backend.UserHeartbeatComponent = Ember.Component.extend({
  currentUser: Ember.inject.service(),

  currentUserObserver: Ember.observer('currentUser.user', function () {
    var user = this.get('currentUser.user');
    if(user){
      $.post('users/heartbeat', function (data) {

      });
    }
  })
});
