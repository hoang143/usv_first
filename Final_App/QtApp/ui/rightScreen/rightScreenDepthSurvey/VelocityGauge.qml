import QtQuick 2.15
import QtQuick.Extras 1.4

Rectangle{
    id: rectangleVelocity
    anchors{
        left: rectangleMap.right
        leftMargin: 30
        top: parent.top
        topMargin: 30
        right: parent.right
        rightMargin: 30

    }
    height: parent.height * .6

    CircularGauge {
        value: accelerating ? maximumValue : 0
        anchors.centerIn: parent
        property bool accelerating: false

        Keys.onSpacePressed: accelerating = true
        Keys.onReleased: {
            if (event.key === Qt.Key_Space) {
                accelerating = false;
                event.accepted = true;
            }
        }

        Component.onCompleted: forceActiveFocus()

        Behavior on value {
            NumberAnimation {
                duration: 1000
            }
        }
    }
}


