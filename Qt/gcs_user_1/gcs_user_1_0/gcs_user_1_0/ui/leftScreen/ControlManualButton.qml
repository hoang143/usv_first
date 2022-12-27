import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.15
import udp.to.qml 1.0

Rectangle{
    id: rectangleControlManualButton
    color: "white"
    focus: true
    anchors{
        left: parent.left
        right: parent.right
        bottom: parent.bottom
    }
    height: parent.height * .4

    Rectangle{
        id: controlManualLabel
        color: "orange"
        anchors{
            top: parent.top
            topMargin: parent.height * .2
        }
        width: parent.width
        height: parent.height * .1
        Label{
            text: "Manual control"
            anchors{
                centerIn: parent
            }
            font.pointSize: rectangleControlManualButton.height *.04
            font.bold: true
        }
    }

    Rectangle{
        id:leftManualButton
        color: "orange"
        anchors{
            top: controlManualLabel.bottom
            topMargin: parent.height * .03
            left:parent.left
            leftMargin: parent.width *.01
        }
        width: parent.width *.33
        height: parent.height * .33

        Label{
            text: "Left"
            anchors{
                centerIn: parent
            }
            font.pointSize: rectangleControlManualButton.height *.03
            font.bold: false
        }

        MouseArea{
            anchors.fill: parent
            onClicked: {
                desireYawManual = 100
                //desireYawManualDisplay = desireYawManual
                //thrustManualDisplay = thrustManual

                udp.thrustSend = thrustManual
                udp.momentSend = desireYawManual
                udp.sendManual = 1
            }
            onPressed:{
                parent.color = "yellow"
            }
            onReleased:{
                parent.color = "orange"
            }
        }

    }
    Rectangle{
        id: thrustManualButtons
        anchors{
            top: controlManualLabel.bottom
            topMargin: parent.height * .03
            left:leftManualButton.right
        }
        width: parent.width *.33
        height: parent.height * .33

        Rectangle{
            id: forwardManualButton
            color: "orange"
            width: parent.width
            height: parent.height * .333
            anchors{
                top: parent.top
            }
            Label{
                text: "Forward"
                anchors{
                    centerIn: parent
                }
                font.pointSize: rectangleControlManualButton.height *.03
                font.bold: false
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    thrustManual = 10
                    //desireYawManualDisplay = desireYawManual
                    //thrustManualDisplay = thrustManual

                    udp.thrustSend = thrustManual
                    udp.momentSend = desireYawManual
                    udp.sendManual = 1
                }
                onPressed:{
                    parent.color = "yellow"
                }
                onReleased:{
                    parent.color = "orange"
                }
            }

        }
        Rectangle{
            id: haltManualButton
            color: "orange"
            width: parent.width
            height: parent.height * .334
            anchors{
                top: forwardManualButton.bottom
            }
            Label{
                text: "Halt"
                anchors{
                    centerIn: parent
                }
                font.pointSize: rectangleControlManualButton.height *.03
                font.bold: false
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    thrustManual = 1
                    //desireYawManualDisplay = desireYawManual
                    //thrustManualDisplay = thrustManual

                    udp.thrustSend = thrustManual
                    udp.momentSend = desireYawManual
                    udp.sendManual = 1
                }
                onPressed:{
                    parent.color = "yellow"
                }
                onReleased:{
                    parent.color = "orange"
                }
            }
        }
        Rectangle{
            id: stopManualButton
            color: "orange"
            width: parent.width
            height: parent.height * .333
            anchors{
                top: haltManualButton.bottom
            }
            Label{
                text: "STOP"
                anchors{
                    centerIn: parent
                }
                font.pointSize: rectangleControlManualButton.height *.03
                font.bold: false
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    desireYawManual = 0
                    //desireYawManualDisplay = desireYawManual
                    //thrustManualDisplay = thrustManual

                    udp.thrustSend = thrustManual
                    udp.momentSend = desireYawManual
                    udp.sendManual = 1
                }
                onPressed:{
                    parent.color = "yellow"
                }
                onReleased:{
                    parent.color = "orange"
                }
            }
        }
    }
    Rectangle{
        id:rightManualButton
        color: "orange"
        anchors{
            top: controlManualLabel.bottom
            topMargin: parent.height * .03
            left: thrustManualButtons.right
        }
        width: parent.width *.33
        height: parent.height * .33

        Label{
            text: "Right"
            anchors{
                centerIn: parent
            }
            font.pointSize: rectangleControlManualButton.height *.03
            font.bold: false
        }

        MouseArea{
            anchors.fill: parent
            onClicked: {
                desireYawManual = 1
                //desireYawManualDisplay = desireYawManual
                //thrustManualDisplay = thrustManual

                udp.thrustSend = thrustManual
                udp.momentSend = desireYawManual
                udp.sendManual = 1
            }
            onPressed:{
                parent.color = "yellow"
            }
            onReleased:{
                parent.color = "orange"
            }
        }

    }

    Keys.enabled: true

    // Keyboard control events
    Keys.onLeftPressed:{
        desireYawManual = 100
        //desireYawManualDisplay = desireYawManual
        //thrustManualDisplay = thrustManual

        udp.thrustSend = thrustManual
        udp.momentSend = desireYawManual
        udp.sendManual = 1

        leftManualButton.color = "yellow"
    }
    Keys.onUpPressed:{
        thrustManual = 10
        //desireYawManualDisplay = desireYawManual
        //thrustManualDisplay = thrustManual

        udp.thrustSend = thrustManual
        udp.momentSend = desireYawManual
        udp.sendManual = 1

        forwardManualButton.color = "yellow"
    }
    Keys.onDownPressed:{
        thrustManual = 1
        //desireYawManualDisplay = desireYawManual
        //thrustManualDisplay = thrustManual

        udp.thrustSend = thrustManual
        udp.momentSend = desireYawManual
        udp.sendManual = 1

        haltManualButton.color = "yellow"
    }
    Keys.onDigit0Pressed:{
        desireYawManual = 0

        //desireYawManualDisplay = desireYawManual
        //thrustManualDisplay = thrustManual

        udp.thrustSend = thrustManual
        udp.momentSend = desireYawManual
        udp.sendManual = 1

        stopManualButton.color = "yellow"
    }
    Keys.onRightPressed: {
        desireYawManual = 1
        //desireYawManualDisplay = desireYawManual
        //thrustManualDisplay = thrustManual

        udp.thrustSend = thrustManual
        udp.momentSend = desireYawManual
        udp.sendManual = 1

        rightManualButton.color = "yellow"
    }
    Keys.onReleased:{
        leftManualButton.color = "orange"
        forwardManualButton.color = "orange"
        haltManualButton.color = "orange"
        stopManualButton.color = "orange"
        rightManualButton.color = "orange"
    }
}
