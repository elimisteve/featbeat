class Button
    
  init: () =>
    return
    p = $('main-panel')
    
    button = p.createChild tag: 'div', cls: 'event-button'
    button.setHTML('did<br/>10<br/>pushups');
    button.on 'click', this.onClick, this, { count: 10, unit: 'rep', noun: 'pushups', verb: 'did' }

    button = p.createChild tag: 'div', cls: 'event-button'
    button.setHTML('did<br/>10<br/>situps');
    button.on 'click', this.onClick, this, { count: 10, unit: 'rep', noun: 'situps', verb: 'did' }

    button = p.createChild tag: 'div', cls: 'event-button'
    button.setHTML('drank<br/>1<br/>glass of water');
    button.on 'click', this.onClick, this, { count: 1, unit: 'glass', noun: 'water', verb: 'drank' }
    
    if navigator.geolocation?
      navigator.geolocation.getCurrentPosition(window.app.button.onGeoSuccess)
      #   maximumAge: 3000, 
      #   timeout: 5000, 
      #   enableHighAccuracy: true
      # )
    else
      geo = Ext.get('main-panel').createChild tag: 'div', cls: 'geo-readout'
      geo.setHTML('no geo')  
  
  onGeoSuccess: (position) =>
    geo = Ext.get('main-panel').createChild tag: 'div', cls: 'geo-readout'  
    geo.setHTML(position.coords.latitude + ',' + position.coords.longitude)

  onClick: (evt, el, entry) =>
    new window.app.models.Entry(entry.count, entry.unit, entry.noun, entry.verb).save()
    

window.app.controllers.Button = Button
window.app.button = new window.app.controllers.Button();

setTimeout( window.app.button.init, 2000);
