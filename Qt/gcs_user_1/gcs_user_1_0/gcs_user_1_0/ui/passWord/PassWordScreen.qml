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
//        width: parent.width
//        fillMode: Image.PreserveAspectFit
//        source: "qrc:/ui/assets/depth.png"
//    }
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
