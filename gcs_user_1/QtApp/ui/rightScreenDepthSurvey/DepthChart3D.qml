import QtQuick 2.1
import QtDataVisualization 1.2
import QtQml.Models 2.1
import QtCharts 2.2
import QtQuick.Controls 2.0

Rectangle{
    id: rectangleDepthChart3D
    visible: false
    anchors{
        right: parent.right
        rightMargin: parent.width* .29
        bottom: parent.bottom
        bottomMargin: parent.height *.08
    }
    width: depthChart2D.width * 1.5
    height: parent.height * .5
    color: "transparent"
    property string dataFromFile
    property string strTemp
    property var lstData: []
    property var lstTemp: []
    property real i: 0

    Timer {
        id:timerDepthChart3D
        interval: 1000; running: true; repeat: true
        onTriggered:{
            dataFromFile = logFile.dataFromFile
            lstTemp = dataFromFile.split("\r\n")
            while(i != lstTemp.length - 1){
                strTemp = lstTemp[i]
                lstData = strTemp.split(",")
                console.log(lstData[2])
                dataModel.append({ "longitude": lstData[1], "latitude": lstData[2], "height": lstData[0] })
                i++
            }
            console.log(dataModel.count)

//            dataModel.append({"Longitude":udp.usvLng,"Latitude": udp.depth,"Depth": udp.usvLat})
        }
    }

    ValueAxis3D {
        id: depth3DaxisX //latitude
        title: "Latitude"
        titleVisible: true
//        min: Math.min(lstLat[1], lstLat[2], lstLat[3], lstLat[4])
//        max: Math.max(lstLat[1], lstLat[2], lstLat[3], lstLat[4])
    }
    ValueAxis3D {
        id: depth3DaxisY // depth
        min: 0
        max: 7
        title: "Depth"
        titleVisible: true
    }
    ValueAxis3D {
        id: depth3DaxisZ //longitude
        title: "Longitude"
        titleVisible: true
//        min: Math.min(lstLng[1], lstLng[2], lstLng[3], lstLng[4])
//        max: Math.max(lstLng[1], lstLng[2], lstLng[3], lstLng[4])
    }

    Scatter3D {
        id:scatterDepthChart3D
//        antialiasing: true
        width: parent.width
        height: parent.height
        axisX: depth3DaxisX
        axisY: depth3DaxisY
        axisZ: depth3DaxisZ
        Scatter3DSeries {
            ItemModelScatterDataProxy {
                itemModel: dataModel
                // Mapping model roles to scatter series item coordinates.
                xPosRole: "Longitude"
                yPosRole: "Latitude"
                zPosRole: "Depth"
            }
        }
    }

    ListModel {
        id: dataModel
    }

    Button {
        id: cameraToggleButton
        anchors{
            right: parent.right

        }

        text: "Camera"
        onClicked: {
            if (scatterDepthChart3D.scene.activeCamera.cameraPreset === Camera3D.CameraPresetFront) {
                scatterDepthChart3D.scene.activeCamera.cameraPreset =
                        Camera3D.CameraPresetIsometricRightHigh;
            } else {
                scatterDepthChart3D.scene.activeCamera.cameraPreset = Camera3D.CameraPresetFront;
            }
        }
    }

    Button {
        id: backgroundToggle
        text: "Hide Background"
        onClicked: {
            if (scatterDepthChart3D.theme.backgroundEnabled === true) {
                scatterDepthChart3D.theme.backgroundEnabled = false;
                text = "Show Background";
            } else {
                scatterDepthChart3D.theme.backgroundEnabled = true;
                text = "Hide Background";
            }
        }
    }
}




