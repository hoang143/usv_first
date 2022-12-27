import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle{
    id: rectangleHome
    //border.width: 10
    color: "yellow"
    anchors{
        left: parent.left
        //leftMargin: 10
        right: parent.right
        top: parent.top
    }
    height: parent.height * .3

    Image{
        id: homeIcon
        anchors{
            top: rectangleHome.top
            topMargin: 10
            left: rectangleHome.left
            leftMargin: parent.width*0.005
        }

        height: rectangleHome.height *.3
        width: rectangleHome.width *.3
        fillMode: Image.PreserveAspectFit
        source: "qrc:/ui/assets/home.png"
    }

    Label{
        id:homeLabel
        text: "Home"
        anchors{
            bottom: homeIcon.bottom
            left: homeIcon.right
            leftMargin: parent.width *.01
        }
        font.pixelSize:rectangleHome.height *.2
        font.bold: true
    }

    Rectangle{
    id:rectangleCollectGarbage
    color: "yellow"
    anchors{
        top: homeIcon.bottom
        topMargin: parent.height * .1
        left:parent.left
        right:parent.right
    }
    height: parent.height *.25

    Image{
        id: collectGarbageIcon
        anchors{
            top: parent.top
            topMargin: parent.height* 0.15
            left: parent.left
            leftMargin: parent.width * .1
        }

        height: rectangleCollectGarbage.height *.7
        width: rectangleCollectGarbage.width *.2
        fillMode: Image.PreserveAspectFit
        source: "qrc:/ui/assets/garbage.png"
    }

    Label{
        text: "Collect Garbage"
        anchors{
            bottom: collectGarbageIcon.bottom
            left: collectGarbageIcon.right
            leftMargin: parent.width * .01
        }
        font.pointSize: collectGarbageIcon.height *.3
        font.bold: false
    }

    MouseArea{
        anchors.fill: parent
        onClicked: {
            rightScreen.visible = true
            rightScreenDepthSurvey.visible = false
            rightScreenWelcome.visible = false
            parent.color = 'white'
            rectangleDepthSurvey.color = 'yellow'

        }
    }
}

    Rectangle{
    id: rectangleDepthSurvey
    color: "yellow"
    anchors{
        top: rectangleCollectGarbage.bottom
        topMargin: parent.height * .05
        left:parent.left
        right:parent.right
    }
    height: parent.height *.25

    Image{
        id: depthSurveyIcon
        anchors{
            top: parent.top
            topMargin: parent.height * .15
            left: parent.left
            leftMargin: parent.width * .15
        }

        height: parent.height *.7
        //width: rectangleHome.width *.2
        fillMode: Image.PreserveAspectFit
        source: "qrc:/ui/assets/depth.png"

    }

    Label{
        text: "Depth Survey"
        anchors{
            bottom: depthSurveyIcon.bottom
            left: depthSurveyIcon.right
            leftMargin: parent.width * .05
        }
        font.pointSize: depthSurveyIcon.height *.3
        font.bold: false
    }

    MouseArea{
        anchors.fill: parent
        onClicked: {
            rightScreen.visible = false
            rightScreenDepthSurvey.visible = true
            rightScreenWelcome.visible = false
            passwordScreen.visible = false
            parent.color = 'white'
            rectangleCollectGarbage.color = 'yellow'
        }
    }
}
}
