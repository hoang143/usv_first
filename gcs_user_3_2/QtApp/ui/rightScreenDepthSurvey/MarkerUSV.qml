import QtQuick 2.0
import QtLocation 5.11

MapQuickItem {
    id: marker
    property alias text: txt.text
    //signal clicked()
    sourceItem: Rectangle {
        width: 60
        height: 60
        color: "transparent"  //xoa phong

        Image {
            anchors.fill: parent
            source: "qrc:/ui/assets/markerUSV2.png"
            fillMode: Image.PreserveAspectFit
            sourceSize: Qt.size(parent.width, parent.height)
            rotation: usvMapAngle - 15

        }

        Text {
            id: txt
            color: "white"
            anchors.bottom: parent.top
            // anchors.fill: parent
        }

        MouseArea{
            z:10
            anchors.fill: parent
            onClicked:{
                //clicked()
                console.log("be clicked")

            }
        }

    }
    opacity: 1.0
    anchorPoint: Qt.point(sourceItem.width/2, sourceItem.height/2)
}

