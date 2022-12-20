import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import udp.to.qml 1.0
import QtQuick.Layouts 1.15

Window {
    id: root
    minimumWidth: 1000
    minimumHeight: 400
    maximumWidth: 1800
    maximumHeight: 1400
    visible: true
    title: qsTr("Ground Control Station")

    // Create an udp socket
    UdpToQml{
        id: udp
    }

    // Properties


    // Content
    Row{
        spacing: 30
        Column{
            topPadding: 20
            leftPadding: 20
            spacing: 7
            Row{
                spacing: 20
                ColumnLayout{
                    Text{
                        text: "0. Auto"
                    }
                    Text{
                        text: udp.autoMode
                        color: "blue"
                        Layout.alignment: Qt.AlignHCenter
                    }
                }
                ColumnLayout{
                    Text{
                        text: "1. Mode"
                    }
                    Text{
                        text: udp.selectAutoMode
                        color: "blue"
                        Layout.alignment: Qt.AlignHCenter
                    }
                }
                ColumnLayout{
                    Text{
                        text: "2. Thrust"
                    }
                    Text{
                        text: udp.thrust
                        color: "blue"
                        Layout.alignment: Qt.AlignHCenter
                    }
                }
                ColumnLayout{
                    Text{
                        text: "3. Moment"
                    }
                    Text{
                        text: udp.moment
                        color: "blue"
                        Layout.alignment: Qt.AlignHCenter
                    }
                }
                ColumnLayout{
                    Text{
                        text: "4. Motor 1"
                    }
                    Text{
                        text: udp.speed1
                        color: "blue"
                        Layout.alignment: Qt.AlignHCenter
                    }
                }
                ColumnLayout{
                    Text{
                        text: "5. Motor 2"
                    }
                    Text{
                        text: udp.speed2
                        color: "blue"
                        Layout.alignment: Qt.AlignHCenter
                    }
                }
            }
            Row{
                spacing: 20
                ColumnLayout{
                    Text{
                        text: "6. Yaw"
                    }
                    Text{
                        text: udp.usvYaw
                        color: "blue"
                        Layout.alignment: Qt.AlignHCenter
                    }
                }
                ColumnLayout{
                    Text{
                        text: "7. Desire yaw"
                    }
                    Text{
                        text: udp.desireYaw
                        color: "blue"
                        Layout.alignment: Qt.AlignHCenter
                    }
                }
                ColumnLayout{
                    Text{
                        text: "8. Yaw error"
                    }
                    Text{
                        text: udp.yawError
                        color: "blue"
                        Layout.alignment: Qt.AlignHCenter
                    }
                }
                ColumnLayout{
                    Text{
                        text: "9. Distance"
                    }
                    Text{
                        text: udp.distance
                        color: "blue"
                        Layout.alignment: Qt.AlignHCenter
                    }
                }
            }
            Row{
                spacing: 20
                ColumnLayout{
                    Text{
                        text: "10. Arrival"
                    }
                    Text{
                        text: udp.arrival
                        color: "blue"
                        Layout.alignment: Qt.AlignHCenter
                    }
                }
                ColumnLayout{
                    Text{
                        text: "11. Step no"
                    }
                    Text{
                        text: udp.stepNo
                        color: "blue"
                        Layout.alignment: Qt.AlignHCenter
                    }
                }
                ColumnLayout{
                    Text{
                        text: "12. Current target"
                    }
                    Text{
                        text: udp.currentTarget
                        color: "blue"
                        Layout.alignment: Qt.AlignHCenter
                    }
                }
                ColumnLayout{
                    Text{
                        text: "13. End Zigzag"
                    }
                    Text{
                        text: udp.endZigzag
                        color: "blue"
                        Layout.alignment: Qt.AlignHCenter
                    }
                }
                ColumnLayout{
                    Text{
                        text: "14. Reach A"
                    }
                    Text{
                        text: udp.reachA
                        color: "blue"
                        Layout.alignment: Qt.AlignHCenter
                    }
                }
            }
            Row{
                spacing: 20
                ColumnLayout{
                    Text{
                        text: "15. USV lat"
                    }
                    Text{
                        text: Number(udp.usvLat).toFixed(9)
                        color: "blue"
                        Layout.alignment: Qt.AlignHCenter
                    }
                }
                ColumnLayout{
                    Text{
                        text: "16. USV lng"
                    }
                    Text{
                        text: Number(udp.usvLng).toFixed(9)
                        color: "blue"
                        Layout.alignment: Qt.AlignHCenter
                    }
                }
                ColumnLayout{
                    Text{
                        text: "17. Valid"
                    }
                    Text{
                        text: udp.valid
                        color: "blue"
                        Layout.alignment: Qt.AlignHCenter
                    }
                }
                ColumnLayout{
                    Text{
                        text: "18. Target lat"
                    }
                    Text{
                        text: Number(udp.targetLat).toFixed(9)
                        color: "blue"
                        Layout.alignment: Qt.AlignHCenter
                    }
                }
                ColumnLayout{
                    Text{
                        text: "19. Target lng"
                    }
                    Text{
                        text: Number(udp.targetLng).toFixed(9)
                        color: "blue"
                        Layout.alignment: Qt.AlignHCenter
                    }
                }
            }
            Row{
                spacing: 20
                ColumnLayout{
                    Text{
                        text: "20. k_yaw_error"
                    }
                    Text{
                        text: Number(udp.kYawError).toFixed(2)
                        color: "blue"
                        Layout.alignment: Qt.AlignHCenter
                    }
                }
                ColumnLayout{
                    Text{
                        text: "21. k_distance"
                    }
                    Text{
                        text: Number(udp.kDistance).toFixed(2)
                        color: "blue"
                        Layout.alignment: Qt.AlignHCenter
                    }
                }
                ColumnLayout{
                    Text{
                        text: "22. a"
                    }
                    Text{
                        text: udp.a
                        color: "blue"
                        Layout.alignment: Qt.AlignHCenter
                    }
                }
                ColumnLayout{
                    Text{
                        text: "23. b"
                    }
                    Text{
                        text: udp.b
                        color: "blue"
                        Layout.alignment: Qt.AlignHCenter
                    }
                }
                ColumnLayout{
                    Text{
                        text: "24. k_moment"
                    }
                    Text{
                        text: udp.kMoment
                        color: "blue"
                        Layout.alignment: Qt.AlignHCenter
                    }
                }
            }
            Row{
                spacing: 20
                ColumnLayout{
                    Text{
                        text: "25. Cruise"
                    }
                    Text{
                        text: udp.cruise
                        color: "blue"
                        Layout.alignment: Qt.AlignHCenter
                    }
                }
                ColumnLayout{
                    Text{
                        text: "26. Radius"
                    }
                    Text{
                        text: udp.arrivalRadius
                        color: "blue"
                        Layout.alignment: Qt.AlignHCenter
                    }
                }
                ColumnLayout{
                    Text{
                        text: "27. Zigzag step"
                    }
                    Text{
                        text: udp.zigzagStep
                        color: "blue"
                        Layout.alignment: Qt.AlignHCenter
                    }
                }
                ColumnLayout{
                    Text{
                        text: "28. Look ahead"
                    }
                    Text{
                        text: udp.lookAhead
                        color: "blue"
                        Layout.alignment: Qt.AlignHCenter
                    }
                }
            }
        }
        Column{
            id: controlBoard
            Column{
                id: mode_0
                spacing: 15
                Text{
                    text: "------------------------------------- MODE 0: MANUAL -------------------------------------"
                }
                Row{
                    spacing: 10
                    ColumnLayout{
                        Text{
                            text: "Home lat"
                        }
                        Text{
                            text: Number(udp.homeLat).toFixed(9)
                            color: "blue"
                            Layout.alignment: Qt.AlignHCenter
                        }
                    }
                    ColumnLayout{
                        Text{
                            text: "Home lng"
                        }
                        Text{
                            text: Number(udp.homeLng).toFixed(9)
                            color: "blue"
                            Layout.alignment: Qt.AlignHCenter
                        }
                    }
                    ColumnLayout{
                        Button{
                            id: getHomeButton
                            text: "Get Home"
                            onClicked:{
                                udp.getHome = 1
                            }
                        }
                        Button{
                            id: sendHomeButton
                            text: "Send"
                            onClicked:{
                                udp.sendHome = 1
                            }
                        }
                    }
                }
            }
        }
    }






}
