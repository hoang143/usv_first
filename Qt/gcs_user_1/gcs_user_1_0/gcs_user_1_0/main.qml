import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.15
import "ui/bottomBar"
import "ui/rightScreen"
import "ui/leftScreen"
import "ui/rightScreenDepthSurvey"
import "ui/rightScreenWelcome"
import "ui/passWord"
import udp.to.qml 1.0

Window {
    id: mainwindow
    width: 1280
    height: 720
    visible: true
    title: qsTr("Ground Station")

    // Create an udp socket
    UdpToQml{
        id: udp
    }

    // Properties
    property real thrustManual: 0
    property real desireYawManual: 0

    // CONTENTS
    BottomBar{
        id:bottomBar
    }

    LeftScreen{
        id: leftScreen
    }

    RightScreen{
        id: rightScreen
        visible: false
    }

    RightScreenDepthSurvey{
        id:rightScreenDepthSurvey
        visible: false
    }

    RightScreenWelcome{
        id:rightScreenWelcome
        visible: true
    }

    PassWordScreen{
        id:passwordScreen
        visible: false
    }
}
