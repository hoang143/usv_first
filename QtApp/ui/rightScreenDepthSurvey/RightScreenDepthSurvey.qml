import QtQuick 2.15

Rectangle{
    id: rightScreenDepthSurvey
    color: "white"
    width: parent.width *0.8
    anchors{
        top: parent.top
        bottom: bottomBar.top
        right: parent.right
    }
    MapViewDepthSurvey{
        id:mapViewDepthSurvey
    }

}
