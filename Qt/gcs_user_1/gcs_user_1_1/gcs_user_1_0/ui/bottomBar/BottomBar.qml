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
    color: "orange"
    height: parent.height / 20


    Timer {
        id:timerBottomBar
        interval: 100; running: true; repeat: true

        onTriggered:{
            if(udp.udpPacket == "") statusIndicatorConnected.active = false
            else statusIndicatorConnected.active = true
            if(udp.usvLat == 0) statusIndicatorGPS.active = false
            else statusIndicatorGPS.active = true
            if(Math.floor(udp.usvYaw) == 0) statusIndicatorCompass.active = false
            else statusIndicatorCompass.active = true
        }
    }

    Rectangle{
        id:rectangleSettingIcon
        color: "orange"
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
                    parent.color = 'pink'
                }
                else {
                    leftScreen.visible = true
                    leftScreenSetting.visible = false
                    parent.color = "orange"
                }
                state += 1
            }
        }
}
    Rectangle{
        id:rectangleHomeBottomBar
        color: "orange"
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
            anchors.fill: parent
            onClicked: {
                    rightScreen.visible = false
                    rightScreenDepthSurvey.visible = false
                    rightScreenWelcome.visible = true
                    parent.color = 'pink'
            }
        }
}

    Rectangle{
        id:rectangleSleepBottomBar
        color: "orange"
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
            anchors.fill: parent
            onClicked: {
                    rightScreen.visible = false
                    rightScreenDepthSurvey.visible = false
                    rightScreenWelcome.visible = false
                    passwordScreen.visible = true
                    parent.color = 'pink'
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
