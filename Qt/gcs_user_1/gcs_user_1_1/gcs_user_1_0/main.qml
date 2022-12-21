import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.15
import udp.to.qml 1.0
import QtLocation 5.15
import QtPositioning 5.6
import QtQml 2.0
import "ui/bottomBar"
import "ui/rightScreen"
import "ui/leftScreen"
import "ui/rightScreenDepthSurvey"
import "ui/rightScreenWelcome"
import "ui/passWord"
import "ui/leftScreenSetting"

Window {
    id: mainwindow
    width: 1280
    height: 720
    visible: true
    title: qsTr("Ground Station")


// -------------- Properties --------------
    property real thrustManual: 0
    property real desireYawManual: 0

    property int i: 0
    property var lstLat:[]
    property var lstLng:[]
    property var distance
    property real targetLat1Mode2Default: 0
    property real targetLng1Mode2Default: 0
    property real targetLat2Mode2Default: 0
    property real targetLng2Mode2Default: 0
    property real targetLat3Mode2Default: 0
    property real targetLng3Mode2Default: 0
    property real targetLat4Mode2Default: 0
    property real targetLng4Mode2Default: 0
    property int count: 0
    property int selectAutoModeGcs: 1
    property int cout_dele: 0

    // -------------- Signals --------------
    signal secPulse()

    // -------------- Functions --------------
    function codToMeter(latitude,longitude,p_latitude,p_longitude,count)
    {
        if(count >0){
            var A=(latitude - p_latitude)*(3.1415/180)*6378000    //meters
            var B=(longitude - p_longitude)*(3.1415/180)*6378000
            var  dis = Math.sqrt(A*A+B*B)
            p_latitude = latitude
            p_longitude = longitude

            return dis
        }
        else return 0
    }

    ListModel{
        id:lstUSV
    }

    ListModel{
        id:markerUSV
    }

    ListModel{
        id:lst
    }
    ListModel{
       id:mark_
    }

    ListModel{
        id:markerHome
    }

    // Create an udp socket
    UdpToQml{
        id: udp
    }

    BottomBar{
        id:bottomBar
    }

    LeftScreen{
        id: leftScreen
    }

    RightScreen{
        id: rightScreen
        visible: true
    }

    RightScreenDepthSurvey{
        id:rightScreenDepthSurvey
        visible: false
    }

    RightScreenWelcome{
        id:rightScreenWelcome
        visible: false
    }

    PassWordScreen{
        id:passwordScreen
        visible: false
    }

    LeftScreenSetting{
        id:leftScreenSetting
        visible: false
    }
}
