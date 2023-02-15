import QtQuick 2.15
import QtQuick.Controls 2.0
import QtQuick.Controls 2.15

Rectangle{
    id: rightScreenDepthSurvey
    color: colorBackground
    width: parent.width *0.8
    anchors{
        top: parent.top
        bottom: bottomBar.top
        right: parent.right
    }
    MapViewDepthSurvey{
        id:mapViewDepthSurvey
    }

    DepthChart2D{
        id:depthChart2D
    }

//    DepthChart3D{
//        id: depthChart3D
//        visible: true
//    }

    VelocityGauge{
        id:rectangleVelocityGauge
    }
}
