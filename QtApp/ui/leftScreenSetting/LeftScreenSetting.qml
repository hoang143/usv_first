import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle{
    id: leftScreen
    //border.width: 50
    color: "pink"
    anchors{
        left: parent.left
        right: rightScreen.left
        bottom: bottomBar.top
        top: parent.top
    }
}
