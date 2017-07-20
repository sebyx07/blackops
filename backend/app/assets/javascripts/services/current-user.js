Backend.CurrentUserService = Ember.Service.extend({
  store: Ember.inject.service(),

  user: Ember.computed('_user', {
    get: function () {
      if(!this.get('_user')){
        this.getUser();
        return;
      }
      return this.get('_user');
    },
    set: function (_key, val) {
      this.set('_user', val);
      return val;
    }
  }),

  getUser: function () {
    var store = this.get('store'),
      self = this;
    return new Ember.RSVP.Promise(function (resolve) {
      if (self.get('userId')) {
        var user = store.peekRecord('user', self.get('userId'));
        this.set('_user', user);
        return resolve(user);
      }
      Ember.$.getJSON('/authentication/current_user').then(function (data) {
        var user = self.pushUser(data);
        return resolve(user);
      });
    });
  },

  pushUser: function (payload) {
    var store = this.get('store'),
        id = payload.id;
    store.pushPayload({user: payload});
    var user = store.peekRecord('user', id);
    this.set('_user', user);
    return user;
  },

  logout: function () {
    var self = this;
    Ember.$.post('/authentication/logout').done(function () {
      self.set('user', undefined);
    });
  }
});
