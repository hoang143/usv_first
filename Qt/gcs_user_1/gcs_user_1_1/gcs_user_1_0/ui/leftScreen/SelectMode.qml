import QtQuick 2.15
import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.3

Rectangle{
    id: rectangleSelectMode
    color: "white"
    anchors{
        left: parent.left
        right: parent.right
        bottom: rectangleControlManualButton.top
        top: rectangleHome.bottom
        topMargin: 10
    }
    height: parent.height * .3

    property int selectAutoModeGcs: 1

    Image{
        id: selectModeIcon
        anchors{
            top: rectangleSelectMode.top
            topMargin: 10
            left: rectangleSelectMode.left
            leftMargin: parent.width*0.005
        }

        height: rectangleSelectMode.height *.2
        width: rectangleSelectMode.width *.2
        fillMode: Image.PreserveAspectFit
        source: "qrc:/ui/assets/selectMode.png"
    }

    Label{
        id:selectModeLabel
        text: "Select Mode"
        anchors{
            bottom: selectModeIcon.bottom
            left: selectModeIcon.right
            leftMargin: parent.width *.01
        }
        font.pixelSize:rectangleSelectMode.height *.15
        font.bold: true
    }

    Rectangle{
        id:rectangleManualMode
        color: "orange"
        anchors{
            top: selectModeIcon.bottom
            topMargin: parent.height * .05
            left:parent.left
            right:parent.right
        }
        height: parent.height *.2

        Image{
            id: manualModeIcon
            anchors{
                top: parent.top
                topMargin: parent.height* 0.15
                left: parent.left
                leftMargin: parent.width * .1
            }

            height: rectangleManualMode.height *.7
            width: rectangleManualMode.width *.2
            fillMode: Image.PreserveAspectFit
            source: "qrc:/ui/assets/manualMode.png"
        }

        Label{
            text: "Manual Control: ON"
            anchors{
                bottom: manualModeIcon.bottom
                left: manualModeIcon.right
                leftMargin: parent.width * .01
            }
            font.pointSize: manualModeIcon.height *.3
            font.bold: false
        }

        MouseArea{
            anchors.fill: parent
            onClicked: {
                parent.color = 'orange'
                rectangleABMode.color = 'white'
                rectangleOnePoint.color = 'white'
                rectangleZigZagMode.color = 'white'
                mainwindow.selectAutoModeGcs = 0
            }
        }
    }
    Rectangle{
        id: rectangleOnePoint
        color: "yellow"
        anchors{
            top: rectangleManualMode.bottom
            topMargin: parent.height * .01
            left:parent.left
            right:parent.right
        }
        height: parent.height *.2

        Image{
            id: onePointIcon
            anchors{
                top: parent.top
                topMargin: parent.height * .15
                left: rectangleOnePoint.left
                leftMargin: parent.width * .1
            }

            height: parent.height *.7
            width: rectangleOnePoint.width *.2
            fillMode: Image.PreserveAspectFit
            source: "qrc:/ui/assets/onePointMode.png"
        }

        Label{
            text: "Mode 1: One Point"
            anchors{
                bottom: onePointIcon.bottom
                left: onePointIcon.right
                leftMargin: parent.width * .01
            }
            font.pointSize: onePointIcon.height *.3
            font.bold: false
        }

        MouseArea{
            anchors.fill: parent
            onClicked: {
                parent.color = 'yellow'
                rectangleABMode.color = 'white'
                rectangleZigZagMode.color = 'white'
                mainwindow.selectAutoModeGcs = 1
            }
        }
    }
    Rectangle{
    id: rectangleZigZagMode
    color: "white"
    anchors{
        top: rectangleOnePoint.bottom
        topMargin: parent.height * .01
        left:parent.left
        right:parent.right
    }
    height: parent.height *.2

        Image{
            id: zigzagModeIcon
            anchors{
                top: parent.top
                topMargin: parent.height * .15
                left: rectangleZigZagMode.left
                leftMargin: parent.width * .1
            }

            height: parent.height *.7
            width: rectangleZigZagMode.width *.2
            fillMode: Image.PreserveAspectFit
            source: "qrc:/ui/assets/zigzagMode.png"
        }

        Label{
            text: "Mode 2: ZigZag"
            anchors{
                bottom: zigzagModeIcon.bottom
                left: zigzagModeIcon.right
                leftMargin: parent.width * .01
            }
            font.pointSize: zigzagModeIcon.height *.3
            font.bold: false
        }

        MouseArea{
            anchors.fill: parent
            onClicked: {
                parent.color = 'yellow'
                rectangleABMode.color = 'white'
                rectangleOnePoint.color = 'white'
                mainwindow.selectAutoModeGcs = 2
                //console.log("mode" + mainwindow.selectAutoModeGcs)
            }
        }
    }
    Rectangle{
        id: rectangleABMode
        color: "white"
        anchors{
            top: rectangleZigZagMode.bottom
            topMargin: parent.height * .01
            left:parent.left
            right:parent.right
        }
        height: parent.height *.2

        Image{
            id: abLineModeIcon
            anchors{
                top: parent.top
                topMargin: parent.height * .15
                left: rectangleABMode.left
                leftMargin: parent.width * .1
            }

            height: parent.height *.7
            width: rectangleABMode.width *.2
            fillMode: Image.PreserveAspectFit
            source: "qrc:/ui/assets/abLineMode.png"
        }

        Label{
            text: "Mode 3: Line"
            anchors{
                bottom: abLineModeIcon.bottom
                left: abLineModeIcon.right
                leftMargin: parent.width * .01
            }
            font.pointSize: abLineModeIcon.height *.3
            font.bold: false
        }

        MouseArea{
            anchors.fill: parent
            onClicked: {
                parent.color = 'yellow'
                rectangleOnePoint.color = 'white'
                rectangleZigZagMode.color = 'white'
                mainwindow.selectAutoModeGcs = 3
            }
        }
    }


}
