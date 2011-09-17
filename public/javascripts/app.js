/* DO NOT MODIFY. This file was compiled Sat, 17 Sep 2011 07:44:00 GMT from
 * /Users/adam/Projects/featbeat/app/coffeescripts/app.coffee
 */

(function() {
  var EntryController;
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };
  EntryController = (function() {
    function EntryController() {
      this.onCreateSuccess = __bind(this.onCreateSuccess, this);
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
        error: __bind(function(jqXHR, textStatus, errorThrown) {
          return $('.alert-message.error').text('Error: #{textStatus}');
        }, this),
        success: __bind(function(data, textStatus, jqXHR) {
          return this.onCreateSuccess(data);
        }, this)
      });
      return false;
    };
    EntryController.prototype.onCreateSuccess = function(data) {
      $('.alert-message.success').text('Saved!').show();
      $('#count').val('1');
      $('#unit').val('');
      $('#noun').val('');
      return $('#verb').val('');
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
