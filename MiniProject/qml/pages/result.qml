import QtQuick 2.0
import "../components"
import QtQuick.Layouts 1.11
import QtQuick.Controls 2.15
Item {
    Rectangle {
        id: rectangle
        color: "#2c313c"
        anchors.fill: parent
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0

        CircularProgressBar{
            id:bar
            x: 20
            anchors.verticalCenter: text2.verticalCenter
            anchors.right: text2.left
            anchors.verticalCenterOffset: 0
            anchors.rightMargin: 39
            objectName: "foo_object"
            textColor: "#55aaff"
            strokeBgWidth: 5
            value: 37
            textShowValue: true

        }

        CircularProgressBar{
            id:bar1
            anchors.verticalCenter: text2.verticalCenter
            anchors.left: text2.right
            anchors.leftMargin: 38
            objectName: "foo_object"
            textColor: "#55aaff"
            strokeBgWidth: 5
            value: 63
            textShowValue: true

        }

        Rectangle {
            id: rectangle1
            x: 45
            y: 77
            width: 200
            height: 53
            color: "#495163"
            radius: 10
            anchors.verticalCenter: text3.verticalCenter
            anchors.bottom: bar.top
            anchors.horizontalCenter: bar.horizontalCenter
            anchors.bottomMargin: 28

            TextEdit {
                id: textEdit
                x: 60
                y: 17
                width: 168
                height: 20
                color: "#f1f2f4"
                text: qsTr("Probability of Alteration")
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 16
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        Rectangle {
            id: rectangle2
            x: 395
            y: 77
            width: 200
            height: 53
            color: "#495163"
            radius: 10
            anchors.verticalCenter: text3.verticalCenter
            anchors.bottom: bar1.top
            anchors.horizontalCenter: bar1.horizontalCenter
            anchors.bottomMargin: 28

            Text {
                id: text1
                x: 89
                y: 20
                color: "#f1f2f4"
                text: qsTr("Location Verified")
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 16
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        Text {
            id: text2
            text: qsTr(" ")
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            font.pixelSize: 12
            anchors.rightMargin: 308
            anchors.leftMargin: 309
            anchors.bottomMargin: 190
            anchors.topMargin: 276
        }

        Text {
            id: text3
            x: 309
            y: 97
            text: qsTr(" ")
            anchors.bottom: text2.top
            font.pixelSize: 12
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottomMargin: 165
        }
     }
}



/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:6}D{i:8}
}
##^##*/
