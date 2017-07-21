Backend.MomentTransform = Ember.Service.extend({
  serialize: function(value) {
    if (typeof value === 'undefined') {
      return undefined;
    }
    // Fix ios safari bug
    if (typeof value === 'string') {
      throw 'Unsupported Format';
    }

    if (!value.utc) {
      value = this._moment(value);
    }

    return value.format();
  },

  deserialize: function(value) {
    if(this._isUndefined(value)) { return undefined; }
    return this._moment(value);
  },

  _isUndefined: function(value) {
    return value === undefined || value === null;
  },

  _moment: function(value){
    return window.moment(value);
  }
});