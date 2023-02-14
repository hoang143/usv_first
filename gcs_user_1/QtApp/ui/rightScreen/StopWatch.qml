import QtQuick 2.15

Rectangle{
    id:rectangleStopWatch
    color: 'white'
    anchors{
        left: rectangleMap.right
        leftMargin: parent.width *.01
        top: parent.top
        topMargin: parent.height *.01
        right: parent.right
        rightMargin: parent.right *.01

    }
    height: parent.height * .2
    width: parent.width * .28
}
