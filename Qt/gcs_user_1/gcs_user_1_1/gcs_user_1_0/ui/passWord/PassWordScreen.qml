import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle{
    id:rectanglePassWord
    color: 'yellow'
    width: rightScreen.width
    height: rightScreen.height
    anchors.fill:rightScreen
//    Image{
//        id: passWordBackGroundImage
//        height: parent.height
//        width: parent.width*1.3
//        //fillMode: Image.PreserveAspectFit
//        source: "qrc:/ui/assets/passwordBackGround.png"
//    }
    Text{
        anchors{
            bottom: rectangleTextInputPassword.top
            bottomMargin: parent.height * .01
            left:rectangleTextInputPassword.left
            //leftMargin: parent.width * .1
        }
        font.pixelSize: parent.height * .03
        text: qsTr("Password")
    }

    Rectangle{
        id:rectangleTextInputPassword
        border.width: 0.1
        border.color: 'black'
        anchors{
            verticalCenter: parent.verticalCenter
            horizontalCenter: parent.horizontalCenter
        }
        height: parent.height * .05
        width: parent.width * .2
    TextInput{
        id:passWordTextInput
        passwordMaskDelay: 1
        anchors.fill: parent
        anchors.margins: 4
        font.pointSize: parent.height * .45
    }
    }
}
