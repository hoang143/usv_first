import QtQuick 2.15
import QtMultimedia 5.12
import QtQuick.Controls 2.0

Rectangle{
    id: rightScreenWelcome
    color: "white"
    width: parent.width *0.8
    anchors{
        top: parent.top
        bottom: bottomBar.top
        right: parent.right
    }

    Image{
        id: welcomeScreenImage
        anchors.fill: parent
        height: parent.height
        width: parent.width
        fillMode: Image.PreserveAspectFit
        source: "qrc:/ui/assets/welcomeImage.png"
    }

        Video {
            id: video
            anchors.fill: parent
            width: parent.width
            height: parent.height
            source: "qrc:/ui/assets/WelcomeScreen1.mp4"
            onStatusChanged: play()
        }
}


