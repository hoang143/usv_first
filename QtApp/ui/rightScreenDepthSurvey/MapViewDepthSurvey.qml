import QtQuick 2.12
import QtLocation 5.15
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.15
import QtPositioning 5.6
import QtQml 2.0
import QtQuick.Dialogs 1.1

Rectangle{
        id: rectangleMapDepthSurvey
    //    border.width: 100
    //    border.color: 'black'
        anchors{
            left: parent.left
            leftMargin: parent.width * .01
            top: parent.top
            topMargin: parent.height * .01
            bottom: parent.bottom
            bottomMargin: parent.height *.01
        }
        width: parent.width * .69
        height: parent.height * .98
        property string textLogFile
        property real countLogFile: 0

        function saveFile(fileUrl, text) {
            var request = new XMLHttpRequest();
            request.open("PUT", fileUrl, false);
            request.send(text);
            return request.status;
        }

        FileDialog {
            id: saveFileDialog
            selectExisting: false
            nameFilters: ["Text files (*.txt)", "All files (*)"]
            onAccepted: saveFile(saveFileDialog.fileUrl, textLogFile)
        }

        Timer {
            id:timerMapView
            interval: 1000; running: true; repeat: true

            onTriggered:{
                if(udp.usvLat != 0) {
                    countLineUSV +=1
                    markerUSV.clear()
                    lineUSV.addCoordinate(QtPositioning.coordinate(udp.usvLat, udp.usvLng))
                    markerUSV.append({"coords": QtPositioning.coordinate(udp.usvLat, udp.usvLng)})
                }
            }
        }

        Timer {
            id:timerLogFile
            interval: 1000; running: false; repeat: true

            onTriggered:{
                console.log(textLogFile)
                countLogFile += 1;
                textLogFile = textLogFile + qsTr(countLogFile + ", " + udp.usvLat + ", " + udp.usvLng + ", " + udp.depth + ", " + udp.usvYaw + "\n")
            }
        }

        MessageDialog {
            id: messagebox
            title:{
                if(selectAutoModeGcs == 1) {qsTr("Mode " + selectAutoModeGcs + ": Single Target")}
                else if(selectAutoModeGcs == 2) {qsTr("Mode " + selectAutoModeGcs + ": ZigZag ")}
                else if(selectAutoModeGcs == 3)  {qsTr("Mode " + selectAutoModeGcs + ": Two Line(AB)")}
            }

            icon: StandardIcon.Question
            text: "Confirm Position?"
            visible: false
            standardButtons: MessageDialog.Yes | MessageDialog.No
            onYes: {
                if(selectAutoModeGcs == 2){
                    udp.targetLat1Mode2 = lstLat[1]
                    udp.targetLng1Mode2 = lstLng[1]
                    udp.targetLat2Mode2 = lstLat[2]
                    udp.targetLng2Mode2 = lstLng[2]
                    udp.targetLat3Mode2 = lstLat[3]
                    udp.targetLng3Mode2 = lstLng[3]
                    udp.targetLat4Mode2 = lstLat[4]
                    udp.targetLng4Mode2 = lstLng[4]

                    mainwindow.stateStopWatch = true
                    udp.sendMode2 = 1
                }

                if(selectAutoModeGcs == 1){
                    udp.targetLatMode1 = lstLat[1]
                    udp.targetLngMode1 = lstLng[1]

                    mainwindow.stateStopWatch = true
                    udp.sendMode1 = 1
                }

                if(selectAutoModeGcs == 3){

                    udp.targetLat1Mode3 = lstLat[1]
                    udp.targetLng1Mode3 = lstLng[1]
                    udp.targetLat2Mode3 = lstLat[2]
                    udp.targetLng2Mode3 = lstLng[2]

                    mainwindow.stateStopWatch = true
                    udp.sendMode3 = 1
                }
            }
        }

        Rectangle{
            id:rectangleDeleteAllButton
            color: 'pink'
            anchors{
                bottom: parent.bottom
                left: parent.left
            }
            z:10
            width: parent.width * .7
            height: parent.width * .05
            Button{
                id: deleteAllButton
                anchors{
                    verticalCenter: parent.verticalCenter
                    left: parent.left
                }
                width:rectangleDeleteAllButton.width *.3
                height:rectangleDeleteAllButton.height

                text: qsTr("Delete All")
                onClicked: {
                    lst.clear()
                    for(i = count ; i >=-1; i --){
                        line.removeCoordinate(count)
                        mark_.remove(count)
                        count -=1
                    }

                    count = 0
                }
            }

        CheckBox {
                id: checkBox
                anchors{
                    bottom: parent.bottom
                    left: deleteButton.right
                }
                z:10
                height: parent.height
                checked: true
                text: qsTr("Stream Data")
        }

        Button{
            id: deleteButton
            anchors{
                bottom: parent.bottom
                left: deleteAllButton.right
                leftMargin: parent.width * .01
            }
            z:10
            width: parent.width * .25
            height: deleteAllButton.height
            text: qsTr("Delete")
            onClicked:{
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

        Button{
            id: deleteLineUSV
            anchors{
                bottom: parent.bottom
                left: checkBox.right
                leftMargin: parent.width * .01
            }
            z:10
            width: parent.width * .25
            height: deleteAllButton.height
            text: qsTr("Delete USV Line")
            onClicked:{
                for(i = countLineUSV ; i >=-1; i --){
                    lineUSV.removeCoordinate(countLineUSV-1)
                    countLineUSV -=1
                }

                countLineUSV = 0
            }
        }

        Button {
            property int state: 0
            id: hideShowDepthChart
            anchors{
                bottom: parent.bottom
                left: deleteLineUSV.right
                leftMargin: parent.width * .01
            }
            z:10
            width: parent.width * .25
            height: deleteAllButton.height
            text: "Hide Chart"
            onClicked: {
                if(state % 2 == 0) {
                    depthChart2D.visible = true
                    depthChart3D.visible = true
                    hideShowDepthChart.text = "Hide Chart"
                }
                else {
                    depthChart2D.visible = false
                    depthChart3D.visible = false
                    hideShowDepthChart.text = "Show Chart"
                }
                state += 1
            }
        }
        Button{
            property int state: 0
            id: logFileButton
            anchors{
                bottom: parent.bottom
                left: hideShowDepthChart.right
                leftMargin: parent.width * .01
            }
            z:10
            width: parent.width * .25
            height: deleteAllButton.height
            text: "Log File"
            onClicked: {
                state += 1
                if(state % 2 != 0) {
                    saveFileDialog.open()
                    timerLogFile.running = true
                    logFileButton.text = "Stop Log"
//                    console.log(textLogFile)
                }
                else {
                    saveFileDialog.close()
                    timerLogFile.running = false
                    textLogFile = ""
                    countLogFile = 0
                    logFileButton.text = "Log file"
//                    console.log(textLogFile)
                }

            }
        }
        }

        Plugin {
                  id: mapboxglPlugin
                  name: "mapboxgl"
                  PluginParameter{
                      name: "mapboxgl.mapping.additional_style_urls"
                      value: mapStyle // style mapbox
                  }
               }
        Map {
             id: mapview
             anchors.fill: parent
             plugin: mapboxglPlugin
             activeMapType: map.supportedMapTypes[5]
             center: QtPositioning.coordinate(udp.homeLat, udp.homeLng)
//             center: QtPositioning.coordinate(21.00578916837529, 105.85859245539928)
             zoomLevel: 18
             Line{
                 id: line
             }
             LineUSV{
                 id:lineUSV
             }
             LineZigzag{
                 id: lineZigzag
             }

             MapItemView{
                model:markerUSV
                delegate: MarkerUSV{
                     coordinate:QtPositioning.coordinate(udp.usvLat,udp.usvLng)
                }
             }

             MapItemView{
                model:markerHome
                delegate: MarkerHome{
                     coordinate:QtPositioning.coordinate(udp.homeLat,udp.homeLng)
                }
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
                      property double latMouse
                      property double lngMouse

                      onClicked: {
                          var coordinate = mapview.toCoordinate(Qt.point(mouse.x,mouse.y))
    //                          console.log(mapview.toCoordinate(Qt.point(mouse.x,mouse.y)).latitude);
    //                          console.log(mapview.toCoordinate(Qt.point(mouse.x,mouse.y)).longitude);
                          latMouse = coordinate.latitude
                          lngMouse = coordinate.longitude
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
                          if(selectAutoModeGcs == 1){
                                  messagebox.visible = true
                          }
                          if(selectAutoModeGcs == 2){
                              if(count >= 4) {
                                  messagebox.visible = true
                                  line.addCoordinate(QtPositioning.coordinate(lstLat[1], lstLng[1]))
                                  getLstLatLng()
                                  getLstZigzag()
                                  for(i = 0; i < lstLatZigzag.length; i++){
                                  lineZigzag.addCoordinate(QtPositioning.coordinate(lstLatZigzag[i], lstLngZigzag[i]))
                                  }
                                  }
                          }
                          if (selectAutoModeGcs == 3){
                              if(count >= 2) {
                                  messagebox.visible = true
                              }
                          }
          }
          }
    }
    //----------end rectangle----------------
}

