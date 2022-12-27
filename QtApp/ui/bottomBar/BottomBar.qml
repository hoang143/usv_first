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
    color: "yellow"
    height: parent.height / 20
    property int countCompass:0
    property int countGPS:0
    property int countPacket:0
    property var valCheckGPS
    property var valCheckCompass
    property var valCheckPacket

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
        }
    }
    Rectangle{
        id:rectangleSettingIcon
        color: "yellow"
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
                    parent.color = 'white'
                }
                else {
                    leftScreen.visible = true
                    leftScreenSetting.visible = false
                    parent.color = "yellow"
                }
                state += 1
            }
        }
}
    Rectangle{
        id:rectangleHomeBottomBar
        color: "yellow"
        anchors{
            right: parent.right
            rightMargin: parent.width * .1
            verticalCenter: parent.verticalCenter
        }

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
                    devView.visible = true
                    parent.color = 'pink'
                }
                else {
                    devView.visible = false
                    parent.color = "orange"
                }
                state += 1
            }
        }
}

    Rectangle{
        id:rectangleSleepBottomBar
        color: "yellow"
        anchors{
            right: parent.right
            rightMargin: parent.width * .03
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
                    parent.color = 'pink'
                }
                else {
                    passwordScreen.visible = false
                    parent.color = "orange"
                }
                state += 1
            }
        }
}

    StatusIndicator {
            id: statusIndicatorConnected
            anchors.centerIn: parent
            active: false
            color: "green"
        }
    Text {
        id: statusIndicatorConnectedText
        anchors{
            left: statusIndicatorConnected.right
            leftMargin: parent.width * .01
            verticalCenter: parent.verticalCenter
            horizontalCenter: parent.horizontalCenter
        }
        font.pixelSize: parent.height * .4
        text: "Connected"
    }

    StatusIndicator {
            id: statusIndicatorGPS
            anchors{
                left: statusIndicatorConnectedText.right
                leftMargin: parent.width * .15
                verticalCenter: parent.verticalCenter
            }

            color: "green"
        }
    Text {
        id: statusIndicatorGPSText
        anchors{
            left: statusIndicatorGPS.right
            leftMargin: parent.width * .01
            verticalCenter: parent.verticalCenter
            horizontalCenter: parent.horizontalCenter
        }
        font.pixelSize: parent.height * .4
        text: "GPS"
    }

    StatusIndicator {
            id: statusIndicatorCompass
            anchors{
                left: statusIndicatorGPSText.right
                leftMargin: parent.width * .39
                verticalCenter: parent.verticalCenter
            }
            active: false
            color: "green"
        }
    Text {
        id: statusIndicatorCompassText
        anchors{
            left: statusIndicatorCompass.right
            leftMargin: parent.width * .01
            verticalCenter: parent.verticalCenter
            horizontalCenter: parent.horizontalCenter
        }
        font.pixelSize: parent.height * .4
        text: "Compass"
    }

}
