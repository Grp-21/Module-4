import QtQuick 2.0
import QtQuick.Controls 2.15
import "../components"
import QtQuick.Layouts 1.0



Item {
    Rectangle {
        id: rectangle
        color: "#2c313c"
        anchors.fill: parent

        function countup(counter){
                    return counter+1;
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
                            Timer {
                                id: timer
                                interval: 1000
                                onTriggered: {
                                    CircularProgressBar.value = countup(CircularProgressBar.value)
                                }

                            }


                            CircularProgressBar{
                                id:bar
                                objectName: "foo_object"
                                textColor: "#55aaff"
                                strokeBgWidth: 5
                                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                                textShowValue: true
                                caller: {
                                    if(onCompleted){
                                    stackView.push(Qt.resolvedUrl("result.qml"))
                                    }
                                }
                            }

                        }
                        Connections{
                            target: backend

                            function onReadProgress(percen){
                                bar.value = percen

                            function onPrintTime(time){
                                    ;
                                    //labelDate.text = time
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
