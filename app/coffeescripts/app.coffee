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
        error: (jqXHR, textStatus, errorThrown) ->
            $('body').append "Error: #{textStatus}"
        success: (data, textStatus, jqXHR) ->
            $('body').append 'success';
    
    return false
    
jQuery ->
  window.app = { 'controllers' : {}, 'models': {} }
  window.app.controllers.EntryController = new EntryController();
    
