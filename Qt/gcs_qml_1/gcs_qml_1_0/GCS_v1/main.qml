import QtQuick 2.12
import QtLocation 5.6
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import GetPosition 1.0
import QtQuick.Layouts 1.15
import io.qt.examples.backend 1.0

Window {
    id: main
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    property double latCenter
    property double lngCenter
    property double latMouse
    property double lngMouse
    property alias text1 : textDisplay.text

    GetPosition{
        id: readUdp

    }

    RowLayout{
        Text{
            id: textDisplay
            text: readUdp.qmlReadData
        }

        Button{
            id: read_but
            text: "Read"
            onClicked:{
                main.text1 = readUdp.qmlReadData
            }
        }
        Button{
            id: write_but
            text: "Write"
            onClicked:{
                readUdp.qmlReadData = 50
            }
        }
    }

    SpinBox {
        id: spinbox
        editable: true
        from: 0
        value: 210
        to: 100 * 100
        stepSize: 1
        anchors.centerIn: parent

        property int decimals: 9
        property real realValue: value / 100

        validator: DoubleValidator {
            bottom: Math.min(spinbox.from, spinbox.to)
            top:  Math.max(spinbox.from, spinbox.to)
        }

        textFromValue: function(value, locale) {
            return Number(value / 100).toLocaleString(locale, 'f', spinbox.decimals)
        }

        valueFromText: function(text, locale) {
            return Number.fromLocaleString(locale, text) * 100
        }
    }

    function getPosition(lat,lng){
          mapview.pan(latitude - lat, longitude - lng)
          latitude = lat
          longitude = lng
    }
    function addMarker(latitude, longitude) {
      var Component = Qt.createComponent("qrc:/Marker.qml")
      var Item = Component.createObject(mapview, { coordinate:
      QtPositioning.coordinate(latitude, longitude) })
      mapview.addMapItem(Item)
    }


}
