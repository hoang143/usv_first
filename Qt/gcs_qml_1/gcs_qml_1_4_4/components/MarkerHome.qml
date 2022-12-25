import QtQuick 2.0
import QtLocation 5.12

MapQuickItem
{
    id: markerHome
    anchorPoint.x: markerHome.width
    anchorPoint.y: markerHome.height
    sourceItem: Image
{
  Image
    {
    id: icon
    source: "qrc:/markerHome.png"
    sourceSize.width: 40
    sourceSize.height: 40
    }

}
}


