# run rake barista:brew to force the compilation of all JavaScripts for the current application
class App
  
  constructor: ->
    new Ext.Application
      launch: this.launch
  
  checkTime: () =>
    now = new Date().toString()
    lastOpened = localStorage.getItem('last_opened');
    
    # string compare the dates
    if lastOpened? && lastOpened.substring(0, 15) != now.substring(0, 15)
      new window.app.models.Entry(1, 'app', 'featbeat-mobile', 'opened').save()
      
    localStorage.setItem('last_opened', now)
  
  launch: () =>
    
    tabs = [{
        title: 'Tab 1',
        html : '<div id="main-panel"></div>',
        cls  : 'card1',
        iconCls: 'favorites'
      }, {
        title: 'Tab 2',
        html : '2',
        cls  : 'card2',
        iconCls: 'favorites'
      }, {
        title: 'Tab 3',
        html : '3',
        cls  : 'card3',
        iconCls: 'favorites'
      }
    ]

    toolbar =
      xtype: 'toolbar',
      ui: 'light',
      dock: 'top',
      defaults:
        iconMask: true,
        ui: 'plain'
      scroll: 
        direction: 'horizontal',
        useIndicators: false
      layout: 
        pack: 'center'
      items: [
          iconCls: 'action'
        ,
          iconCls: 'add'
        ,
          iconCls: 'arrow_up'
      ]

    new Ext.TabPanel
      fullscreen: true,
      ui:         'dark',
      sortable:   true,
      items:      tabs
      tabBar: 
        dock: 'bottom',
        scroll: 
          direction: 'horizontal',
          useIndicators: false
        layout:
          pack: 'center'
      dockedItems: toolbar      
    
    # log that we opened the app?  
    this.checkTime()
      
window.app = new App();
window.app.models = {};
window.app.controllers = {};