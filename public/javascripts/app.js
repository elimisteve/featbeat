/* DO NOT MODIFY. This file was compiled Mon, 12 Sep 2011 04:04:56 GMT from
 * /Users/adam/Projects/featbeat/app/coffeescripts/app.coffee
 */

(function() {
  var EntryController;
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };
  EntryController = (function() {
    function EntryController() {
      this.onCreate = __bind(this.onCreate, this);      $('#save').click(this.onCreate);
    }
    EntryController.prototype.onCreate = function(event) {
      $.ajax('/entries', {
        type: 'POST',
        dataType: 'json',
        data: {
          count: $('#count').val(),
          unit: $('#unit').val(),
          noun: $('#noun').val(),
          verb: $('#verb').val()
        },
        error: function(jqXHR, textStatus, errorThrown) {
          return $('body').append("Error: " + textStatus);
        },
        success: function(data, textStatus, jqXHR) {
          return $('body').append('success');
        }
      });
      return false;
    };
    return EntryController;
  })();
  jQuery(function() {
    window.app = {
      'controllers': {},
      'models': {}
    };
    return window.app.controllers.EntryController = new EntryController();
  });
}).call(this);
