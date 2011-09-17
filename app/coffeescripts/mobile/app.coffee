# run rake barista:brew to force the compilation of all JavaScripts for the current application
class App
  
  constructor: ->
    console.log('hi')
    new Ext.Application
      launch: this.launch
  
  launch: () =>
    
    tabs = [{
        title: 'Tab 1',
        html : '1',
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

    toolbar = [{
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
        items: [{
            iconCls: 'action'
        }, {
            iconCls: 'add'
        }, {
            iconCls: 'arrow_up'
        }]
    }]

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
    
  onCreate: (event) =>
    
    $.ajax '/entries',
        type: 'POST'
        dataType: 'json'
        data: {
          count: $('#count').val(),
          unit: $('#unit').val(),
          noun: $('#noun').val(),
          verb: $('#verb').val()
        }
        error: (jqXHR, textStatus, errorThrown) =>
            $('.alert-message.error').text('Error: #{textStatus}')            
        success: (data, textStatus, jqXHR) =>
            this.onCreateSuccess(data)
    
    return false # don't submit form
    
  onCreateSuccess: (data) =>
    $('.alert-message.success').text('Saved!').show();
    $('#count').val('1')
    $('#unit').val('')
    $('#noun').val('')
    $('#verb').val('')
    
window.app = new App();
    
