// for more details see: http://emberjs.com/guides/models/defining-models/

Backend.User = DS.Model.extend({
  username: DS.attr(),
  role: DS.attr(),
  lastSeen: DS.attr('moment')
});
