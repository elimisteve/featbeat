/* DO NOT MODIFY. This file was compiled Wed, 21 Sep 2011 05:55:32 GMT from
 * /Users/adam/Projects/featbeat/app/coffeescripts/mobile_app.coffee
 */

(function() {
  var App;
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };
  App = (function() {
    function App() {
      this.launch = __bind(this.launch, this);
      this.checkTime = __bind(this.checkTime, this);      new Ext.Application({
        launch: this.launch
      });
    }
    App.prototype.checkTime = function() {
      var lastOpened, now;
      now = new Date().toString();
      lastOpened = localStorage.getItem('last_opened');
      if ((lastOpened != null) && lastOpened.substring(0, 15) !== now.substring(0, 15)) {
        new window.app.models.Entry(1, 'app', 'featbeat-mobile', 'opened').save();
      }
      return localStorage.setItem('last_opened', now);
    };
    App.prototype.launch = function() {
      var tabs, toolbar;
      tabs = [
        {
          title: 'Tab 1',
          html: '<div id="main-panel"></div>',
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
      toolbar = {
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
      };
      new Ext.TabPanel({
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
      return this.checkTime();
    };
    return App;
  })();
  window.app = new App();
  window.app.models = {};
  window.app.controllers = {};
}).call(this);
