//import QtQuick 2.0
//import QtLocation 5.12

//MapQuickItem
//{
//    id: marker
//    anchorPoint.x: marker.width/100
//    anchorPoint.y: marker.height
//    sourceItem: Image
//{
//  Image
//    {
//    id: icon
//    source: "qrc:/marker.png"
//    sourceSize.width: 40
//    sourceSize.height: 40
//    }

//}
//}


import QtQuick 2.0
import QtLocation 5.11

MapQuickItem {
    id: marker
    //signal clicked()
    property alias text: kk.text
    sourceItem: Rectangle {
        width: 20
        height: 20
        color: "transparent"  //xoa phong
        Image {
            anchors.fill: parent
            source: "qrc:/ui/assets/marker.png"
            fillMode: Image.PreserveAspectFit
            sourceSize: Qt.size(parent.width, parent.height)
        }
        Text {
            id: kk
            text: qsTr("text")
            x:25
            y:2
        }
    }
    opacity: 1.0
    anchorPoint: Qt.point(sourceItem.width/2, sourceItem.height/2)
}
