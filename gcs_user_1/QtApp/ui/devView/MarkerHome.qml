//import QtQuick 2.0
//import QtLocation 5.12

//MapQuickItem
//{
//    id: markerHome
//    anchorPoint.x: markerHome.width
//    anchorPoint.y: markerHome.height
//    sourceItem: Image
//{
//  Image
//    {
//    id: icon
//    source: "qrc:/markerHome.png"
//    sourceSize.width: 40
//    sourceSize.height: 40
//    }

//}
//}

import QtQuick 2.0
import QtLocation 5.11

MapQuickItem {
    id: marker
    property alias text: txt.text
    //signal clicked()
    sourceItem: Rectangle {
        width: 4
        height: 6
        color: "transparent"  //xoa phong
        Image {
            anchors.fill: parent
            source: "qrc:/ui/devView/markerHome.png"
            sourceSize: Qt.size(parent.width, parent.height)

        }
        Text {
            id: txt
            color: "white"
            anchors.bottom: parent.top
            // anchors.fill: parent
        }
//        MouseArea{
//            z:10
//            anchors.fill: parent
//            onClicked:{
//                //clicked()
//                console.log("be clicked")
//            }
//        }

    }
    opacity: 1.0
    anchorPoint: Qt.point(sourceItem.width/2, sourceItem.height)
}
