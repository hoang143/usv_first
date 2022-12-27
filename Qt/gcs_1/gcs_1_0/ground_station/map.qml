import QtQuick 2.0
import QtLocation 5.6
import QtPositioning 5.6

Rectangle{
    property real latitude: 21.047968084307087
    property real longitude: 105.81833970305084
    Plugin {
             id: mapboxglPlugin
             name: "mapboxgl"
             PluginParameter{
                 name: "mapboxgl.mapping.additional_style_urls";
                 value: "mapbox://styles/mapbox/streets-v12"; // style mapbox
             }
          }
          Map {
             id: mapview
             anchors.fill: parent
             plugin: mapboxglPlugin
             center: QtPositioning.coordinate(21.053465409531377, 105.82613915501862)
             zoomLevel: 15
             MapCircle {
                     center: QtPositioning.coordinate(latitude, longitude)
                     radius: 20
                     color: 'green'
                     border.width: 3
                 }
             }
          MouseArea {
                      id: mouseareamaker
                      anchors.fill: parent
                      property int lastX : -1
                      property int lastY : -1
                      property int cout: 0

                      onClicked: {
                          var coordinate = mapview.toCoordinate(Qt.point(mouse.x,mouse.y))
                          console.log(mapview.toCoordinate(Qt.point(mouse.x,mouse.y)).latitude);
                          console.log(mapview.toCoordinate(Qt.point(mouse.x,mouse.y)).longitude);
                          latitude = mapview.toCoordinate(Qt.point(mouse.x,mouse.y)).latitude
                          longitude = mapview.toCoordinate(Qt.point(mouse.x,mouse.y)).longitude
                      }

                      }

                  }
