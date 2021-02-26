function initializeAutocomplete(id) {
  var element = document.getElementById(id);
  if (element) {
    new google.maps.places.Autocomplete(element, { types: ['geocode'] });
  }
}

google.maps.event.addDomListener(window, 'load', function() {
  initializeAutocomplete('user_input_autocomplete_address');
});
