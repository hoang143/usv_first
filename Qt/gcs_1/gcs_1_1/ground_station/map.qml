import QtQuick 2.0
import QtLocation 5.6
import QtPositioning 5.6
import QtQuick.Controls 2.0
import QtQml 2.0

Rectangle{
    property double latitude
    property double longitude
    property double latitude1
    property double longitude1
    Plugin {
          id: mapboxglPlugin
          name: "osm"
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

            MapItemView {
                id: item
                model: mapview
                delegate: routeDelegate
            }

            Component {
                id: routeDelegate

                MapCircle {
                        center: QtPositioning.coordinate(latitude, longitude)
                        radius: 20
                        color: 'yellow'
                        border.width: 3
                    }
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
                          latitude1 = mapview.toCoordinate(Qt.point(mouse.x,mouse.y)).latitude
                          longitude1 = mapview.toCoordinate(Qt.point(mouse.x,mouse.y)).longitude
                          addMarker(latitude1, longitude1)
                      }
                      }
          Button{
              id: control
                  text: qsTr("Delete")

                  contentItem: Text {
                      text: control.text
                      font: control.font
                      opacity: enabled ? 1.0 : 0.3
                      color: control.down ? "#17a81a" : "#21be2b"
                      horizontalAlignment: Text.AlignHCenter
                      verticalAlignment: Text.AlignVCenter
                      elide: Text.ElideRight
                  }

                  background: Rectangle {
                      implicitWidth: 100
                      implicitHeight: 40
                      opacity: enabled ? 1 : 0.3
                      border.color: control.down ? "#17a81a" : "#21be2b"
                      border.width: 1
                      radius: 2
                  }
              onClicked: {
                  console.log("in");
                  mapview.clearMapItems()

              }
          }

          function getPosition(lat,lng){
              mapview.pan(latitude - lat, longitude - lng)
              latitude = lat
              longitude = lng
                  }
          function addMarker(latitude, longitude)
          {
              var Component = Qt.createComponent("qrc:/Marker.qml")
              var Item = Component.createObject(mapview, { coordinate:
              QtPositioning.coordinate(latitude, longitude) })
              mapview.addMapItem(Item)
          }
          }
