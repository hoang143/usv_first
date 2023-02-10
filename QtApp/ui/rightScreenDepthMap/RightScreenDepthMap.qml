import QtQuick 2.1
import QtQuick.Layouts 1.0
import QtDataVisualization 1.0
import QtQuick.Dialogs 1.1
import "."

Rectangle {
    id: mainview
    width: parent.width *0.8
    color: surfacePlot.theme.windowColor
    anchors{
        top: parent.top
        bottom: bottomBar.top
        right: parent.right
    }

    property string dataFromFile
    property string strTemp
    property var lstData: []
    property var lstTemp: []
    property real i: 0
    property double minLat: 0
    property double maxLat: 0
    property double minLng: 0
    property double maxLng: 0
    property string path

    FileDialog {
        id: saveFileDialog
        selectExisting: false
        nameFilters: ["Text files (*.txt)", "All files (*)"]
        onAccepted: {
            path = saveFileDialog.fileUrl.toString()
//                console.log(path)
            path = saveFileDialog.fileUrl.toString()
            logFile.path = path

            interpolate = 1;

            dataFromFile = logFile.dataFromFile
            lstTemp = dataFromFile.split("\r\n")
            while(i != lstTemp.length - 1){
                strTemp = lstTemp[i]
                lstData = strTemp.split(",")
//                if(lstData[0] <= minLat) minLat = lstData[0]
//                if(lstData[0] >= maxLat) maxLat = lstData[0]
//                if(lstData[1] <= minLng) minLng = lstData[1]
//                if(lstData[1] <= maxLng) maxLng = lstData[1]
//                    console.log(minLat)
                surfaceData.model.append({ longitude: lstData[1], latitude: lstData[0], height: lstData[2] })
                i++
            }
               console.log(dataFromFile)
//                console.log(surfaceData.model.count)
        }
    }

    Data {
        id: surfaceData
    }

    Item {
        id: surfaceView
        width: mainview.width
        height: mainview.height
        anchors.top: mainview.top
        anchors.left: mainview.left

        //! [0]
        ColorGradient {
            id: surfaceGradient
            ColorGradientStop { position: 0.0; color: "darkslategray" }
            ColorGradientStop { id: middleGradient; position: 0.25; color: "peru" }
            ColorGradientStop { position: 1.0; color: "red" }
        }
        //! [0]

        Surface3D {
            id: surfacePlot
            width: surfaceView.width
            height: surfaceView.height
            //! [7]
            theme: Theme3D {
                type: Theme3D.ThemeStoneMoss
                font.family: "STCaiyun"
                font.pointSize: 35
                colorStyle: Theme3D.ColorStyleRangeGradient
                baseGradients: [surfaceGradient]
            }
            //! [7]
            shadowQuality: AbstractGraph3D.ShadowQualityMedium
            selectionMode: AbstractGraph3D.SelectionSlice | AbstractGraph3D.SelectionItemAndRow
            scene.activeCamera.cameraPreset: Camera3D.CameraPresetIsometricLeft
//            axisY.min: 0.0
//            axisY.max: 10.0
//            axisZ.min: 21.006418
//            axisZ.max: 21.00688017
//            axisX.min: 105.8567677
//            axisX.max: 105.8570197
            axisX.segmentCount: 10
            axisX.subSegmentCount: 2
            axisX.labelFormat: "%i"
            axisZ.segmentCount: 10
            axisZ.subSegmentCount: 2
            axisZ.labelFormat: "%i"
            axisY.segmentCount: 10
            axisY.subSegmentCount: 1
            axisY.labelFormat: "%i"
            axisY.title: "Depth"
            axisX.title: "Latitude"
            axisZ.title: "Longitude"

            //! [5]
            Surface3DSeries {
                id: surfaceSeries
                flatShadingEnabled: false
                drawMode: Surface3DSeries.DrawSurface

                ItemModelSurfaceDataProxy {
                    //! [5]
                    //! [6]
                    itemModel: surfaceData.model
                    rowRole: "longitude"
                    columnRole: "latitude"
                    yPosRole: "height"
                }
                //! [6]
                onDrawModeChanged: checkState()
            }
            //! [4]
            Surface3DSeries {
                id: heightSeries
                flatShadingEnabled: false
                drawMode: Surface3DSeries.DrawSurface
                visible: false

                HeightMapSurfaceDataProxy {
                    heightMapFile: ":/heightmaps/image"
                    // We don't want the default data values set by heightmap proxy.
//                    minXValue: 105.8567677
//                    maxXValue: 105.8570197
//                    minZValue: 21.006418
//                    maxZValue: 21.00688017
                }

                onDrawModeChanged: checkState()
            }
            //! [4]
        }
    }

    RowLayout {
        id: buttonLayout
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        opacity: 0.5

        NewButton {
            id: surfaceGridToggle
            Layout.fillWidth: true
            Layout.fillHeight: true
            text: "Show Surface Grid"
            //! [1]
            onClicked: {
                if (surfaceSeries.drawMode & Surface3DSeries.DrawWireframe) {
                    surfaceSeries.drawMode &= ~Surface3DSeries.DrawWireframe;
                    heightSeries.drawMode &= ~Surface3DSeries.DrawWireframe;
                } else {
                    surfaceSeries.drawMode |= Surface3DSeries.DrawWireframe;
                    heightSeries.drawMode |= Surface3DSeries.DrawWireframe;
                }
            }
            //! [1]
        }

        NewButton {
            id: surfaceToggle
            Layout.fillWidth: true
            Layout.fillHeight: true
            text: "Hide Surface"
            //! [8]
            onClicked: {
                if (surfaceSeries.drawMode & Surface3DSeries.DrawSurface) {
                    surfaceSeries.drawMode &= ~Surface3DSeries.DrawSurface;
                    heightSeries.drawMode &= ~Surface3DSeries.DrawSurface;
                } else {
                    surfaceSeries.drawMode |= Surface3DSeries.DrawSurface;
                    heightSeries.drawMode |= Surface3DSeries.DrawSurface;
                }
            }
            //! [8]
        }

        NewButton {
            id: flatShadingToggle
            Layout.fillWidth: true
            Layout.fillHeight: true
            text: surfaceSeries.flatShadingSupported ? "Show Flat" : "Flat not supported"
            enabled: surfaceSeries.flatShadingSupported
            //! [2]
            onClicked: {
                if (surfaceSeries.flatShadingEnabled === true) {
                    surfaceSeries.flatShadingEnabled = false;
                    heightSeries.flatShadingEnabled = false;
                    text = "Show Flat"
                } else {
                    surfaceSeries.flatShadingEnabled = true;
                    heightSeries.flatShadingEnabled = true;
                    text = "Show Smooth"
                }
            }
            //! [2]
        }

        NewButton {
            id: backgroundToggle
            Layout.fillWidth: true
            Layout.fillHeight: true
            text: "Hide Background"
            onClicked: {
                if (surfacePlot.theme.backgroundEnabled === true) {
                    surfacePlot.theme.backgroundEnabled = false;
                    text = "Show Background"
                } else {
                    surfacePlot.theme.backgroundEnabled = true;
                    text = "Hide Background"
                }
            }
        }

        NewButton {
            id: gridToggle
            Layout.fillWidth: true
            Layout.fillHeight: true
            text: "Hide Grid"
            onClicked: {
                if (surfacePlot.theme.gridEnabled === true) {
                    surfacePlot.theme.gridEnabled = false;
                    text = "Show Grid"
                } else {
                    surfacePlot.theme.gridEnabled = true;
                    text = "Hide Grid"
                }
            }
        }

        NewButton {
            id: logFromFile
            Layout.fillWidth: true
            Layout.fillHeight: true
            text: "Generate From File"
            //! [3]
            onClicked: {
                saveFileDialog.open()

            }
            //! [3]
        }
        NewButton {
            id: exit
            Layout.fillWidth: true
            Layout.fillHeight: true
            text: "X"
            //! [3]
            onClicked: {
               rightScreenDepthMap.visible = false;
            }
            //! [3]
        }
    }

    function checkState() {
        if (surfaceSeries.drawMode & Surface3DSeries.DrawSurface)
            surfaceToggle.text = "Hide Surface"
        else
            surfaceToggle.text = "Show Surface"

        if (surfaceSeries.drawMode & Surface3DSeries.DrawWireframe)
            surfaceGridToggle.text = "Hide Surface Grid"
        else
            surfaceGridToggle.text = "Show Surface Grid"
    }
}
