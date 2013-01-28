class window.EntryController
  
  constructor: ->
    $('#save').click @onCreate
    
  onCreate: =>
    $('.loading').fadeIn()
    data = 
      count: $('#count').val()
      unit: $('#unit').val()
      noun: $('#noun').val()
      verb: $('#verb').val()

    @createEvent(data)
    return false # don't submit form
  
  createEvent: (data) =>
    $.ajax '/entries',
      type: 'POST'
      dataType: 'json'
      data: data
      error: (jqXHR, textStatus, errorThrown) =>
        $('.loading').fadeOut()
        $('.alert-message.error').text('Error: #{textStatus}')            
      success: (data, textStatus, jqXHR) =>
        $('.loading').fadeOut()
        this.onCreateSuccess(data)

  onCreateSuccess: (data) =>
    $('.alert-success').text('Saved!').show().fadeOut(2000);
    $('#count').val('1')
    $('#unit').val('')
    $('#noun').val('')
    $('#verb').val('')

  #   if navigator.geolocation?
  #     navigator.geolocation.getCurrentPosition(window.app.button.onGeoSuccess)
  #     #   maximumAge: 3000, 
  #     #   timeout: 5000, 
  #     #   enableHighAccuracy: true
  #     # )
  #   else
  #     geo = Ext.get('main-panel').createChild tag: 'div', cls: 'geo-readout'
  #     geo.setHTML('no geo')  
  
  # onGeoSuccess: (position) =>
  #   geo = Ext.get('main-panel').createChild tag: 'div', cls: 'geo-readout'  
  #   geo.setHTML(position.coords.latitude + ',' + position.coords.longitude)
