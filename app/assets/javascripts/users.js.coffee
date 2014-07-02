# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$('body').on('submit', '#edit_user_1', (event) ->
  event.preventDefault()
  
  # Create iframe
  iframe = document.createElement('iframe')
  iframe.setAttribute('name', 'uploadTarget')
  iframe.setAttribute('style', 'display: none')
  # Add to document
  document.body.appendChild(iframe)

  # Set event handler
  eventHandler = ->
    if iframe.detachEvent     # Browser compatibility check
      iframe.detachEvent('onload', eventHandler)
    else
      iframe.removeEventListener('load', eventHandler, false)

    # Get content from server response
    content = ''
    if iframe.contentDocument
      content = iframe.contentDocument.body.innerHTML
    else if iframe.contentWindow
      content = iframe.contentWindow.body.innerHTML
    else if iframe.document
      content = iframe.document.body.innerHTML
    # Update view — Upload finished
    document.getElementById('image').className = ''
    document.getElementById('spinnerContainer').className = 'Hidden'
    document.getElementById('image').setAttribute('src', content)

    # Set image preview
    
    # Delete iframe
    setTimeout((-> iframe.parentNode.removeChild(iframe)), 250)

  if iframe.addEventListener
    iframe.addEventListener('load', eventHandler, true)
  else if iframe.attachEvent
    iframe.attachEvent('onload', eventHandler)

  # Get form
  form = event.target
  # Target form
  form.setAttribute('target', 'uploadTarget')

  # Update view — prep for upload
  document.getElementById('image').className = 'Fade'
  document.getElementById('spinnerContainer').className = ''

  form.submit()
)