/* DO NOT MODIFY. This file was compiled Wed, 21 Sep 2011 05:55:32 GMT from
 * /Users/adam/Projects/featbeat/app/coffeescripts/controllers/button.coffee
 */

(function() {
  var Button;
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };
  Button = (function() {
    function Button() {
      this.onClick = __bind(this.onClick, this);
      this.onGeoSuccess = __bind(this.onGeoSuccess, this);
      this.init = __bind(this.init, this);
    }
    Button.prototype.init = function() {
      var button, geo, p;
      p = Ext.get('main-panel');
      button = p.createChild({
        tag: 'div',
        cls: 'event-button'
      });
      button.setHTML('did<br/>10<br/>pushups');
      button.on('click', this.onClick, this, {
        count: 10,
        unit: 'rep',
        noun: 'pushups',
        verb: 'did'
      });
      button = p.createChild({
        tag: 'div',
        cls: 'event-button'
      });
      button.setHTML('did<br/>10<br/>situps');
      button.on('click', this.onClick, this, {
        count: 10,
        unit: 'rep',
        noun: 'situps',
        verb: 'did'
      });
      button = p.createChild({
        tag: 'div',
        cls: 'event-button'
      });
      button.setHTML('drank<br/>1<br/>glass of water');
      button.on('click', this.onClick, this, {
        count: 1,
        unit: 'glass',
        noun: 'water',
        verb: 'drank'
      });
      if (navigator.geolocation != null) {
        return navigator.geolocation.getCurrentPosition(window.app.button.onGeoSuccess);
      } else {
        geo = Ext.get('main-panel').createChild({
          tag: 'div',
          cls: 'geo-readout'
        });
        return geo.setHTML('no geo');
      }
    };
    Button.prototype.onGeoSuccess = function(position) {
      var geo;
      geo = Ext.get('main-panel').createChild({
        tag: 'div',
        cls: 'geo-readout'
      });
      return geo.setHTML(position.coords.latitude + ',' + position.coords.longitude);
    };
    Button.prototype.onClick = function(evt, el, entry) {
      return new window.app.models.Entry(entry.count, entry.unit, entry.noun, entry.verb).save();
    };
    return Button;
  })();
  window.app.controllers.Button = Button;
  window.app.button = new window.app.controllers.Button();
  setTimeout(window.app.button.init, 2000);
}).call(this);
