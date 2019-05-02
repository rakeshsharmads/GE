import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Button {
    id: buttonText
    property int ventW
    property int ventH
    width:ventW
    height: ventH

    property string mode: qsTr("Mode")
    property string valueToChange: qsTr("VCV")
    property string unit: qsTr("Unit")

    property string vColor
    property string fFam
    property string vBColor
    property string vBWidth
    property string vBRadius

    Label {
        id: label
        text: mode
        font.bold: true
        font.family: fFam//"Arial"
        anchors.top:parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.margins: 3
    }

    Text {
        id: text1
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        text: valueToChange
        wrapMode: Text.WordWrap
        font.bold: true
        font.family: fFam
        font.pixelSize: 25
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

    style: ButtonStyle {
        background: Rectangle {
            border.color:vBColor
            border.width: vBWidth
            radius: vBRadius
            color: control.pressed ? vColor : Qt.rgba(152/255,152/255,152/255);
        }
    }

}
