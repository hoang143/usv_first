import QtQuick 2.15
import QtQuick.Extras 1.4
import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.3

Rectangle{
    id:bottombar
    anchors {
        left: parent.left
        right: parent.right
        bottom: parent.bottom
    }
    color: colorTheme
    height: parent.height / 20
    property int countCompass:0
    property int countGPS:0
    property int countPacket:0
    property int countDepth:0
    property var valCheckGPS
    property var valCheckCompass
    property var valCheckPacket
    property var valCheckDepth

    function isPacketAvailable (valCheck){
        if(valCheckPacket == valCheck) {countPacket +=1}
        else countPacket = 0
        valCheckPacket = valCheck
        if (countPacket > 60) {
                return false
        }
        else return true
}

    function isGPSAvailable (valCheck){
        if(valCheckGPS == valCheck) {countGPS +=1}
        else countGPS = 0
        valCheckGPS = valCheck
        if (countGPS > 50) {
                return false
        }
        else return true
}

    function isCompassAvailable (valCheck){
        if(valCheckCompass == valCheck) {countCompass +=1}
        else countCompass = 0
        valCheckCompass = valCheck
        if (countCompass > 50) {
                return false
        }
        else return true
}

    function isDepthAvailable (valCheck){
        if(valCheckDepth == valCheck) {countDepth +=1}
        else countDepth = 0
        valCheckDepth = valCheck
        if (countDepth > 50) {
                return false
        }
        else return true
}

    Timer {
        id:timerBottomBar
        interval: 100; running: true; repeat: true

        property int count: 0
        onTriggered:{
            if(isPacketAvailable(udp.udpPacket, countPacket)) statusIndicatorConnected.active = true
            else statusIndicatorConnected.active = false
            if(isGPSAvailable(udp.usvLat)) statusIndicatorGPS.active = true
            else statusIndicatorGPS.active = false
            if(isCompassAvailable(udp.usvYaw)) statusIndicatorCompass.active = true
            else statusIndicatorCompass.active = false
            if(isDepthAvailable(udp.usvYaw)) statusIndicatorDepth.active = true
            else statusIndicatorDepth.active = false
        }
    }
    Rectangle{
        id:rectangleSettingIcon
        color: colorTheme
        anchors{
            left: parent.left
            leftMargin: 30
            verticalCenter: parent.verticalCenter
        }

        height: parent.height
        width: parent.height
        Image{
            id: settingIcon
            anchors{
                horizontalCenter: parent.horizontalCenter
                verticalCenter: parent.verticalCenter
            }

            height: parent.height *.8
            fillMode: Image.PreserveAspectFit
            source: "qrc:/ui/assets/setting.png"
        }


        MouseArea{
            property int state: 0
            anchors.fill: parent
            onClicked: {
                if(state % 2 == 0) {
                    leftScreen.visible = false
                    leftScreenSetting.visible = true
                    parent.color = colorBackground
                }
                else {
                    leftScreen.visible = true
                    leftScreenSetting.visible = false
                    parent.color = colorTheme
                }
                state += 1
            }
        }
}
    Rectangle{
        id:rectangleHomeBottomBar
        color: colorTheme
//        anchors{
//            right: parent.right
//            rightMargin: parent.width * .1
//            verticalCenter: parent.verticalCenter
//        }
        anchors.centerIn: parent

        height: parent.height
        width: parent.height * 1.3
        Image{
            id: usvIconBottomBar
            anchors{
                horizontalCenter: parent.horizontalCenter
                verticalCenter: parent.verticalCenter
            }

            height: parent.height * .8
            fillMode: Image.PreserveAspectFit
            source: "qrc:/ui/assets/usvIconBottomBar1.png"
        }

        MouseArea{
            property int state: 0
            anchors.fill: parent
            onClicked: {
                if(state % 2 == 0) {
                    passwordScreenDevView.visible = true
//                    devView.visible = true
                    parent.color = colorBackground
                }
                else {
                    devView.visible = false
                    passwordScreenDevView.visible = false
                    parent.color = colorTheme
                }
                state += 1
            }
        }
}

    Rectangle{
        id:rectangleSleepBottomBar
        color: colorTheme
        anchors{
            left: rectangleSettingIcon.right
            leftMargin: parent.width * .03
            verticalCenter: parent.verticalCenter
        }

        height: parent.height
        width: parent.height
        Image{
            id: sleepIcon
            anchors{
                horizontalCenter: parent.horizontalCenter
                verticalCenter: parent.verticalCenter
            }

            height: parent.height * .8
            fillMode: Image.PreserveAspectFit
            source: "qrc:/ui/assets/sleepIcon.png"
        }


        MouseArea{
            property int state: 0
            anchors.fill: parent
            onClicked: {
                if(state % 2 == 0) {
                    passwordScreen.visible = true
                    rightScreenWelcome.visible = false
                    parent.color = colorBackground
                }
                else {
//                    passwordScreen.visible = false
                    parent.color = colorTheme
                }
                state += 1
            }
        }
}

    StatusIndicator {
            id: statusIndicatorConnected
            anchors{
                verticalCenter: parent.verticalCenter
                right: parent.right
                rightMargin: parent.height *.2
            }

            active: false
            color: "green"
        }
    Text {
        id: statusIndicatorConnectedText
        anchors{
            right: statusIndicatorConnected.left
            rightMargin: parent.width * .001
            verticalCenter: parent.verticalCenter
        }
        font.pixelSize: parent.height * .3
        text: "Connected"
    }

    StatusIndicator {
            id: statusIndicatorGPS
            anchors{
                right: statusIndicatorConnected.left
                rightMargin: parent.height *1.8
                verticalCenter: parent.verticalCenter
            }

            color: "green"
        }
    Text {
        id: statusIndicatorGPSText
        anchors{
            right: statusIndicatorGPS.left
            rightMargin: parent.width * .001
            verticalCenter: parent.verticalCenter
        }
        font.pixelSize: parent.height * .3
        text: "GPS"
    }

    StatusIndicator {
            id: statusIndicatorCompass
            anchors{
                right: statusIndicatorGPS.left
                rightMargin: parent.height * 1.8
                verticalCenter: parent.verticalCenter
            }
            active: false
            color: "green"
        }
    Text {
        id: statusIndicatorCompassText
        anchors{
            right: statusIndicatorCompass.left
            rightMargin: parent.width * .001
            verticalCenter: parent.verticalCenter
        }
        font.pixelSize: parent.height * .3
        text: "Compass"
    }

    StatusIndicator {
            id: statusIndicatorDepth
            anchors{
                right: statusIndicatorCompass.left
                rightMargin: parent.height * 1.8
                verticalCenter: parent.verticalCenter
            }
            active: false
            color: "green"
        }
    Text {
        id: statusIndicatorDepthText
        anchors{
            right: statusIndicatorDepth.left
            rightMargin: parent.width * .001
            verticalCenter: parent.verticalCenter
        }
        font.pixelSize: parent.height * .3
        text: "Depth"
    }

}
