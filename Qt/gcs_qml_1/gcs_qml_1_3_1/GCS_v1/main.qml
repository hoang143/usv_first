import QtQuick 2.12
import QtLocation 5.6
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import GetPosition 1.0
import QtQml 2.0
import QtPositioning 5.6

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    property double latCenter:21.053625611668483
    property double lngCenter:105.82596749364048
    property double latMouse
    property double lngMouse

    ListModel{
        id:lst
        ListElement{
            lat: 0
            lng: 0
        }
    }

    GetPosition{
        id: get
    }

    Plugin {
          id: mapboxglPlugin
          name: "osm"
          PluginParameter{
             name: "mapboxgl";
             value: "mapbox://styles/mapbox/streets-v12"; // style mapbox
         }
          }
          Map {
             id: mapview
             anchors.fill: parent
             plugin: mapboxglPlugin
             //activeMapType: map.supportedMapTypes[5]
             center: QtPositioning.coordinate(latCenter, lngCenter)
             zoomLevel: 15

            MapItemView {
                id: item
                model: mapview
                delegate: routeDelegate
            }

            Component {
                id: routeDelegate

                MapCircle {
                        center: QtPositioning.coordinate(latCenter, lngCenter)
                        radius: 20
                        color: 'yellow'
                        border.width: 3
                    }
            }

          }

          property int count: 0
          MouseArea {
                      id: mouseareamaker
                      anchors.fill: parent
                      property int lastX : -1
                      property int lastY : -1
                      onClicked: {
                          var coordinate = mapview.toCoordinate(Qt.point(mouse.x,mouse.y))
//                          console.log(mapview.toCoordinate(Qt.point(mouse.x,mouse.y)).latitude);
//                          console.log(mapview.toCoordinate(Qt.point(mouse.x,mouse.y)).longitude);
                          latMouse = mapview.toCoordinate(Qt.point(mouse.x,mouse.y)).latitude
                          lngMouse = mapview.toCoordinate(Qt.point(mouse.x,mouse.y)).longitude
                          addMarker(latMouse, lngMouse)
                          count = lst.count
                          lst.append({"lat":latMouse,"lng": lngMouse})
                          console.log("left")
                          // writing cordinates to cpp files
                          // map2cpp.writeCordinate2cpp(coord.latitude.toFixed(6),coord.longitude.toFixed(6))
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
                  console.log("button in!");
                  console.log(count)
                  if(count > 1){
                      lst.remove(count)
                      count -=1
                  }
                  console.log("after "+ count)

              }
          }

          function getPosition(lat,lng){
              mapview.pan(latitude - lat, longitude - lng)
              latitude = lat
              longitude = lng
                  }

//          function setCenter(lat,lng){
//              mapview.pan(latitude - lat, longitude - lng)
//              latitude = lat
//              longitude = lng
//                  }

          function addMarker(latitude, longitude)
          {
              var Component = Qt.createComponent("qrc:/Marker.qml")
              var Item = Component.createObject(mapview, { coordinate:
              QtPositioning.coordinate(latitude, longitude) })
              mapview.addMapItem(Item)
          }

//    function getPosition(lat,lng){
//        mapview.pan(latCenter - lat, lngCenter - lng)
//        latCenter = lat
//        latCenter = lng
//            }

}
