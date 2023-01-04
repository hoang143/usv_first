import QtQuick 2.15
import QtQuick.Extras 1.4
import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.4
import udp.to.qml 1.0
import QtQml 2.15

Rectangle{
    id: usvStatesDisplayDepthSurvey
    color: colorBackground
    anchors{
        left: mapViewDepthSurvey.right
        leftMargin: parent.width *.01
        top: parent.top
        topMargin: parent.height *.01
        right: parent.right
        rightMargin: parent.right *.01
    }
    height: parent.height * .98
    width: parent.width * .28

    property real usvLatPrev: 0
    property real usvLngPrev: 0
    signal secPulse()
    signal miliPulse()

    function debug(a)
    {
        console.log(a)
    }

    Rectangle{
        id:rectangleStopWatch
        color: colorBackground
        anchors{
            left: parent.left
            right: parent.right
            top: parent.top
        }
        height: parent.height * .07

        //----------------------stop watch -------------------

        Image{
            id: stopWatchIcon
            anchors{
                top: parent.top
                topMargin: parent.height *.1
                left: parent.left
                leftMargin: parent.width *.02
            }
            height: rectangleStopWatch.height *.8
            fillMode: Image.PreserveAspectFit
            source: "qrc:/ui/assets/stopwatch.png"
            MouseArea{
                anchors.fill: parent
                onClicked:{
                    timer.seconds = 0
                }
                onPressed:{
                    timeLcd.color = colorBackground
                }
                onReleased:{
                    timeLcd.color = "blue"
                }
            }
        }

        Item {
            id: stopWatch
            anchors{
                top: parent.top
                topMargin: parent.height *.25
                left: stopWatchIcon.right
                leftMargin: parent.width *.03
                //centerIn: parent
            }
            height: parent.height * .8
            width: parent.width * .3
                Text {
                    id: timeLcd
                    color: "blue"
                    font.pixelSize: stopWatchIcon.height * .4
                    text: "00:00:00"
//                    Layout.alignment: Qt.AlignCenter
                }

                Timer {
                    id: timer
                    property int hours
                    property int minutes
                    property int seconds: 0
                    property int seconds1
                    property var strHours
                    property var strMinutes
                    property var strSeconds
                    interval: 1000; running: stateStopWatch; repeat: true

                    onTriggered:{
                        //console.log(seconds)
                        hours = seconds/3600
                        minutes = (seconds%3600)/60
                        seconds1 = seconds%60
                        strHours = hours < 10 ? "0" + hours : hours
                        strMinutes = minutes < 10 ? "0" + minutes : minutes
                        strSeconds = seconds1 < 10 ? "0" + seconds1 : seconds1
                        timeLcd.text = strHours + ":" + strMinutes + ":" + strSeconds
                        seconds += 1

                        mainwindow.secPulse()
                        usvStatesDisplayDepthSurvey.secPulse()
                    }
                }
                Timer {
                    id: miliTimer
                    interval: 1; running: true; repeat: true

                    onTriggered:{
                        usvStatesDisplayDepthSurvey.miliPulse()
                    }
                }
            }
        //-------------------------------end stop watch ---------------------------------
        Rectangle{
            id:rectangleBattery
            border.width: 7
            color: colorBackground
            anchors{
                right: parent.right
                rightMargin: parent.width * .22
                top: parent.top
                topMargin: parent.height *.17
            }
            width: parent.width *.2
            height: parent.height * .55

//            Image{
//                id: batteryImage
//                anchors.verticalCenter: parent.verticalCenter
//                width: parent.width*1.13
//                height: parent.height*1.2
//                //fillMode: Image.PreserveAspectFit
//                source: "qrc:/ui/assets/battery.png"
//            }

            ProgressBar {
                id: batteryProgressBar
                minimumValue: 0
                maximumValue: 100
                value: udp.batteryPercentage

                anchors{
                    verticalCenter: parent.verticalCenter
                    horizontalCenter: parent.horizontalCenter
                }
                width: parent.width * .9
                height: parent.height * .85
            }

            Text {
                id: batteryTextDot
                anchors{
                    left: batteryProgressBar.right
                    leftMargin: parent.width * .01
                    bottom: batteryProgressBar.bottom
                    bottomMargin: 5.5
                }

                font.pixelSize:batteryProgressBar.height * .65
                text: "]"
            }

            Text {
                id: batteryText
                color: "blue"
                anchors{
                    top: parent.top
                    topMargin: parent.height * .15
                    left: batteryProgressBar.right
                    leftMargin: parent.width * .3
                }

                font.pixelSize:batteryProgressBar.height * .65
                text: Number(udp.batteryPercentage).toFixed(0) + " %"
            }
        }
    }
    Rectangle{
        id: homeLocationDisplay
        color: 'orange'
        anchors{
            top: rectangleStopWatch.bottom
            topMargin: 0
            right:parent.right
        }
        width: parent.width
        height: parent.height *.1

        Image{
            id: homeDistanceIcon
            anchors{
                top: parent.top
                topMargin: parent.height * .08
                left: parent.left
                leftMargin: parent.width * .02
            }

            height: parent.height *.55
            width: parent.width *.15
            fillMode: Image.PreserveAspectFit
            source: "qrc:/ui/assets/homeDistance.png"
        }
        Label{
            text: "To home"
            anchors{
                top: parent.top
                topMargin: parent.height * .1
                left: homeDistanceIcon.right
                leftMargin: parent.width * .005
            }
            font.pointSize: homeDistanceIcon.height *.3
            font.bold: false
        }
        Label{
            id: distanceToHomeLcd
            text: Number(udp.distanceToHome).toFixed(1) + " m"
            color:"blue"
            anchors{
                top: parent.top
                topMargin: parent.height * .4
                left: homeDistanceIcon.right
                leftMargin: parent.width * .006
            }
            font.pointSize: homeDistanceIcon.height *.3
            font.bold: false


        }
        Label{
            text: "Home location"
            anchors{
                top: parent.top
                topMargin: parent.height * .1
                right: parent.right
                rightMargin: parent.width * .1
            }
            font.pointSize: homeDistanceIcon.height *.3
            font.bold: false
        }
        Label{
            text: Number(udp.homeLat).toFixed(5)
            color:"blue"
            anchors{
                top: parent.top
                topMargin: parent.height * .4
                right: parent.right
                rightMargin: parent.width * .33
            }
            font.pointSize: homeDistanceIcon.height *.3
            font.bold: false
        }
        Label{
            text: Number(udp.homeLng).toFixed(5)
            color:"blue"
            anchors{
                top: parent.top
                topMargin: parent.height * .4
                right: parent.right
                rightMargin: parent.width * .02
            }
            font.pointSize: homeDistanceIcon.height *.3
            font.bold: false
        }
    }
    Rectangle{
        color: colorBackground
        anchors{
            top: homeLocationDisplay.bottom
            topMargin: 0
            right:parent.right
        }
        width: parent.width
        height: parent.height *.08
        Row{
            spacing: usvStatesDisplayDepthSurvey.width * .03
            anchors{
                fill: parent
                leftMargin: usvStatesDisplayDepthSurvey.width * .06
            }
            Label{
                text: "Progress"
                anchors{
                    verticalCenter: parent.verticalCenter
                }
                font.pixelSize: usvStatesDisplayDepthSurvey.height * .025
                font.bold: true
            }
            ProgressBar{
                id: trackingProgressBar
                minimumValue: 0
                maximumValue: 100
                anchors{
                    verticalCenter: parent.verticalCenter
                    right: trackingProgressLcd.left
                    rightMargin: usvStatesDisplayDepthSurvey.width * .03
                }
                width: usvStatesDisplayDepthSurvey.width * .4
                height: usvStatesDisplayDepthSurvey.height * .03
                value: 100*udp.currentTarget/(udp.stepNo*2)
            }
            Label{
                id: trackingProgressLcd
                text: Number(100*udp.currentTarget/(udp.stepNo*2)).toFixed(0) + "%"
                color: "blue"
                anchors{
                    verticalCenter: parent.verticalCenter
                    right: parent.right
                    rightMargin: usvStatesDisplayDepthSurvey.width * .05
                }
                font.pixelSize: usvStatesDisplayDepthSurvey.height * .025
                font.bold: false
            }

        }
    }

    CircularGauge {
        id: compassGauge
        maximumValue: 180
        minimumValue: -180
        stepSize: 1
        value: udp.usvYaw
        anchors{
            top: rectangleStopWatch.bottom
            topMargin: parent.height * .22
            horizontalCenter: parent.horizontalCenter
        }
        width: parent.width * .7
        style: CircularGaugeStyle {
            labelStepSize: 40
            maximumValueAngle: 160
            minimumValueAngle: -160
        }
        Label{
            id: compassGaugeLabel
            text: "Compass"
            anchors{
                bottom: compassGauge.bottom
                bottomMargin: compassGauge.height * .35
                horizontalCenter: parent.horizontalCenter
            }
            font.pixelSize:usvStatesDisplayDepthSurvey.height *.021
            font.bold: false
        }
        Label{
            id: compassLcd
            color: "blue"
            text: "  "+udp.usvYaw + "°"
            anchors{
                bottom: compassGaugeLabel.top
                bottomMargin: compassGauge.height * .17
                horizontalCenter: parent.horizontalCenter
            }
            font.pixelSize:usvStatesDisplayDepthSurvey.height *.05
            font.bold: false
        }
    }
    CircularGauge {
        id: velocityGauge
        maximumValue: 10
        minimumValue: 0
        stepSize: 0.1
        value: 0
        tickmarksVisible: true
        anchors{
            horizontalCenter: parent.horizontalCenter
            top: rectangleStopWatch.bottom
            topMargin: parent.height * .55
        }
        width: parent.width * .7
        style: CircularGaugeStyle {
            tickmarkStepSize: 0.5
            labelStepSize: 2
            maximumValueAngle: 90
            minimumValueAngle: -90
            minorTickmarkCount: 2
        }
        property real locationDifference : 0

        Connections{
            target: usvStatesDisplayDepthSurvey
            onSecPulse:{
                velocityGauge.locationDifference = codToMeter(udp.usvLat,udp.usvLng,usvLatPrev,usvLngPrev,1)
                if (velocityGauge.locationDifference > 10)
                    velocityGauge.locationDifference = 10
                velocityGauge.value = velocityGauge.locationDifference

                usvLatPrev = udp.usvLat
                usvLngPrev = udp.usvLng
            }
        }
        Label{
            id:velocityGaugeLabel
            color: "blue"
            text: Number(velocityGauge.locationDifference).toFixed(1)
            anchors{
                bottom: velocityLcd.top
                bottomMargin: velocityGauge.height * .15
                horizontalCenter: parent.horizontalCenter
            }
            font.pixelSize:usvStatesDisplayDepthSurvey.height *.05
            font.bold: false
        }
        Label{
            id: velocityLcd
            text: "Velocity (m/s)"
            anchors{
                bottom: velocityGauge.bottom
                bottomMargin: velocityGauge.height * .34
                horizontalCenter: parent.horizontalCenter
            }
            font.pixelSize:usvStatesDisplayDepthSurvey.height *.021
            font.bold: false
        }
    }

}


