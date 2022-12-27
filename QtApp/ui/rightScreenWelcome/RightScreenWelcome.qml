import QtQuick 2.15
import QtMultimedia 5.15

Rectangle{
    id: rightScreenWelcome
    color: "grey"
    width: parent.width *0.8
    anchors{
        top: parent.top
        bottom: bottomBar.top
        right: parent.right
    }

    Image{
        id: welcomeImage
        anchors.fill: parent
        //fillMode: Image.PreserveAspectFit
        source: "qrc:/ui/assets/welcomeImage.png"
    }
}
