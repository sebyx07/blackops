// for more details see: http://emberjs.com/guides/components/

Backend.LoginLoginFormComponent = Ember.Component.extend({
  currentUser: Ember.inject.service(),
  store: Ember.inject.service(),


  actions: {
    login: function () {
      var self = this;
      Ember.$.post('authentication/login', {
        username: self.get('username'),
        password: self.get('password')
      }).done(function (data) {
        self.set('error', undefined);
        self.get('currentUser').pushUser(data);
      }).fail(function () {
        self.set('error', 'Invalid Login');
      });
    },

    logout: function () {
      this.get('currentUser').logout();
    }
  }
});
