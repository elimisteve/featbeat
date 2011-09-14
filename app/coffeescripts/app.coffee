# run rake barista:brew to force the compilation of all JavaScripts for the current application
class EntryController
  
  constructor: ->
    $('#save').click @onCreate
    
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
    
jQuery ->
  window.app = { 'controllers' : {}, 'models': {} }
  window.app.controllers.EntryController = new EntryController();
    
