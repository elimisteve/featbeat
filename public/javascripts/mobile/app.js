/* DO NOT MODIFY. This file was compiled Sat, 17 Sep 2011 07:44:00 GMT from
 * /Users/adam/Projects/featbeat/app/coffeescripts/mobile/app.coffee
 */

(function() {
  var App;
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };
  App = (function() {
    function App() {
      this.onCreateSuccess = __bind(this.onCreateSuccess, this);
      this.onCreate = __bind(this.onCreate, this);
      this.launch = __bind(this.launch, this);      console.log('hi');
      new Ext.Application({
        launch: this.launch
      });
    }
    App.prototype.launch = function() {
      var tabs, toolbar;
      tabs = [
        {
          title: 'Tab 1',
          html: '1',
          cls: 'card1',
          iconCls: 'favorites'
        }, {
          title: 'Tab 2',
          html: '2',
          cls: 'card2',
          iconCls: 'favorites'
        }, {
          title: 'Tab 3',
          html: '3',
          cls: 'card3',
          iconCls: 'favorites'
        }
      ];
      toolbar = [
        {
          xtype: 'toolbar',
          ui: 'light',
          dock: 'top',
          defaults: {
            iconMask: true,
            ui: 'plain'
          },
          scroll: {
            direction: 'horizontal',
            useIndicators: false
          },
          layout: {
            pack: 'center'
          },
          items: [
            {
              iconCls: 'action'
            }, {
              iconCls: 'add'
            }, {
              iconCls: 'arrow_up'
            }
          ]
        }
      ];
      return new Ext.TabPanel({
        fullscreen: true,
        ui: 'dark',
        sortable: true,
        items: tabs,
        tabBar: {
          dock: 'bottom',
          scroll: {
            direction: 'horizontal',
            useIndicators: false
          },
          layout: {
            pack: 'center'
          }
        },
        dockedItems: toolbar
      });
    };
    App.prototype.onCreate = function(event) {
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
    App.prototype.onCreateSuccess = function(data) {
      $('.alert-message.success').text('Saved!').show();
      $('#count').val('1');
      $('#unit').val('');
      $('#noun').val('');
      return $('#verb').val('');
    };
    return App;
  })();
  window.app = new App();
}).call(this);
