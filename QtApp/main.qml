import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.15
import udp.to.qml 1.0
import QtLocation 5.15
import QtPositioning 5.6
import QtQml 2.0
import QtMultimedia 5.12
import "ui/bottomBar"
import "ui/rightScreen"
import "ui/leftScreen"
import "ui/rightScreenDepthSurvey"
import "ui/rightScreenWelcome"
import "ui/passWord"
import "ui/leftScreenSetting"
import "ui/devView"

Window {
    id: mainwindow
    width: 1280
    height: 720
    visible: true
    title: qsTr("Ground Station")

// -------------- Properties --------------
    property real thrustManual: 0
    property real desireYawManual: 0
    property int indexDepthChart2D: 0
    property double yDepthChart2D: 2
    property int i: 0
    property int step: 10
    property var lstLatZigzag:[]
    property var lstLngZigzag:[]
    property var lstLatZigzag12:[]
    property var lstLngZigzag12:[]
    property var lstLatZigzag34:[]
    property var lstLngZigzag34:[]
    property var lstLat:[]
    property var lstLng:[]
    property int countZigzagPoint12:Math.floor(codToMeter(lstLat[1], lstLng[1], lstLat[2], lstLng[2], count)/step)
    //property int countZigzagPoint34: Math.floor(codToMeter(lstLat[3], lstLng[3], lstLat[4], lstLng[4], count)/step)
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
    property int countLineUSV: 0
    property int selectAutoModeGcs: 1
    property int cout_dele: 0
    property bool stateStopWatch: false
    property int usvMapAngle: udp.usvYaw
    property string colorTheme:"yellow"
    property string colorBackground:"white"

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

    function getLstLatLng(){
        for (i = 0; i <countZigzagPoint12; i++){
            lstLatZigzag12[i] = lstLat[1] + step*((lstLat[2] - lstLat[1]) / codToMeter(lstLat[1], lstLng[1], lstLat[2], lstLng[2], count)) * i
            lstLngZigzag12[i] = lstLng[1] + step*((lstLng[2] - lstLng[1]) / codToMeter(lstLat[1], lstLng[1], lstLat[2], lstLng[2], count)) * i
            lstLatZigzag34[i] = lstLat[4] + step*((lstLat[3] - lstLat[4]) / codToMeter(lstLat[1], lstLng[1], lstLat[2], lstLng[2], count)) * i
            lstLngZigzag34[i] = lstLng[4] + step*((lstLng[3] - lstLng[4]) / codToMeter(lstLat[1], lstLng[1], lstLat[2], lstLng[2], count)) * i
        }
    }

    function getLstZigzag(){
        for(i = 0; i < countZigzagPoint12; i++){
            lstLatZigzag[2*i] = lstLatZigzag12[i]
            lstLngZigzag[2*i] = lstLngZigzag12[i]
        }
        for(i = 0; i < countZigzagPoint12; i++){
            lstLatZigzag[2*i + 1] = lstLatZigzag34[i]
            lstLngZigzag[2*i + 1] = lstLngZigzag34[i]
        }
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

    DevView{
        id:devView
        visible: false
    }
}
