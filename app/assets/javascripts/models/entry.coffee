# run rake barista:brew to force the compilation of all JavaScripts for the current application
class Entry
  
  constructor: (@count, @unit, @noun, @verb) ->    
    
  save: () =>

    Ext.get('main-panel').createChild tag: 'div', html: 'Saving...'

    Ext.Ajax.request 
      url: window.config.baseUrl + '/entries',
      method: 'POST'
      params:
        count: @count,
        unit: @unit,
        noun: @noun,
        verb: @verb
        
      success: (data) =>
        Ext.get('main-panel').createChild tag: 'div', html: 'Saved!'

      failure: (data) =>
        Ext.get('main-panel').createChild tag: 'div', html: 'Error... ' + data
        console.log(data)
        Ext.Msg.alert 'Error: ' + data
        

window.app.models.Entry = Entry; 
    
