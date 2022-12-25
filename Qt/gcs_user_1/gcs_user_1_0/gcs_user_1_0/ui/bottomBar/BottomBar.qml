import QtQuick 2.15
import QtQuick.Extras 1.4
import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.3

Rectangle{
    id:bottombar
    anchors {
        left: parent.left
        right: parent.right
        bottom: parent.bottom
    }
    color: "blue"
    height: parent.height / 15

    Rectangle{
        id:rectangleSettingIcon
        color: 'black'
        anchors{
            left: parent.left
            leftMargin: 30
            verticalCenter: parent.verticalCenter
        }

        height: parent.height *.8
        Image{
            id: settingIcon
            anchors{
                horizontalCenter: parent.horizontalCenter
                verticalCenter: parent.verticalCenter
            }

            height: parent.height *.8
            fillMode: Image.PreserveAspectFit
            source: "qrc:/ui/assets/setting.png"
        }

        MouseArea{
            anchors.fill: parent
            onClicked: {
                parent.color = 'orange'
            }
        }
}

    StatusIndicator {
            id: statusIndicatorConnected
            anchors.centerIn: parent
            active: true
            color: "green"
        }




}
