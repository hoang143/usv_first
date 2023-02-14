import QtQuick 2.15
import QtLocation 5.15
import QtPositioning 5.6

Rectangle{
    id: rectangleMap
    anchors{
        left: parent.left
        leftMargin: 30
        top: parent.top
        topMargin: 30
    }
    width: parent.width * .5
    height: parent.height * .6


    Plugin {
          id: mapboxglPlugin
          name: "osm"
          PluginParameter{
             name: "mapboxgl"
             value: "mapbox://styles/mapbox/streets-v12" // style mapbox
         }
          }
      Map {
         id: mapview
         anchors.fill: parent
         plugin: mapboxglPlugin
         //activeMapType: map.supportedMapTypes[5]
         //center: QtPositioning.coordinate(udp.homeLat, udp.homeLng)
         center: QtPositioning.coordinate(21.000, 105.000)
         zoomLevel: 30

}
}
