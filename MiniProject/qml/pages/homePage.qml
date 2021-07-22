import QtQuick 2.0
import QtQuick.Controls 2.15
import "../controls"
import "../components"
import QtQuick.Layouts 1.0
import QtQuick.Dialogs 1.3
import Qt.labs.folderlistmodel 2.12

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
            color: "#1d2128"
            radius: 10
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 140
            anchors.rightMargin: 50
            anchors.leftMargin: 50
            anchors.topMargin: 50

            Label {
                id: labelTextName
                y: 8
                height: 25
                color: "#5c667d"
                text: qsTr("Welcome")
                anchors.left: parent.left
                anchors.right: parent.right
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.leftMargin: 10
                anchors.rightMargin: 10
                font.pointSize: 14
            }

            Rectangle {
                id: rectangle1
                y: 238
                height: 73
                color: "#00000000"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.rightMargin: -150
                anchors.leftMargin: -50
                anchors.bottomMargin: -90

                CustomButton {
                    id: btnVerify1
                    y: 15
                    height: 43
                    text: "Verify"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.right: text3.left
                    anchors.rightMargin: -20
                    anchors.leftMargin: 50
                    colorDefault: "#4891d9"
                    Layout.fillWidth: true
                    Layout.preferredWidth: 250
                    Layout.preferredHeight: 40
                    Layout.maximumWidth: 200
                    onClicked: {
                        btnHome.isActiveMenu = false
                        stackView.push(Qt.resolvedUrl("settingsPage.qml"))
                    }
                }

                CustomButton {
                    id: btnVerify2
                    y: 15
                    height: 43
                    text: "Upload Location File"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: text3.right
                    anchors.right: parent.right
                    anchors.leftMargin: 20
                    anchors.rightMargin: 154
                    Layout.fillWidth: true
                    Layout.preferredHeight: 40
                    Layout.preferredWidth: 250
                    colorDefault: "#4891d9"
                    Layout.maximumWidth: 200
                    onClicked: {
                        fileDialog1.visible = true

                    }
                    FileDialog {
                        id: fileDialog1
                        title: "Please choose an text"
                        folder: shortcuts.StandardPaths.standardLocations(StandardPaths.PicturesLocation)[0]
                        nameFilters: [ "Text files (*.txt )", "All files (*)" ]
                        onAccepted: {
                            backend.fileName(fileDialog1.fileUrl)
                        }
                    }
                }

                Text {
                    id: text3
                    x: 253
                    y: 30
                    text: qsTr(" ")
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 12
                    anchors.horizontalCenterOffset: -100
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            Label {
                id: labelDate
                y: 31
                height: 25
                color: "#55aaff"
                text: qsTr("Date")
                anchors.left: parent.left
                anchors.right: parent.right
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.rightMargin: 10
                anchors.leftMargin: 10
                font.pointSize: 12
            }

            ScrollView {
                id: scrollView
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: labelDate.bottom
                anchors.bottom: parent.bottom
                clip: true
                anchors.rightMargin: 10
                anchors.leftMargin: 10
                anchors.bottomMargin: 10
                anchors.topMargin: 10
            }

            GridLayout {
                width: 1000
                height: 580
                anchors.fill: parent
                rows: 2
                columns: 3

                GridLayout {
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    Layout.columnSpan: 3
                    rows: 1
                    columns: 3


                    MouseArea {
                        id: mouseArea
                        anchors.fill: parent
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        onClicked: {
                            fileDialog.visible = true

                        }
                        FileDialog {
                            id: fileDialog
                            title: "Please choose an image"
                            folder: shortcuts.StandardPaths.standardLocations(StandardPaths.PicturesLocation)[0]
                            nameFilters: [ "Image files (*.jpeg *.jpg)", "All files (*)" ]
                            onAccepted: {
                                image.source= fileDialog.fileUrl
                                backend.get_image_path(fileDialog.fileUrl)
                                text1.text = " "
                                text2.text = " "
                                labelTextName.text = " "
                                labelDate.text = " "
                            }
                        }
                        Image {
                            id: image
                            objectName: "foo_object"
                            visible: true
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: parent.top
                            anchors.bottom: parent.bottom
                            anchors.rightMargin: 8
                            anchors.leftMargin: 8
                            anchors.bottomMargin: 8
                            anchors.topMargin: 8
                            fillMode: Image.PreserveAspectFit
                        }
                        Text {
                            id: text1
                            x: 161
                            y: 140
                            text: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\np, li { white-space: pre-wrap; }\n</style></head><body style=\" font-family:'MS Shell Dlg 2'; font-size:7.8pt; font-weight:400; font-style:normal;\">\n<p align=\"center\" style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'Segoe UI Historic'; font-size:22pt; color:#4970ff;\">Upload Your Picture</span></p></body></html>"
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 12
                            anchors.horizontalCenter: parent.horizontalCenter
                            textFormat: Text.RichText
                        }

                        Text {
                            id: text2
                            x: 270
                            y: 121
                            text: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\np, li { white-space: pre-wrap; }\n</style></head><body style=\" font-family:'MS Shell Dlg 2'; font-size:7.8pt; font-weight:400; font-style:normal;\">\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'Segoe UI Historic'; font-size:12pt; color:#3d91ff;\">Click Here to</span></p></body></html>"
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 12
                            anchors.verticalCenterOffset: -35
                            anchors.horizontalCenter: parent.horizontalCenter
                            textFormat: Text.RichText
                        }
                    }
                }
            }




            Connections{
                target: backend

                function onSetName(name){
                    labelTextName.text = name
                }

                function onPrintTime(time){
                    labelDate.text = time
                }

                function onIsVisible(isVisible){
                    rectangleVisible.visible = isVisible
                }

                function onSendText(){

                }
            }





        }



    }
}


/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:1.1;height:480;width:640}
}
##^##*/
