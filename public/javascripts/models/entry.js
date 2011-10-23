/* DO NOT MODIFY. This file was compiled Wed, 21 Sep 2011 05:55:32 GMT from
 * /Users/adam/Projects/featbeat/app/coffeescripts/models/entry.coffee
 */

(function() {
  var Entry;
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };
  Entry = (function() {
    function Entry(count, unit, noun, verb) {
      this.count = count;
      this.unit = unit;
      this.noun = noun;
      this.verb = verb;
      this.save = __bind(this.save, this);
    }
    Entry.prototype.save = function() {
      Ext.get('main-panel').createChild({
        tag: 'div',
        html: 'Saving...'
      });
      return Ext.Ajax.request({
        url: window.config.baseUrl + '/entries',
        method: 'POST',
        params: {
          count: this.count,
          unit: this.unit,
          noun: this.noun,
          verb: this.verb
        },
        success: __bind(function(data) {
          return Ext.get('main-panel').createChild({
            tag: 'div',
            html: 'Saved!'
          });
        }, this),
        failure: __bind(function(data) {
          Ext.get('main-panel').createChild({
            tag: 'div',
            html: 'Error... ' + data
          });
          console.log(data);
          return Ext.Msg.alert('Error: ' + data);
        }, this)
      });
    };
    return Entry;
  })();
  window.app.models.Entry = Entry;
}).call(this);
