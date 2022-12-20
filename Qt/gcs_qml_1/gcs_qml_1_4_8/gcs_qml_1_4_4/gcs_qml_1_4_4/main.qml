import QtQuick 2.12
import QtLocation 5.15
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import udp.to.qml 1.0
import QtQuick.Layouts 1.15
import QtPositioning 5.6
import QtQml 2.0
import QtQuick.Dialogs 1.1

Window {
    id: root
    minimumWidth: 1900
    minimumHeight: 800
    visible: true
    title: qsTr("Ground Control Station")

    // Create an udp socket
    UdpToQml{
        id: udp
    }

    // Properties
    property alias thrustManualDisplay: thrustManualLcd.text
    property alias desireYawManualDisplay: desireYawManualLcd.text
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
    // Functions
    function wrapAnlge (angle)
    {
        while (angle>180)
            angle = angle - 360;
        while (angle<-180)
            angle = angle + 360;
        return angle;
    }
    function addMarker(latitude, longitude)
    {
        var Component = Qt.createComponent("qrc:/Marker.qml")
        var Item = Component.createObject(mapview, { coordinate:
        QtPositioning.coordinate(latitude, longitude) })
        mapview.addMapItem(Item)
    }
    function addMarkerHome(latitude, longitude)
    {
        var Component = Qt.createComponent("qrc:/MarkerHome.qml")
        var Item = Component.createObject(mapview, { coordinate:
        QtPositioning.coordinate(latitude, longitude) })
        mapview.addMapItem(Item)
    }
    function addMarkerUSV(latitude, longitude)
    {
        var Component = Qt.createComponent("qrc:/MarkerUSV.qml")
        var Item = Component.createObject(mapview, { coordinate:
        QtPositioning.coordinate(latitude, longitude) })
        mapview.addMapItem(Item)
    }
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

    // --------------------------------------------------------- ******* ---------------------------------------------------------
    // --------------------------------------------------------- CONTENT ---------------------------------------------------------
    // --------------------------------------------------------- ******* ---------------------------------------------------------

    Row{
        spacing: 20

        //------------------------------------------------------Map---------------------------------------------------------------------
        Column{
            Row{
                MessageDialog {
                    id: messagebox
                    title:{
                        if(selectAutoModeGcs == 1) {qsTr("Mode " + selectAutoModeGcs + ": Single Target")}
                        else if(selectAutoModeGcs == 2) {qsTr("Mode " + selectAutoModeGcs + ": ZigZag ")}
                        else if(selectAutoModeGcs == 3)  {qsTr("Mode " + selectAutoModeGcs + ": Two Line(AB)")}
                    }

                    icon: StandardIcon.Question
                    text: "Confirm Position?"
                    //informativeText: "Do you want to save your changes?"
                    visible: false
                    standardButtons: MessageDialog.Yes | MessageDialog.No
                    onYes: {
                        if(selectAutoModeGcs == 2){
                            targetLat1Mode2Box.value = lstLat[1] * 1000000
                            targetLng1Mode2Box.value = lstLng[1] * 1000000
                            targetLat2Mode2Box.value = lstLat[2] * 1000000
                            targetLng2Mode2Box.value = lstLng[2] * 1000000
                            targetLat3Mode2Box.value = lstLat[3] * 1000000
                            targetLng3Mode2Box.value = lstLng[3] * 1000000
                            targetLat4Mode2Box.value = lstLat[4] * 1000000
                            targetLng4Mode2Box.value = lstLng[4] * 1000000

                            udp.targetLat1Mode2 = lstLat[1]
                            udp.targetLng1Mode2 = lstLng[1]
                            udp.targetLat2Mode2 = lstLat[2]
                            udp.targetLng2Mode2 = lstLng[2]
                            udp.targetLat3Mode2 = lstLat[3]
                            udp.targetLng3Mode2 = lstLng[3]
                            udp.targetLat4Mode2 = lstLat[4]
                            udp.targetLng4Mode2 = lstLng[4]

                            udp.sendMode2 = 1
                        }

                        if(selectAutoModeGcs == 1){
                            targetLatMode1Box.value = lstLat[1] * 1000000
                            targetLngMode1Box.value = lstLng[1] * 1000000

                            udp.targetLatMode1 = lstLat[1]
                            udp.targetLngMode1 = lstLng[1]

                            udp.sendMode1 = 1
                        }

                        if(selectAutoModeGcs == 3){
                            targetLat1Mode3Box.value = lstLat[1] * 1000000
                            targetLng1Mode3Box.value = lstLng[1] * 1000000
                            targetLat2Mode3Box.value = lstLat[2] * 1000000
                            targetLng2Mode3Box.value = lstLng[2] * 1000000

                            udp.targetLat1Mode3 = lstLat[1]
                            udp.targetLng1Mode3 = lstLng[1]
                            udp.targetLat2Mode3 = lstLat[2]
                            udp.targetLng2Mode3 = lstLng[2]

                            udp.sendMode3 = 1
                        }
                    }
                }
                Column{
                    Row{
                        CheckBox {
                                id: checkBox
                                checked: true
                                text: qsTr("Stream Data")
                                action: {
                                    if(checked.valueOf() == true)
                                        addMarkerUSV(udp.usvLat,udp.usvLng)
                            }
                        }
                        Button{
                            id: deleteAll
                            text: qsTr("Delete All")
                            onClicked: {
                                lst.clear()
                                for(i = count ; i >=-1; i --){
                                    line.removeCoordinate(count-1)
                                    mark_.remove(count-1)
                                    count -=1
                                }
                                mapview.clearMapItems()
                                addMarkerHome(udp.homeLat, udp.homeLng)
                                count = 0
                            }
                        }
                        Button{
                            id: control
                            text: qsTr("Delete")
                            contentItem: Text {
                                text: control.text
                                font: control.font
                                opacity: enabled ? 1.0 : 0.3
                                color: control.down ? "#17a81a" : "#21be2b"
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                elide: Text.ElideRight
                            }

                            background: Rectangle {
                                    implicitWidth: 100
                                    implicitHeight: 40
                                    opacity: enabled ? 1 : 0.3
                                    border.color: control.down ? "#17a81a" : "#21be2b"
                                    border.width: 1
                                    radius: 2
                                }

                            property var latMouse1
                            property var lngMouse1
                            onClicked:{

                                console.log("button in!");
        //                          console.log("before" + lst.count)
                                //latMouse1 =
                                lst.clear()
                                //mapview.clearMapItems()
                                //mapview.removeMapItem()
                                line.removeCoordinate(cout_dele-1)
                                mark_.remove(cout_dele-1)
                                cout_dele -=1
                                if(cout_dele<0)cout_dele=0

                                count = 0
                            }
                        }
                    }
                    ComboBox{
                        id: selectAutoModeGcsBox
                        model: ["Mode 1", "Mode 2", "Mode 3"]
                        onActivated:{
                            if (selectAutoModeGcsBox.currentIndex == 0)
                                selectAutoModeGcs = 1
                            if (selectAutoModeGcsBox.currentIndex == 1)
                                selectAutoModeGcs = 2
                            if (selectAutoModeGcsBox.currentIndex == 2)
                                selectAutoModeGcs = 3
                        }
                    }
                }
            }
            ListModel{
                id:lst
            }
            ListModel{
               id:mark_
            }
            Rectangle {
                    id: recMap
                    width: 300
                    height: 700
                    color: "red"
                    border.color: "black"
                    border.width: 5
                    radius: 10

                    //------map--------

                    Plugin {
                          id: mapboxglPlugin
                          name: "osm"
                          PluginParameter{
                             name: "mapboxgl";
                             value: "mapbox://styles/mapbox/streets-v12"; // style mapbox
                         }
                          }
                      Map {
                         id: mapview
                         anchors.fill: parent
                         plugin: mapboxglPlugin
                         //activeMapType: map.supportedMapTypes[5]
                         center: QtPositioning.coordinate(udp.homeLat, udp.homeLng)
//                         center: QtPositioning.coordinate(21.00578916837529, 105.85859245539928)
                         zoomLevel: 30

                         Line{
                             id: line
                         }
                         MapItemView{
                            model:mark_
                            delegate: Marker{
                                 text: name
                                 coordinate:QtPositioning.coordinate(coords.latitude,coords.longitude)
                            }

                         }
                      MouseArea {
                                  id: mouseareamaker
                                  anchors.fill: parent
                                  property int lastX : -1
                                  property int lastY : -1
                                  property double latMouse
                                  property double lngMouse

                                  onClicked: {
                                      var coordinate = mapview.toCoordinate(Qt.point(mouse.x,mouse.y))
                //                          console.log(mapview.toCoordinate(Qt.point(mouse.x,mouse.y)).latitude);
                //                          console.log(mapview.toCoordinate(Qt.point(mouse.x,mouse.y)).longitude);
                                      latMouse = mapview.toCoordinate(Qt.point(mouse.x,mouse.y)).latitude
                                      lngMouse = mapview.toCoordinate(Qt.point(mouse.x,mouse.y)).longitude

                                      lst.append({"coords":coordinate})
                                      count = lst.count
                                      cout_dele = count;
                                      lstLat[count] = latMouse
                                      lstLng[count] = lngMouse
                                      line.addCoordinate(coordinate)
                                      distance = codToMeter(lstLat[count], lstLng[count], lstLat[count - 1], lstLng[count - 1],count)
                                      if (count == 1)
                                        distance = codToMeter(lstLat[count], lstLng[count], udp.usvLat, udp.usvLng,count)
                                      distance = Math.round(distance)

                                      mark_.append({"coords":coordinate,"name":count + "(" + distance + "m)" })
                                      console.log(lstLat[count])
                                      console.log(lstLat[count-1])
                                      console.log()
                                      console.log(distance)


                                      if(selectAutoModeGcs == 1){
                                              messagebox.visible = true   
                                      }
                                      if(selectAutoModeGcs == 2){
                                          if(count >= 4) {
                                              count = 4
                                              messagebox.visible = true
                                              }
                                      }
                                      if (selectAutoModeGcs == 3){
                                          if(count >= 2) {
                                             count = 2
                                              messagebox.visible = true
                                          }
                                      }

                                      // writing cordinates to cpp files
                                      // map2cpp.writeCordinate2cpp(coord.latitude.toFixed(6),coord.longitude.toFixed(6))
                      }
                      }
            }
               //----------end rectangle----------------
            }
        }

        Column{
            topPadding: 20
            leftPadding: 30
            Text{
                text: "------------------------------------- MANUAL CONTROL -------------------------------------"
                bottomPadding: 10
            }
            Row{
                id: manualControlBoard
                spacing: 10
                Column{
                    Column{
                        Text{
                            text: "Thrust Manual"
                        }
                        Text{
                            id: thrustManualLcd
                            text: "0"
                            color: "blue"
                            Layout.alignment: Qt.AlignHCenter
                        }
                    }
                    Column{
                        Text{
                            text: "Yaw Manual"
                        }
                        Text{
                            id: desireYawManualLcd
                            text: "0"
                            color: "blue"
                            Layout.alignment: Qt.AlignHCenter
                        }
                    }
                }
                Column{
                    Button{}
                    Button{
                        text: "Left"
                        onClicked:{
                            //desireYawManual = desireYawManual - 20
                            //desireYawManual = wrapAnlge(desireYawManual)
                            desireYawManual = 100
                            desireYawManualDisplay = desireYawManual
                            thrustManualDisplay = thrustManual

                            udp.thrustSend = thrustManual
                            udp.momentSend = desireYawManual
                            udp.sendManual = 1
                        }
                    }
                    Button{}
                }
                Column{
                    Button{
                        text: "Forward"
                        onClicked: {
                            thrustManual = 10
                            desireYawManualDisplay = desireYawManual
                            thrustManualDisplay = thrustManual

                            udp.thrustSend = thrustManual
                            udp.momentSend = desireYawManual
                            udp.sendManual = 1
                        }
                    }
                    Button{
                        text: "Halt"
                        onClicked: {
                            thrustManual = 1
                            desireYawManualDisplay = desireYawManual
                            thrustManualDisplay = thrustManual

                            udp.thrustSend = thrustManual
                            udp.momentSend = desireYawManual
                            udp.sendManual = 1
                        }
                    }
                    Button{
                        text: "STOP"
                        onClicked: {
                            desireYawManual = 0
                            desireYawManualDisplay = desireYawManual
                            thrustManualDisplay = thrustManual

                            udp.thrustSend = thrustManual
                            udp.momentSend = desireYawManual
                            udp.sendManual = 1
                        }
                    }
                }
                Column{
                    Button{}
                    Button{
                        text: "Right"
                        onClicked: {
                            //desireYawManual = desireYawManual + 20
                            //desireYawManual = wrapAnlge(desireYawManual)
                            desireYawManual = 1
                            desireYawManualDisplay = desireYawManual
                            thrustManualDisplay = thrustManual

                            udp.thrustSend = thrustManual
                            udp.momentSend = desireYawManual
                            udp.sendManual = 1
                        }
                    }
                    Button{}
                }

                // Keyboard control events
                Keys.onLeftPressed:{
                    //desireYawManual = desireYawManual - 20
                    //desireYawManual = wrapAnlge(desireYawManual)
                    desireYawManual = 100
                    desireYawManualDisplay = desireYawManual
                    thrustManualDisplay = thrustManual

                    udp.thrustSend = thrustManual
                    udp.momentSend = desireYawManual
                    udp.sendManual = 1
                }
                Keys.onUpPressed:{
                    thrustManual = 10
                    desireYawManualDisplay = desireYawManual
                    thrustManualDisplay = thrustManual

                    udp.thrustSend = thrustManual
                    udp.momentSend = desireYawManual
                    udp.sendManual = 1
                }
                Keys.onDownPressed:{
                    thrustManual = 1
                    desireYawManualDisplay = desireYawManual
                    thrustManualDisplay = thrustManual

                    udp.thrustSend = thrustManual
                    udp.momentSend = desireYawManual
                    udp.sendManual = 1
                }
                Keys.onDigit0Pressed:{
                    desireYawManual = 0

                    desireYawManualDisplay = desireYawManual
                    thrustManualDisplay = thrustManual

                    udp.thrustSend = thrustManual
                    udp.momentSend = desireYawManual
                    udp.sendManual = 1
                }
                Keys.onRightPressed: {
                    //desireYawManual = desireYawManual + 20
                    //desireYawManual = wrapAnlge(desireYawManual)
                    desireYawManual = 1
                    desireYawManualDisplay = desireYawManual
                    thrustManualDisplay = thrustManual

                    udp.thrustSend = thrustManual
                    udp.momentSend = desireYawManual
                    udp.sendManual = 1
                }
            }
            Column{
                id: setParameterBoard
                topPadding: 20
                Text{
                    text: "------------------------------------- SET PARAMETERS -------------------------------------"
                    bottomPadding: 10
                }
                Row{
                    spacing: 10
                    ColumnLayout{
                        spacing: 5
                        Text{
                            text: "1. a"
                        }
                        SpinBox {
                            id: aSendBox
                            editable: true
                            from: 0
                            value: 2
                            to: 200 * 1
                            stepSize: 1

                            property int decimals: 0
                            property real realValue: value / 1

                            validator: DoubleValidator {
                                bottom: Math.min(aSendBox.from, aSendBox.to)
                                top:  Math.max(aSendBox.from, aSendBox.to)
                            }

                            textFromValue: function(value, locale) {
                                return Number(value / 1).toLocaleString(locale, 'f', aSendBox.decimals)
                            }

                            valueFromText: function(text, locale) {
                                return Number.fromLocaleString(locale, text) * 1
                            }

                            onValueChanged: {
                                udp.aSend = aSendBox.value / 1
                            }
                        }

                    }
                    ColumnLayout{
                        spacing: 20
                        Text{
                            text: "2. b"
                        }
                        SpinBox {
                            id: bSendBox
                            editable: true
                            from: 0
                            value: 20
                            to: 2000 * 1
                            stepSize: 1
                            anchors.centerIn: parent

                            property int decimals: 0
                            property real realValue: value / 1

                            validator: DoubleValidator {
                                bottom: Math.min(bSendBox.from, bSendBox.to)
                                top:  Math.max(bSendBox.from, bSendBox.to)
                            }

                            textFromValue: function(value, locale) {
                                return Number(value / 1).toLocaleString(locale, 'f', bSendBox.decimals)
                            }

                            valueFromText: function(text, locale) {
                                return Number.fromLocaleString(locale, text) * 1
                            }

                            onValueChanged: {
                                udp.bSend = bSendBox.value / 1
                            }
                        }
                    }
                    ColumnLayout{
                        spacing: 20
                        Text{
                            text: "3. k_moment"
                        }
                        SpinBox {
                            id: kMomentSendBox
                            editable: true
                            from: 0
                            value: 175
                            to: 255 * 1
                            stepSize: 1
                            anchors.centerIn: parent

                            property int decimals: 0
                            property real realValue: value / 1

                            validator: DoubleValidator {
                                bottom: Math.min(kMomentSendBox.from, kMomentSendBox.to)
                                top:  Math.max(kMomentSendBox.from, kMomentSendBox.to)
                            }

                            textFromValue: function(value, locale) {
                                return Number(value / 1).toLocaleString(locale, 'f', kMomentSendBox.decimals)
                            }

                            valueFromText: function(text, locale) {
                                return Number.fromLocaleString(locale, text) * 1
                            }

                            onValueChanged: {
                                udp.kMomentSend = kMomentSendBox.value / 1
                            }
                        }
                    }
                    ColumnLayout{
                        spacing: 20
                        Text{
                            text: "4. Cruise"
                        }
                        SpinBox {
                            id: cruiseSendBox
                            editable: true
                            from: 0
                            value: 150
                            to: 255 * 1
                            stepSize: 1
                            anchors.centerIn: parent

                            property int decimals: 0
                            property real realValue: value / 1

                            validator: DoubleValidator {
                                bottom: Math.min(cruiseSendBox.from, cruiseSendBox.to)
                                top:  Math.max(cruiseSendBox.from, cruiseSendBox.to)
                            }

                            textFromValue: function(value, locale) {
                                return Number(value / 1).toLocaleString(locale, 'f', cruiseSendBox.decimals)
                            }

                            valueFromText: function(text, locale) {
                                return Number.fromLocaleString(locale, text) * 1
                            }

                            onValueChanged: {
                                udp.cruiseSend = cruiseSendBox.value / 1
                            }
                        }
                    }
                }
                Row{
                    spacing: 10
                    ColumnLayout{
                        spacing: 20
                        Text{
                            text: "5. Arrival radius"
                        }
                        SpinBox {
                            id: arrivalRadiusSendBox
                            editable: true
                            from: 0
                            value: 2
                            to: 20 * 1
                            stepSize: 1
                            anchors.centerIn: parent

                            property int decimals: 0
                            property real realValue: value / 1

                            validator: DoubleValidator {
                                bottom: Math.min(arrivalRadiusSendBox.from, arrivalRadiusSendBox.to)
                                top:  Math.max(arrivalRadiusSendBox.from, arrivalRadiusSendBox.to)
                            }

                            textFromValue: function(value, locale) {
                                return Number(value / 1).toLocaleString(locale, 'f', arrivalRadiusSendBox.decimals)
                            }

                            valueFromText: function(text, locale) {
                                return Number.fromLocaleString(locale, text) * 1
                            }

                            onValueChanged: {
                                udp.arrivalRadiusSend = arrivalRadiusSendBox.value / 1
                            }
                        }
                    }
                    ColumnLayout{
                        spacing: 20
                        Text{
                            text: "6. Zigzag step"
                        }
                        SpinBox {
                            id: zigzagStepSendBox
                            editable: true
                            from: 0
                            value: 1 * 10
                            to: 20 * 10
                            stepSize: 1
                            anchors.centerIn: parent

                            property int decimals: 1
                            property real realValue: value / 10

                            validator: DoubleValidator {
                                bottom: Math.min(zigzagStepSendBox.from, zigzagStepSendBox.to)
                                top:  Math.max(zigzagStepSendBox.from, zigzagStepSendBox.to)
                            }

                            textFromValue: function(value, locale) {
                                return Number(value / 10).toLocaleString(locale, 'f', zigzagStepSendBox.decimals)
                            }

                            valueFromText: function(text, locale) {
                                return Number.fromLocaleString(locale, text) * 10
                            }

                            onValueChanged: {
                                udp.zigzagStepSend = zigzagStepSendBox.value / 10
                            }
                        }
                    }
                    ColumnLayout{
                        spacing: 20
                        Text{
                            text: "7. Look ahead"
                        }
                        SpinBox {
                            id: lookAheadSendBox
                            editable: true
                            from: 0
                            value: 5
                            to: 20 * 1
                            stepSize: 1
                            anchors.centerIn: parent

                            property int decimals: 0
                            property real realValue: value / 1

                            validator: DoubleValidator {
                                bottom: Math.min(lookAheadSendBox.from, lookAheadSendBox.to)
                                top:  Math.max(lookAheadSendBox.from, lookAheadSendBox.to)
                            }

                            textFromValue: function(value, locale) {
                                return Number(value / 1).toLocaleString(locale, 'f', lookAheadSendBox.decimals)
                            }

                            valueFromText: function(text, locale) {
                                return Number.fromLocaleString(locale, text) * 1
                            }

                            onValueChanged: {
                                udp.lookAheadSend = lookAheadSendBox.value / 1
                            }
                        }
                    }
                    Column{
                        Button{
                            text: "Default"
                            onClicked:{
                                udp.aSend = 2
                                udp.bSend = 20
                                udp.kMomentSend = 175
                                udp.cruiseSend = 150
                                udp.arrivalRadiusSend = 2
                                udp.zigzagStepSend = 1
                                udp.lookAheadSend = 5

                                aSendBox.value = 20
                                bSendBox.value = 200
                                kMomentSendBox.value = 175
                                cruiseSendBox.value = 150
                                arrivalRadiusSendBox.value = 2
                                zigzagStepSendBox.value = 1 * 10
                                lookAheadSendBox.value = 5

                            }
                        }
                        Button{
                            text: "Send"
                            onClicked:{
                                udp.sendParameters = 1
                            }
                        }
                    }
                }
            }
            Column{
                id: usvStates
                spacing: 7
                Text{
                    text: "------------------------------------- USV STATES -------------------------------------"
                    bottomPadding: 10
                }
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
                            text: Number(udp.zigzagStep).toFixed(1)
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

        }
        Column{
            id: controlBoard
            Column{
                id: mode_0
                spacing: 5
                bottomPadding: 15
                Text{
                    text: "------------------------------------- MODE 0: GET HOME -------------------------------------"
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
                                addMarkerHome(udp.homeLat, udp.homeLng)
                            }
                        }
                        Button{
                            id: sendHomeButton
                            text: "Send"
                            onClicked:{
                                udp.sendHome = 1
                                count = 0
                                //mapview.clearMapItems()
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

                                onValueChanged: {
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

                            onValueChanged: {
                                udp.targetLngMode1 = targetLngMode1Box.value / 1000000
                            }
                        }
                    }
                    Button{
                        id: sendMode1Button
                        text: "Send"
                        onClicked:{
                            udp.sendMode1 = 1
                            count = 0
                            //mapview.clearMapItems()
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
                    Column{
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

                                    onValueChanged: {
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

                                    onValueChanged: {
                                        udp.targetLng1Mode2 = targetLng1Mode2Box.value / 1000000
                                    }
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

                                    onValueChanged: {
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

                                    onValueChanged: {
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

                                    onValueChanged: {
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

                                    onValueChanged: {
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

                                    onValueChanged: {
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

                                    onValueChanged: {
                                        udp.targetLng4Mode2 = targetLng4Mode2Box.value / 1000000
                                    }
                                }
                            }
                        }

                    }
                    Column{
                        Button{
                            id: sendMode2Button
                            text: "Send"
                            onClicked:{
                                udp.sendMode2 = 1
                                count = 0
                                //mapview.clearMapItems()
                            }
                        }
                        Button{
                            text: "Set default"
                            onClicked:{
                                targetLat1Mode2Default = udp.targetLat1Mode2
                                targetLng1Mode2Default = udp.targetLng1Mode2
                                targetLat2Mode2Default = udp.targetLat2Mode2
                                targetLng2Mode2Default = udp.targetLng2Mode2
                                targetLat3Mode2Default = udp.targetLat3Mode2
                                targetLng3Mode2Default = udp.targetLng3Mode2
                                targetLat4Mode2Default = udp.targetLat4Mode2
                                targetLng4Mode2Default = udp.targetLng4Mode2
                            }
                        }
                        Button{
                            text: "Get default"
                            onClicked:{
                                targetLat1Mode2Box.value =  targetLat1Mode2Default * 1000000
                                targetLng1Mode2Box.value =  targetLng1Mode2Default * 1000000
                                targetLat2Mode2Box.value =  targetLng2Mode2Default * 1000000
                                targetLng2Mode2Box.value =  targetLng2Mode2Default * 1000000
                                targetLat3Mode2Box.value =  targetLng3Mode2Default * 1000000
                                targetLng3Mode2Box.value =  targetLng3Mode2Default * 1000000
                                targetLat4Mode2Box.value =  targetLng4Mode2Default * 1000000
                                targetLng4Mode2Box.value =  targetLng4Mode2Default * 1000000

                                udp.targetLat1Mode2 = targetLat1Mode2Default
                                udp.targetLng1Mode2 = targetLng1Mode2Default
                                udp.targetLat2Mode2 = targetLng2Mode2Default
                                udp.targetLng2Mode2 = targetLng2Mode2Default
                                udp.targetLat3Mode2 = targetLng3Mode2Default
                                udp.targetLng3Mode2 = targetLng3Mode2Default
                                udp.targetLat4Mode2 = targetLng4Mode2Default
                                udp.targetLng4Mode2 = targetLng4Mode2Default
                            }
                        }
                    }
                }
            }
            Column{
                id: mode_3
                Text{
                    text: "------------------------------------- MODE 3: AB LINE -------------------------------------"
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

                            onValueChanged: {
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

                            onValueChanged: {
                                udp.targetLng1Mode3 = targetLng1Mode3Box.value / 1000000
                            }
                        }
                    }
                    Button{
                        id: sendMode3Button
                        text: "Send"
                        onClicked:{
                            udp.sendMode3 = 1
                            count = 0
                            //mapview.clearMapItems()
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

                            onValueChanged: {
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

                            onValueChanged: {
                                udp.targetLng2Mode3 = targetLng2Mode3Box.value / 1000000
                            }
                        }
                    }
                }
            }
        }
    }

}
