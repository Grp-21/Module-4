import QtQuick 2.0
import QtQuick.Controls 2.15
import "../components"
import QtQuick.Layouts 1.0



Item {
    Rectangle {
        id: rectangle
        color: "#2c313c"
        anchors.fill: parent

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



                            CircularProgressBar{
                                id:bar
                                objectName: "foo_object"
                                textColor: "#55aaff"
                                strokeBgWidth: 5
                                value:0
                                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                                textShowValue: true
                                caller: {
                                    if(bar.visible==true){
                                        timer.running = true
                                    }
                            }
                            }
                            Timer{
                                id:timer
                                interval: 50
                                running: true
                                repeat: true
                                onTriggered: {
                                    if(bar.value<100){
                                        bar.value = bar.value+1
                                    }
                                    else{
                                        stackView.push(Qt.resolvedUrl("result.qml"))
                                        timer.running = false
                                    }
                                }

                            }


                        }
                        }
                    }



    }



/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:800}
}
##^##*/
