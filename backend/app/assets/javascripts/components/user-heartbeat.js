// for more details see: http://emberjs.com/guides/components/

Backend.UserHeartbeatComponent = Ember.Component.extend({
  currentUser: Ember.inject.service(),

  init: function () {
    this._super(arguments);
    this.heartBeat();
  },

  currentUserObserver: Ember.observer('currentUser.user', function () {
    this.heartBeat();
  }),

  heartBeat: function () {
    var self = this;
    var interval = setInterval(function () {
      var user = self.get('currentUser.user');
      if(user){
        $.post('users/heartbeat', function (data) {
          var time = moment(data.time);
          self.set('currentUser.user.lastSeen', time);
        });
      }else{
        clearInterval(interval);
      }
    }, 1500);
  }
});
