import QtQuick 2.0
import QtQuick.Controls 1.4
Rectangle{

        property string mode: ""
        property Item ventId
    property string vString: valueToBeChanged
        //property int index
        id : ventId

        property string valueToChange: qsTr("VCV")
        property string unit: ""
        //property var index
        property string vColor
        property string vtColor
        property string fFam
        property string vBColor
        property string vBWidth
        property string vBRadius
        property string pixelSize: "25"
        property bool focusRectVisible

        Label {
            id: label
            text: mode
            font.bold: true
            font.family: fFam//"Arial"
            anchors.top:parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.margins: 3
        }

        Rectangle {
            id: focusRect
            width: text1.width + 10
            height: text1.height + 10
            color: "yellow"
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            visible: focusRectVisible

        }

        TextInput {
            id: text1
            color: vtColor
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            text: valueToChange
            //width : parent.width
            wrapMode: Text.WordWrap
            font.bold: true
            font.family: fFam
            font.pixelSize: pixelSize
            //focus: textFocus



        }

        Label {
            id: label1
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            text: unit
            font.bold: true
            font.family: fFam//"Arial"
            anchors.margins: 3
        }

        states: [State{
            name: "highlighted"
            //when: ventId.focus === true

            PropertyChanges {
                target: ventId; border.color: "orange"
            }
            },
            State{
                name: "disabled"

                PropertyChanges {
                    target: ventId; color: "lightgray"
                }},
            State{
                name: "normal"


                PropertyChanges {
                    target: ventId; color: "grey"
                }}]


    }
