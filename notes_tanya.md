

================
TO DO: 12.14.15
================
- Adding comments to endorsements
- Map: 
-- Hover: 
--- 3. Add 'About' 
--- Add 'Image'
--- Show where I am and categories in relation to me
--- 2. If the user is a current user, color pin red
--- 1. Geocoder address to longitude latitude 


Add friends
Add acoountabuddies


$(document).ready ->

map = L.mapbox.map('map', 'your-map-id').setView([45.52086, -122.679523], 14)

$.ajax
  dataType: 'text'
  url: 'users/index.json'
  success: (data) ->
    geojson = $.parseJSON(data)
    map.featureLayer.setGeoJSON(geojson)

# add custom popups to each marker
map.featureLayer.on 'layeradd', (e) ->
  marker = e.layer
  properties = marker.feature.properties

  # create custom popup
  popupContent =  '<div class="popup">' +
                    '<h3>' + properties.name + '</h3>' +
                    '<p>' + properties.address + '</p>' +
                  '</div>'

  # http://leafletjs.com/reference.html#popup
  marker.bindPopup popupContent,
    closeButton: false
    minWidth: 320

 $('article li').click (e) ->
  current = $(this)
  currentlyClickedName = current.find('h2').text()

  # opens/closes popup for currently clicked user
  map.featureLayer.eachLayer (marker) ->
    if marker.feature.properties.name is currentlyClickedName
      id = layer._leaflet_id
      map._layers[id].openPopup()