import QtQuick 2.8
import QtCharts 2.2
import QtQuick.Window 2.2
import QtQuick.Controls 2.12
import QtDataVisualization 1.2

Rectangle{
    id: rectangleDepthChart2D
    visible: true
    anchors{
        right: parent.right
        rightMargin: parent.width * .29
        top: parent.top
    }
    width: parent.height * .5
    height: parent.height * .4
    color: "black"

    Timer {
        id:timerDepthChart2D
        interval: 1000; running: true; repeat: true
        onTriggered:{
            mainwindow.indexDepthChart2D += 1
            lineDepthChart2D.append(indexDepthChart2D,udp.depth)
            if(indexDepthChart2D > 8){
                depth2Daxisx.min = indexDepthChart2D -8
                depth2Daxisx.max = indexDepthChart2D + 1
            }
        }
    }

    ChartView {
//        title: "Depth over time (m)"
        anchors{
            centerIn: parent
        }
        width: parent.width * 1.1
        height: parent.height * 1.1
        antialiasing: true
        backgroundColor: "white"
//        opacity: 0.5

        ValueAxis {
            id: depth2DaxisY
            min: 0
            max: 5
            gridVisible: true
            color: "black"
            labelsColor: "black"
            labelFormat: "%.0f"
            titleText: "Depth(m)"
                }

        ValueAxis {
            id: depth2Daxisx
            min: 0
            max: 8
            gridVisible: true
            color: "black"
            labelsColor: "black"
            labelFormat: "%.0f"
            tickCount: 8
            titleText: "Time(s)"
                }

        LineSeries {
            id: lineDepthChart2D
            name: "Depth over time (m)"
            axisX: depth2Daxisx
            axisY: depth2DaxisY
        }
    }
    }
