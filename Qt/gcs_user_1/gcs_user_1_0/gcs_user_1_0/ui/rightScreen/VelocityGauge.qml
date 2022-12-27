import QtQuick 2.15
import QtQuick.Extras 1.4
import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.4


Rectangle{
    id: rectangleVelocity
    color: 'white'
    anchors{
        left: rectangleMap.right
        leftMargin: parent.width *.01
        top: parent.top
        topMargin: parent.height *.01
        right: parent.right
        rightMargin: parent.right *.01

    }
    height: parent.height * .98
    width: parent.width * .28

    Rectangle{
        id:rectangleStopWatch
        color: 'pink'
        anchors{
            left: parent.left
            right: parent.right
            top: parent.top
        }
        height: parent.height * .1

        //----------------------stop watch -------------------

        Image{
            id: stopWatchIcon
            anchors{
                top: parent.top
                topMargin: parent.height *.1
                left: parent.left
                leftMargin: parent.width *.05
            }

            height: rectangleStopWatch.height *.8
            fillMode: Image.PreserveAspectFit
            source: "qrc:/ui/assets/stopwatch.png"
        }

        Item {
            id: stopWatch
            anchors{
                bottom: stopWatchIcon.bottom
                left: stopWatchIcon.right
                leftMargin: parent.width *.05
                //centerIn: parent
            }
            height: parent.height * .5
                Text {
                    id: time
                    font.pixelSize: stopWatchIcon.height * .4
                    text: "00:00:00"
//                    Layout.alignment: Qt.AlignCenter
                }

                Timer {
                    property int hours
                    property int minutes
                    property int seconds: 0
                    property int seconds1
                    property var strHours
                    property var strMinutes
                    property var strSeconds
                    interval: 1000; running: true; repeat: true

                    onTriggered:{
                            //console.log(seconds)
                            hours = seconds/3600
                            minutes = (seconds%3600)/60
                            seconds1 = seconds%60
                            strHours = hours < 10 ? "0" + hours : hours
                            strMinutes = minutes < 10 ? "0" + minutes : minutes
                            strSeconds = seconds1 < 10 ? "0" + seconds1 : seconds1
                            time.text = strHours + ":" + strMinutes + ":" + strSeconds
                            seconds += 1
                    }
                }
            }
        //-------------------------------end stop watch ---------------------------------
        Rectangle{
            id:rectangleBattery
            border.width: 5
            color: 'pink'
            anchors{
                right: rectangleStopWatch.right
                rightMargin: parent.width * .2
                verticalCenter: parent.verticalCenter
            }
            width: parent.width *.2
            height: parent.height * .5

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
                value: 0.5
                anchors{
                    verticalCenter: parent.verticalCenter
                    horizontalCenter: parent.horizontalCenter
                }
                width: parent.width * .9
                height: parent.height * .9
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
                anchors{
                    left: batteryProgressBar.right
                    leftMargin: parent.width * .3
                    bottom: batteryProgressBar.bottom
                }

                font.pixelSize:batteryProgressBar.height * .65
                text: "50%"
            }
        }
    }

    Text {
        id: processText
        anchors{
            top: rectangleStopWatch.bottom
            topMargin: parent.height * .01
            left:parent.left
            leftMargin: parent.width * .1
        }
        font.pixelSize: parent.height * .03
        text: qsTr("Process(50%)")
    }

    Rectangle{
        id: rectangleProcessBar
        color: 'pink'
        anchors{
            top: rectangleStopWatch.bottom
            topMargin: parent.height * .05
            right:parent.right
            rightMargin: parent.width * .05
        }
        width: parent.width *.85
        height: parent.height *.03

        ProgressBar {
            id: processBar
            value: 0.5
            //indeterminate: true
            anchors{
                verticalCenter: parent.verticalCenter
                horizontalCenter: parent.horizontalCenter
            }
            width: parent.width
            height: parent.height
        }

    }

    Rectangle{
        id: rectangleDistanceToHome
        color: 'pink'
        anchors{
            top: rectangleProcessBar.bottom
            topMargin: parent.height * .03
            right:parent.right
        }
        width: parent.width
        height: parent.height *.1

        Image{
            id: homeDistanceIcon
            anchors{
                verticalCenter: parent.verticalCenter
                left: parent.left
                leftMargin: parent.width * .05
            }

            height: parent.height *.7
            width: rectangleHome.width *.2
            fillMode: Image.PreserveAspectFit
            source: "qrc:/ui/assets/homeDistance.png"
        }
        Label{
            text: "100m"
            anchors{
                verticalCenter: parent.verticalCenter
                left: homeDistanceIcon.right
                leftMargin: parent.width * .02
            }
            font.pointSize: homeDistanceIcon.height *.3
            font.bold: false
        }

    }

    CircularGauge {
        id: velocityGauge
        maximumValue: 300
        minimumValue: 0
        stepSize: 1
        value: 200
        anchors{
            top: rectangleStopWatch.bottom
            topMargin: parent.height * .22
            horizontalCenter: parent.horizontalCenter
        }
        width: parent.width * .7
        style: CircularGaugeStyle {
            labelStepSize: 40
            maximumValueAngle: 150
            minimumValueAngle: -150
        }
    }

    Label{
        id:insideVelocityGauge
        text: "Velocity(cm/s)\n       12"
        anchors{
            bottom: velocityGauge.bottom
            bottomMargin: velocityGauge.height * .27
            horizontalCenter: parent.horizontalCenter
        }
        font.pixelSize:velocityGauge.height *.06
        font.bold: false
    }

    CircularGauge {
        id: compassGauge
        maximumValue: 340
        minimumValue: 20
        stepSize: 1
        value: 120
        anchors{
            horizontalCenter: parent.horizontalCenter
            top: velocityGauge.bottom
            topMargin: parent.height * .02
            bottom: rectangleVelocity.bottom
            bottomMargin: parent.height * .02
        }
        width: parent.width * .7
        style: CircularGaugeStyle {
            labelStepSize: 40
            maximumValueAngle: 160
            minimumValueAngle: -160
        }
    }

    Label{
        id:insideCompassGauge
        text: "Compass(°)\n       12"
        anchors{
            bottom: compassGauge.bottom
            bottomMargin: compassGauge.height * .27
            horizontalCenter: parent.horizontalCenter
        }
        font.pixelSize:compassGauge.height *.05
        font.bold: false
    }

}


