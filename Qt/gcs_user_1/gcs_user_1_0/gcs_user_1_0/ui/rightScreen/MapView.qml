import QtQuick 2.15
import QtLocation 5.15
import QtPositioning 5.6

Rectangle{
    id: rectangleMap
//    border.width: 100
//    border.color: 'black'
    anchors{
        left: parent.left
        leftMargin: parent.width * .01
        top: parent.top
        topMargin: parent.height * .01
        bottom: parent.bottom
        bottomMargin: parent.height *.01

    }
    width: parent.width * .69
    height: parent.height * .98


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
         center: QtPositioning.coordinate(21.053705712670723, 105.8260533067217)
         zoomLevel: 15

}
}
