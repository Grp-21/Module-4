import QtQuick 2.0

Item {
    Rectangle {
        id: rectangle
        color: "#2c313c"
        anchors.fill: parent
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0

        Rectangle {
            id: rectangleVisible
            y: 73
            height: 334
            color: "#1d2128"
            radius: 10
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: rectangleTop.bottom
            anchors.rightMargin: 50
            anchors.leftMargin: 50
            anchors.topMargin: 10

            Text {
                id: text1
                y: 140
                text: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\np, li { white-space: pre-wrap; }\n</style></head><body style=\" font-family:'MS Shell Dlg 2'; font-size:7.8pt; font-weight:400; font-style:normal;\">\n<p align=\"center\" style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'Segoe UI Historic'; font-size:22pt; color:#4970ff;\">Team 21</span></p></body></html>"
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.right: parent.right
                font.pixelSize: 12
                anchors.rightMargin: 56
                anchors.leftMargin: 56
                anchors.verticalCenterOffset: -119
                textFormat: Text.RichText
            }

            Text {
                id: text2
                x: 270
                text: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\np, li { white-space: pre-wrap; }\n</style></head><body style=\" font-family:'MS Shell Dlg 2'; font-size:7.8pt; font-weight:400; font-style:normal;\">\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'Segoe UI Historic'; font-size:10pt; color:#3d91ff;\">Presents</span></p></body></html>"
                anchors.verticalCenter: parent.verticalCenter
                anchors.top: text1.bottom
                font.pixelSize: 12
                anchors.topMargin: -2
                anchors.horizontalCenterOffset: 0
                anchors.verticalCenterOffset: -84
                textFormat: Text.RichText
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Text {
                id: text3
                x: 56
                width: 328
                height: 112
                text: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\np, li { white-space: pre-wrap; }\n</style></head><body style=\" font-family:'MS Shell Dlg 2'; font-size:7.8pt; font-weight:400; font-style:normal;\">\n<span style=\" font-family:'Segoe UI Historic'; font-size:10pt; color:#3d91ff;\"><p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\">Pratik Pathak EU1182007 (27) [B] </p><p>\nShirley Pereira EU1182005 (32) [B]</p><p>Kaustubh Rai EU1172112 (78) [A]</span></p></body></html>"
                anchors.top: parent.top
                font.pixelSize: 12
                anchors.topMargin: 188
                textFormat: Text.RichText
            }

            Text {
                id: text4
                x: 270
                width: 567
                height: 30
                text: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\np, li { white-space: pre-wrap; }\n</style></head><body style=\" font-family:'MS Shell Dlg 2'; font-size:7.8pt; font-weight:400; font-style:normal;\">\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'Segoe UI Historic'; font-size:10pt; color:#3d91ff;\">Authentication Verifier for Images and its location using TensorFlow/Keras\n</span></p></body></html>"
                anchors.verticalCenter: parent.verticalCenter
                anchors.top: parent.top
                font.pixelSize: 12
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.horizontalCenterOffset: 0
                anchors.verticalCenterOffset: -36
                anchors.topMargin: 116
                textFormat: Text.RichText
            }

            Text {
                id: text5
                x: 270
                text: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\np, li { white-space: pre-wrap; }\n</style></head><body style=\" font-family:'MS Shell Dlg 2'; font-size:7.8pt; font-weight:400; font-style:normal;\">\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'Segoe UI Historic'; font-size:10pt; color:#3d91ff;\">Team Members: </span></p></body></html>"
                anchors.verticalCenter: parent.verticalCenter
                anchors.top: parent.top
                font.pixelSize: 12
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.horizontalCenterOffset: 0
                anchors.verticalCenterOffset: 7
                anchors.topMargin: 162
                textFormat: Text.RichText
            }

        }

    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:1.33;height:480;width:640}
}
##^##*/
