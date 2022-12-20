import QtQuick 2.0
import QtLocation 5.12

MapQuickItem
{
    id: markerUSV
    anchorPoint.x: markerUSV.width
    anchorPoint.y: markerUSV.height
    sourceItem: Image
{
  Image
    {
    id: icon
    source: "qrc:/markerUSV.png"
    sourceSize.width: 20
    sourceSize.height: 20
    }

}
}


