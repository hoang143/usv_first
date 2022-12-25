import QtQuick 2.15

Rectangle{
    id: rightScreen
    //border.width: 20
    color: "orange"
    width: parent.width *.8
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
