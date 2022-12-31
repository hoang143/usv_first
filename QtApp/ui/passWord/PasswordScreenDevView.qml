import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQml 2.15

Rectangle{
    id:rectanglePassWord
    color: colorBackground
    width: rightScreen.width
    height: rightScreen.height
    anchors.fill:rightScreen
    z: 20
    Text{
        anchors{
            bottom: rectangleTextInputPassword.top
            bottomMargin: parent.height * .01
            left:rectangleTextInputPassword.left
            //leftMargin: parent.width * .1
        }
        font.pixelSize: parent.height * .03
        text: qsTr("Password to access Develop view")
    }

    Rectangle{
        id:rectangleTextInputPassword
        border.width: 1
        border.color: 'black'
        anchors{
            verticalCenter: parent.verticalCenter
            horizontalCenter: parent.horizontalCenter
        }
        height: parent.height * .05
        width: parent.width * .4
    TextInput{
        id:passWordTextInput
        passwordMaskDelay: 1
        anchors.fill: parent
        anchors.margins: 1
        font.pointSize: parent.height * .45
        echoMode: TextInput.Password
        onAccepted:{
            if(mainwindow.passwordDevView == passWordTextInput.getText(0, 20)){
                devView.visible = true
                passwordScreenDevView.visible = false
            }
        }
    }
    }
//    Button{
//        id: acceptButton
//        text: "OK"
//        anchors{
//            top: rectangleTextInputPassword.bottom
//            topMargin: parent.height *.01
//            left: rectangleTextInputPassword.left
//        }
//        width: rectangleTextInputPassword.width
//        height: rectangleTextInputPassword.height * .8

//    }
}
