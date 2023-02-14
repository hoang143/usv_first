import QtQuick 2.15

Rectangle{
    id: rightScreen
    color: "orange"
    width: parent.width *4/5
    anchors{
        top: parent.top
        bottom: bottomBar.top
        right: parent.right
    }
            MapView{
                id: rectangleMap
            }

            VelocityGauge{
                id: rectangleVelocityGauge
            }

}
