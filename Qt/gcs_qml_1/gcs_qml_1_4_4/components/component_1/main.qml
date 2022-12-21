import QtQuick 2.12
import QtLocation 5.15
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
            id: usvStates
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
                spacing: 5
                bottomPadding: 15
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
                    RowLayout{
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
            Column{
                id: mode_1
                spacing: 5
                Text{
                    text: "------------------------------------- MODE 1: SINGLE TARGET -------------------------------------"
                }
                Row{
                    spacing: 10
                    ColumnLayout{
                        spacing: 30
                        Text{
                            text: "Target lat"
                        }
                        SpinBox {
                                id: targetLatMode1Box
                                editable: true
                                from: 0
                                value: 21000000
                                to: 200 * 1000000
                                stepSize: 1
                                anchors.centerIn: parent

                                property int decimals: 6
                                property double realValue: value / 1000000

                                validator: DoubleValidator {
                                    bottom: Math.min(targetLatMode1Box.from, targetLatMode1Box.to)
                                    top:  Math.max(targetLatMode1Box.from, targetLatMode1Box.to)
                                }

                                textFromValue: function(value, locale) {
                                    return Number(value / 1000000).toLocaleString(locale, 'f', targetLatMode1Box.decimals)
                                }

                                valueFromText: function(text, locale) {
                                    return Number.fromLocaleString(locale, text) * 1000000
                                }

                                onValueModified: {
                                    udp.targetLatMode1 = targetLatMode1Box.value / 1000000
                                }
                            }
                    }
                    ColumnLayout{
                        spacing: 30
                        Text{
                            text: "Target lng"
                        }
                        SpinBox {
                            id: targetLngMode1Box
                            editable: true
                            from: 0
                            value: 105000000
                            to: 200 * 1000000
                            stepSize: 1
                            anchors.centerIn: parent

                            property int decimals: 6
                            property real realValue: value / 1000000

                            validator: DoubleValidator {
                                bottom: Math.min(targetLngMode1Box.from, targetLngMode1Box.to)
                                top:  Math.max(targetLngMode1Box.from, targetLngMode1Box.to)
                            }

                            textFromValue: function(value, locale) {
                                return Number(value / 1000000).toLocaleString(locale, 'f', targetLngMode1Box.decimals)
                            }

                            valueFromText: function(text, locale) {
                                return Number.fromLocaleString(locale, text) * 1000000
                            }

                            onValueModified: {
                                udp.targetLngMode1 = targetLngMode1Box.value / 1000000
                            }
                        }
                    }
                    Button{
                        id: sendMode1Button
                        text: "Send"
                        onClicked:{
                            udp.sendMode1 = 1
                        }
                    }
                }
            }
            Column{
                id: mode_2
                Text{
                    text: "------------------------------------- MODE 2: ZIGZAG -------------------------------------"
                    bottomPadding: 10
                }
                Row{
                    id: target1Mode2
                    bottomPadding: 5
                    spacing: 10
                    ColumnLayout{
                        spacing: 20
                        Text{
                            text: "Target lat 1"
                        }
                        SpinBox {
                            id: targetLat1Mode2Box
                            editable: true
                            from: 0
                            value: 21000000
                            to: 300 * 1000000
                            stepSize: 1
                            anchors.centerIn: parent

                            property int decimals: 6
                            property real realValue: value / 1000000

                            validator: DoubleValidator {
                                bottom: Math.min(targetLat1Mode2Box.from, targetLat1Mode2Box.to)
                                top:  Math.max(targetLat1Mode2Box.from, targetLat1Mode2Box.to)
                            }

                            textFromValue: function(value, locale) {
                                return Number(value / 1000000).toLocaleString(locale, 'f', targetLat1Mode2Box.decimals)
                            }

                            valueFromText: function(text, locale) {
                                return Number.fromLocaleString(locale, text) * 1000000
                            }

                            onValueModified: {
                                udp.targetLat1Mode2 = targetLat1Mode2Box.value / 1000000
                            }
                        }
                    }
                    ColumnLayout{
                        spacing: 20
                        Text{
                            text: "Target lng 1"
                        }
                        SpinBox {
                            id: targetLng1Mode2Box
                            editable: true
                            from: 0
                            value: 105000000
                            to: 200 * 1000000
                            stepSize: 1
                            anchors.centerIn: parent

                            property int decimals: 6
                            property real realValue: value / 1000000

                            validator: DoubleValidator {
                                bottom: Math.min(targetLng1Mode2Box.from, targetLng1Mode2Box.to)
                                top:  Math.max(targetLng1Mode2Box.from, targetLng1Mode2Box.to)
                            }

                            textFromValue: function(value, locale) {
                                return Number(value / 1000000).toLocaleString(locale, 'f', targetLng1Mode2Box.decimals)
                            }

                            valueFromText: function(text, locale) {
                                return Number.fromLocaleString(locale, text) * 1000000
                            }

                            onValueModified: {
                                udp.targetLng1Mode2 = targetLng1Mode2Box.value / 1000000
                            }
                        }
                    }
                    Button{
                        id: sendMode2Button
                        text: "Send"
                        onClicked:{
                            udp.sendMode2 = 1
                        }
                    }
                }
                Row{
                    id: target2Mode2
                    spacing: 10
                    ColumnLayout{
                        spacing: 20
                        Text{
                            text: "Target lat 2"
                        }
                        SpinBox {
                            id: targetLat2Mode2Box
                            editable: true
                            from: 0
                            value: 21000000
                            to: 200 * 1000000
                            stepSize: 1
                            anchors.centerIn: parent

                            property int decimals: 6
                            property real realValue: value / 1000000

                            validator: DoubleValidator {
                                bottom: Math.min(targetLat2Mode2Box.from, targetLat2Mode2Box.to)
                                top:  Math.max(targetLat2Mode2Box.from, targetLat2Mode2Box.to)
                            }

                            textFromValue: function(value, locale) {
                                return Number(value / 1000000).toLocaleString(locale, 'f', targetLat2Mode2Box.decimals)
                            }

                            valueFromText: function(text, locale) {
                                return Number.fromLocaleString(locale, text) * 1000000
                            }

                            onValueModified: {
                                udp.targetLat2Mode2 = targetLat2Mode2Box.value / 1000000
                            }
                        }
                    }
                    ColumnLayout{
                        spacing: 20
                        Text{
                            text: "Target lng 2"
                        }
                        SpinBox {
                            id: targetLng2Mode2Box
                            editable: true
                            from: 0
                            value: 105000000
                            to: 200 * 1000000
                            stepSize: 1
                            anchors.centerIn: parent

                            property int decimals: 6
                            property real realValue: value / 1000000

                            validator: DoubleValidator {
                                bottom: Math.min(targetLng2Mode2Box.from, targetLng2Mode2Box.to)
                                top:  Math.max(targetLng2Mode2Box.from, targetLng2Mode2Box.to)
                            }

                            textFromValue: function(value, locale) {
                                return Number(value / 1000000).toLocaleString(locale, 'f', targetLng2Mode2Box.decimals)
                            }

                            valueFromText: function(text, locale) {
                                return Number.fromLocaleString(locale, text) * 1000000
                            }

                            onValueModified: {
                                udp.targetLng2Mode2 = targetLng2Mode2Box.value / 1000000
                            }
                        }
                    }
                }
                Row{
                    id: target3Mode2
                    spacing: 10
                    ColumnLayout{
                        spacing: 30
                        Text{
                            text: "Target lat 1"
                        }
                        SpinBox {
                            id: targetLat3Mode2Box
                            editable: true
                            from: 0
                            value: 21000000
                            to: 200 * 1000000
                            stepSize: 1
                            anchors.centerIn: parent

                            property int decimals: 6
                            property real realValue: value / 100

                            validator: DoubleValidator {
                                bottom: Math.min(targetLat3Mode2Box.from, targetLat3Mode2Box.to)
                                top:  Math.max(targetLat3Mode2Box.from, targetLat3Mode2Box.to)
                            }

                            textFromValue: function(value, locale) {
                                return Number(value / 1000000).toLocaleString(locale, 'f', targetLat3Mode2Box.decimals)
                            }

                            valueFromText: function(text, locale) {
                                return Number.fromLocaleString(locale, text) * 1000000
                            }

                            onValueModified: {
                                udp.targetLat3Mode2 = targetLat3Mode2Box.value / 1000000
                            }
                        }
                    }
                    ColumnLayout{
                        spacing: 30
                        Text{
                            text: "Target lng 1"
                        }
                        SpinBox {
                            id: targetLng3Mode2Box
                            editable: true
                            from: 0
                            value: 105000000
                            to: 200 * 1000000
                            stepSize: 1
                            anchors.centerIn: parent

                            property int decimals: 6
                            property real realValue: value / 1000000

                            validator: DoubleValidator {
                                bottom: Math.min(targetLng3Mode2Box.from, targetLng3Mode2Box.to)
                                top:  Math.max(targetLng3Mode2Box.from, targetLng3Mode2Box.to)
                            }

                            textFromValue: function(value, locale) {
                                return Number(value / 1000000).toLocaleString(locale, 'f', targetLng3Mode2Box.decimals)
                            }

                            valueFromText: function(text, locale) {
                                return Number.fromLocaleString(locale, text) * 1000000
                            }

                            onValueModified: {
                                udp.targetLng3Mode2 = targetLng3Mode2Box.value / 1000000
                            }
                        }
                    }
                }
                Row{
                    id: target4Mode2
                    spacing: 10
                    ColumnLayout{
                        spacing: 30
                        Text{
                            text: "Target lat 1"
                        }
                        SpinBox {
                            id: targetLat4Mode2Box
                            editable: true
                            from: 0
                            value: 21000000
                            to: 200 * 1000000
                            stepSize: 1
                            anchors.centerIn: parent

                            property int decimals: 6
                            property real realValue: value / 1000000

                            validator: DoubleValidator {
                                bottom: Math.min(targetLat4Mode2Box.from, targetLat4Mode2Box.to)
                                top:  Math.max(targetLat4Mode2Box.from, targetLat4Mode2Box.to)
                            }

                            textFromValue: function(value, locale) {
                                return Number(value / 1000000).toLocaleString(locale, 'f', targetLat4Mode2Box.decimals)
                            }

                            valueFromText: function(text, locale) {
                                return Number.fromLocaleString(locale, text) * 1000000
                            }

                            onValueModified: {
                                udp.targetLat4Mode2 = targetLat4Mode2Box.value / 1000000
                            }
                        }
                    }
                    ColumnLayout{
                        spacing: 30
                        Text{
                            text: "Target lng 1"
                        }
                        SpinBox {
                            id: targetLng4Mode2Box
                            editable: true
                            from: 0
                            value: 105000000
                            to: 300 * 1000000
                            stepSize: 1
                            anchors.centerIn: parent

                            property int decimals: 6
                            property real realValue: value / 1000000

                            validator: DoubleValidator {
                                bottom: Math.min(targetLng4Mode2Box.from, targetLng4Mode2Box.to)
                                top:  Math.max(targetLng4Mode2Box.from, targetLng4Mode2Box.to)
                            }

                            textFromValue: function(value, locale) {
                                return Number(value / 1000000).toLocaleString(locale, 'f', targetLng4Mode2Box.decimals)
                            }

                            valueFromText: function(text, locale) {
                                return Number.fromLocaleString(locale, text) * 1000000
                            }

                            onValueModified: {
                                udp.targetLng4Mode2 = targetLng4Mode2Box.value / 1000000
                            }
                        }
                    }
                }
            }
            Column{
                id: mode_3
                Text{
                    text: "------------------------------------- MODE 3: AB line -------------------------------------"
                    bottomPadding: 10
                }
                Row{
                    id: target1Mode3
                    bottomPadding: 5
                    spacing: 10
                    ColumnLayout{
                        spacing: 20
                        Text{
                            text: "Target lat 1"
                        }
                        SpinBox {
                            id: targetLat1Mode3Box
                            editable: true
                            from: 0
                            value: 21000000
                            to: 300 * 1000000
                            stepSize: 1
                            anchors.centerIn: parent

                            property int decimals: 6
                            property real realValue: value / 1000000

                            validator: DoubleValidator {
                                bottom: Math.min(targetLat1Mode3Box.from, targetLat1Mode3Box.to)
                                top:  Math.max(targetLat1Mode3Box.from, targetLat1Mode3Box.to)
                            }

                            textFromValue: function(value, locale) {
                                return Number(value / 1000000).toLocaleString(locale, 'f', targetLat1Mode3Box.decimals)
                            }

                            valueFromText: function(text, locale) {
                                return Number.fromLocaleString(locale, text) * 1000000
                            }

                            onValueModified: {
                                udp.targetLat1Mode3 = targetLat1Mode3Box.value / 1000000
                            }
                        }
                    }
                    ColumnLayout{
                        spacing: 20
                        Text{
                            text: "Target lng 1"
                        }
                        SpinBox {
                            id: targetLng1Mode3Box
                            editable: true
                            from: 0
                            value: 105000000
                            to: 200 * 1000000
                            stepSize: 1
                            anchors.centerIn: parent

                            property int decimals: 6
                            property real realValue: value / 1000000

                            validator: DoubleValidator {
                                bottom: Math.min(targetLng1Mode3Box.from, targetLng1Mode3Box.to)
                                top:  Math.max(targetLng1Mode3Box.from, targetLng1Mode3Box.to)
                            }

                            textFromValue: function(value, locale) {
                                return Number(value / 1000000).toLocaleString(locale, 'f', targetLng1Mode3Box.decimals)
                            }

                            valueFromText: function(text, locale) {
                                return Number.fromLocaleString(locale, text) * 1000000
                            }

                            onValueModified: {
                                udp.targetLng1Mode3 = targetLng1Mode3Box.value / 1000000
                            }
                        }
                    }
                    Button{
                        id: sendMode3Button
                        text: "Send"
                        onClicked:{
                            udp.sendMode3 = 1
                        }
                    }
                }
                Row{
                    id: target2Mode3
                    spacing: 10
                    ColumnLayout{
                        spacing: 20
                        Text{
                            text: "Target lat 2"
                        }
                        SpinBox {
                            id: targetLat2Mode3Box
                            editable: true
                            from: 0
                            value: 21000000
                            to: 200 * 1000000
                            stepSize: 1
                            anchors.centerIn: parent

                            property int decimals: 6
                            property real realValue: value / 1000000

                            validator: DoubleValidator {
                                bottom: Math.min(targetLat2Mode3Box.from, targetLat2Mode3Box.to)
                                top:  Math.max(targetLat2Mode3Box.from, targetLat2Mode3Box.to)
                            }

                            textFromValue: function(value, locale) {
                                return Number(value / 1000000).toLocaleString(locale, 'f', targetLat2Mode3Box.decimals)
                            }

                            valueFromText: function(text, locale) {
                                return Number.fromLocaleString(locale, text) * 1000000
                            }

                            onValueModified: {
                                udp.targetLat2Mode3 = targetLat2Mode3Box.value / 1000000
                            }
                        }
                    }
                    ColumnLayout{
                        spacing: 20
                        Text{
                            text: "Target lng 2"
                        }
                        SpinBox {
                            id: targetLng2Mode3Box
                            editable: true
                            from: 0
                            value: 105000000
                            to: 200 * 1000000
                            stepSize: 1
                            anchors.centerIn: parent

                            property int decimals: 6
                            property real realValue: value / 1000000

                            validator: DoubleValidator {
                                bottom: Math.min(targetLng2Mode3Box.from, targetLng2Mode3Box.to)
                                top:  Math.max(targetLng2Mode3Box.from, targetLng2Mode3Box.to)
                            }

                            textFromValue: function(value, locale) {
                                return Number(value / 1000000).toLocaleString(locale, 'f', targetLng2Mode3Box.decimals)
                            }

                            valueFromText: function(text, locale) {
                                return Number.fromLocaleString(locale, text) * 1000000
                            }

                            onValueModified: {
                                udp.targetLng2Mode2 = targetLng2Mode3Box.value / 1000000
                            }
                        }
                    }
                }
            }
        }
    }






}
