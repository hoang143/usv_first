import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.15
import udp.to.qml 1.0
import QtPositioning 5.15
import QtLocation 5.15

Rectangle{
    id: rectangleControlManualButton
    color: "white"
    focus: true
    Keys.enabled: true
    anchors{
        left: parent.left
        right: parent.right
        bottom: parent.bottom
    }
    height: parent.height * .4
    Rectangle{
        id: controlManualLabel
        color: "yellow"
        anchors{
            top: parent.top
            topMargin: parent.height * .15
        }
        width: parent.width
        height: parent.height * .12
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
        color: "white"
        anchors{
            top: controlManualLabel.bottom
            topMargin: parent.height * .015
            left:parent.left
            leftMargin: parent.width *.07
        }
        width: parent.width * .33
        height: parent.height * .33

        Image{
            id: leftImage
            anchors{
                verticalCenter: parent.verticalCenter
                right: parent.right
            }
            height: parent.height * .27
            fillMode: Image.PreserveAspectFit
            source: "qrc:/ui/assets/arrowLeft.png"
        }

        MouseArea{
            anchors.fill: parent
            onClicked: {
                desireYawManual = 100

                udp.thrustSend = thrustManual
                udp.momentSend = desireYawManual
                udp.sendManual = 1
            }
            onPressed:{
                leftImage.source = "qrc:/ui/assets/arrowLeft0.png"
            }
            onReleased:{
                leftImage.source = "qrc:/ui/assets/arrowLeft.png"
            }
        }

    }
    Rectangle{
        id: thrustManualButtons
        anchors{
            top: controlManualLabel.bottom
            topMargin: parent.height * .015
            left:leftManualButton.right
        }
        width: parent.width *.18
        height: parent.height * .33

        Rectangle{
            id: forwardManualButton
            color: "white"
            width: parent.width
            height: parent.height * .333
            anchors{
                top: parent.top
            }
            Image{
                id: forwardImage
                anchors{
                    verticalCenter: parent.verticalCenter
                    horizontalCenter: parent.horizontalCenter
                }
                height: parent.height * 0.8
                fillMode: Image.PreserveAspectFit
                source: "qrc:/ui/assets/arrowUp.png"
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    thrustManual = 10

                    udp.thrustSend = thrustManual
                    udp.momentSend = desireYawManual
                    udp.sendManual = 1
                }
                onPressed:{
                    forwardImage.source = "qrc:/ui/assets/arrowUp0.png"
                }
                onReleased:{
                    forwardImage.source = "qrc:/ui/assets/arrowUp.png"
                }
            }

        }
        Rectangle{
            id: haltManualButton
            color: "white"
            width: parent.width
            height: parent.height * .334
            anchors{
                top: forwardManualButton.bottom
            }
            Image{
                id: haltImage
                anchors{
                    verticalCenter: parent.verticalCenter
                    horizontalCenter: parent.horizontalCenter
                }
                height: parent.height * 0.6
                fillMode: Image.PreserveAspectFit
                source: "qrc:/ui/assets/halt.png"
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    thrustManual = 1

                    udp.thrustSend = thrustManual
                    udp.momentSend = desireYawManual
                    udp.sendManual = 1
                }
                onPressed:{
                    haltImage.source = "qrc:/ui/assets/halt0.png"
                }
                onReleased:{
                    haltImage.source = "qrc:/ui/assets/halt.png"
                }
            }
        }
        Rectangle{
            id: stopManualButton
            color: "white"
            width: parent.width
            height: parent.height * .333
            anchors{
                top: haltManualButton.bottom
            }
            Image{
                id: stopImage
                anchors{
                    verticalCenter: parent.verticalCenter
                    horizontalCenter: parent.horizontalCenter
                }
                height: parent.height * 0.5
                fillMode: Image.PreserveAspectFit
                source: "qrc:/ui/assets/stop.png"
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    desireYawManual = 0

                    udp.thrustSend = thrustManual
                    udp.momentSend = desireYawManual
                    udp.sendManual = 1
                }
                onPressed:{
                    stopImage.source = "qrc:/ui/assets/stop0.png"
                }
                onReleased:{
                    stopImage.source = "qrc:/ui/assets/stop.png"
                }
            }
        }
    }
    Rectangle{
        id:rightManualButton
        color: "white"
        anchors{
            top: controlManualLabel.bottom
            topMargin: parent.height * .015
            left: thrustManualButtons.right
        }
        width: parent.width *.33
        height: parent.height * .33

        Image{
            id: rightImage
            anchors{
                verticalCenter: parent.verticalCenter
                left: parent.left
            }
            height: parent.height * .27
            fillMode: Image.PreserveAspectFit
            source: "qrc:/ui/assets/arrowRight.png"
        }

        MouseArea{
            anchors.fill: parent
            onClicked: {
                desireYawManual = 1

                udp.thrustSend = thrustManual
                udp.momentSend = desireYawManual
                udp.sendManual = 1
            }
            onPressed:{
                rightImage.source = "qrc:/ui/assets/arrowRight0.png"
            }
            onReleased:{
                rightImage.source = "qrc:/ui/assets/arrowRight.png"
            }
        }

    }
    Rectangle{
        id: homeLocationLabel
        color: "orange"
        anchors{
            top: leftManualButton.bottom
            topMargin: parent.height * .05
        }
        width: parent.width
        height: parent.height * .1
        Label{
            text: "Home Location"
            anchors{
                centerIn: parent
            }
            font.pointSize: rectangleControlManualButton.height *.04
            font.bold: true
        }
    }
    Rectangle{
        id: getHomeLocationButton
        color: "orange"
        anchors{
            top: homeLocationLabel.bottom
            topMargin: parent.height * .01
            left: parent.left
        }
        width: parent.width * .49
        height: parent.height * .1
        Label{
            text: "Get Home"
            anchors{
                centerIn: parent
            }
            font.pointSize: rectangleControlManualButton.height *.03
            font.bold: false
        }
        MouseArea{
            anchors.fill: parent
            onClicked:{
                udp.getHome = 1
                markerHome.clear()
                markerHome.append({"coords":QtPositioning.coordinate(udp.homeLat,udp.homeLng)})
                console.log("marker" + markerHome.count)
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
        id: sendHomeLocationButton
        color: "orange"
        anchors{
            top: homeLocationLabel.bottom
            topMargin: parent.height * .01
            right: parent.right
        }
        width: parent.width * .49
        height: parent.height * .1
        Label{
            text: "To Home"
            anchors{
                centerIn: parent
            }
            font.pointSize: rectangleControlManualButton.height *.03
            font.bold: false
        }
        MouseArea{
            anchors.fill: parent
            onClicked:{
                udp.sendHome = 1
            }
            onPressed:{
                parent.color = "yellow"
            }
            onReleased:{
                parent.color = "orange"
            }
        }
    }

    // Keyboard control events
    Keys.onLeftPressed:{
        desireYawManual = 100

        udp.thrustSend = thrustManual
        udp.momentSend = desireYawManual
        udp.sendManual = 1

        leftImage.source = "qrc:/ui/assets/arrowLeft0.png"
    }
    Keys.onUpPressed:{
        thrustManual = 10

        udp.thrustSend = thrustManual
        udp.momentSend = desireYawManual
        udp.sendManual = 1

        forwardImage.source = "qrc:/ui/assets/arrowUp0.png"
    }
    Keys.onDownPressed:{
        thrustManual = 1
        udp.thrustSend = thrustManual
        udp.momentSend = desireYawManual
        udp.sendManual = 1

        haltImage.source = "qrc:/ui/assets/halt0.png"
    }
    Keys.onDigit0Pressed:{
        desireYawManual = 0

        udp.thrustSend = thrustManual
        udp.momentSend = desireYawManual
        udp.sendManual = 1

        stopImage.source = "qrc:/ui/assets/stop0.png"
    }
    Keys.onRightPressed: {
        desireYawManual = 1

        udp.thrustSend = thrustManual
        udp.momentSend = desireYawManual
        udp.sendManual = 1

        rightImage.source = "qrc:/ui/assets/arrowRight0.png"
    }
    Keys.onReleased:{
        leftImage.source = "qrc:/ui/assets/arrowLeft.png"
        forwardImage.source = "qrc:/ui/assets/arrowUp.png"
        stopImage.source = "qrc:/ui/assets/stop.png"
        haltImage.source = "qrc:/ui/assets/halt.png"
        rightImage.source = "qrc:/ui/assets/arrowRight.png"
    }
}
