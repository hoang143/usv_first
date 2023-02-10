import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle{
    id: leftScreen
    //border.width: 50
    color: colorBackground
    anchors{
        left: parent.left
        right: rightScreen.left
        bottom: bottomBar.top
        top: parent.top
    }

    Home{
        id: rectangleHome
    }

    ControlManualButton{
        id: rectangleControlManualButton

    }

    SelectMode{
        id: rectangleSelectMode
    }

}
