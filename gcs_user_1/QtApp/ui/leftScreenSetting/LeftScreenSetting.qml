import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle{
    id: leftScreen
    //border.width: 50
    color: "white"
    anchors{
        left: parent.left
        right: rightScreen.left
        bottom: bottomBar.top
        top: parent.top
    }
//    Button{
//        id: deleteLineUSV
//        z:10
//        width: parent.width * .25
//        height: 30
//        text: qsTr("change color")
//        onClicked:{
//            mainwindow.colorTheme = "blue"
//        }
//    }

    Label{
        id: textThemeLabel
        text: "Theme color"
        anchors{
            top: rectangletext.top
            topMargin: parent.height *.01
            left: parent.left
            leftMargin: parent.width *.01
            verticalCenter: parent
        }
        font.pixelSize: parent.height *.02
    }
    Rectangle{
        id: rectangletext
        anchors{
            top: parent.top
            topMargin: parent.height *.02
            left: textThemeLabel.right
            leftMargin: parent.width *.01
//            verticalCenter: rectangletext
        }
        border.width: 1
        width: parent.width *.5
        height: 30
        TextInput{
            id: textColorTheme
            anchors.centerIn: parent
            width: parent.width*.96
            height: parent.height*.8
            onAccepted: {
                mainwindow.colorTheme = textColorTheme.getText(0,20)
                console.log(textColorTheme.getText(0,20))
            }
        }
    }

    Label{
        id: textBackgroundLabel
        text: "Background"
        anchors{
            left: parent.left
            leftMargin: parent.width *.01
            top: rectangleTextBackground.top
            topMargin: parent.height *.01
//            verticalCenter: rectangleTextBackground
        }
        font.pixelSize: parent.height *.02
    }

    Rectangle{
        id: rectangleTextBackground
        anchors{
            top: rectangletext.bottom
            topMargin: parent.height * .01
            left: rectangletext.left
        }

        border.width: 1
        width: parent.width *.5
        height: 30

        TextInput{
            id: textColorBackground
            anchors.centerIn: parent
            width: parent.width*.96
            height: parent.height*.8
            onAccepted: {
                mainwindow.colorBackground = textColorBackground.getText(0,20)
                console.log(textColorBackground.getText(0,20))
            }
        }
    }
}
