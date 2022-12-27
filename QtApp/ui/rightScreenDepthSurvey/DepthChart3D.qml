import QtQuick 2.0
import QtDataVisualization 1.2
import QtQml.Models 2.1
import QtCharts 2.2
import QtQuick.Controls 2.0

Rectangle{
    id: rectangleDepthChart3D
    visible: true
    anchors{
        right: parent.right
        rightMargin: parent.width* .29
        bottom: parent.bottom
        bottomMargin: parent.height *.08
    }
    width: depthChart2D.width * 1.5
    height: parent.height * .5
    color: "blue"

    Timer {
        id:timerDepthChart3D
        interval: 1000; running: true; repeat: true
        onTriggered:{

            mainwindow.indexDepthChart2D += 1
            dataModel.append({"Longitude":indexDepthChart2D + 4,"Latitude": yDepthChart2D,"Depth": 1})
        }
    }

    ValueAxis {
        id: depth3DaxisX
        min: 0
        max: 5
        gridVisible: true
        color: "black"
        labelsColor: "black"
        labelFormat: "%.0f"
        titleText: "Longitude"
    }
    ValueAxis {
        id: depth3DaxisY
        min: 0
        max: 5
        gridVisible: true
        color: "black"
        labelsColor: "black"
        labelFormat: "%.0f"
        titleText: "Latitude"
    }
    ValueAxis {
        id: depth3DaxisZ
        min: 0
        max: 5
        gridVisible: true
        color: "black"
        labelsColor: "black"
        labelFormat: "%.0f"
        titleText: "Depth(m)"
    }

    Scatter3D {
        id:scatterDepthChart3D
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


