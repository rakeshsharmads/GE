import QtQuick 2.0
import QtQuick.Controls 1.4

Rectangle {
    width: parent.width
    height: parent.height
    property int nBorderWidth
    property int nFontPixelSize1
    property int nFontPixelSize2
    property string nLabel4
    property string nLabel6
    property string nLabel8
    property string nBackgroundColor
    property string nBorderColor
    property string nLabel1
    property string nLabel2
    property string nLabel3
    property string nLabel5
    property string nLabel7
    property string nFontColor
    color: nBackgroundColor
    border.width: nBorderWidth
    border.color: nBorderColor

    Rectangle {
        width: parent.width * 0.9
        height: parent.height * 0.9
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        color: parent.color

        Column {
            width: parent.width
            height: parent.height * 0.8
            spacing: 20

            Row {
                width: parent.width
                height: parent.height * 0.2
                Label {
                    anchors.left: parent.left
                    id: lb1
                    text: nLabel1
                    font.pixelSize: nFontPixelSize1
                    color: nFontColor
                }
                Label {
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: lb2
                    text: nLabel2
                    font.pixelSize: nFontPixelSize1
                    color: nFontColor
                }
                Label {
                    anchors.right: parent.right
                    id: lb3
                    text: nLabel3
                    font.pixelSize: nFontPixelSize1
                    color: nFontColor
                }
            }
            Row {
                width: parent.width
                height: parent.height * 0.4
                Label {
                    anchors.left: parent.left
                    id: lb4
                    text: nLabel4
                    font.pixelSize: nFontPixelSize2
                    color: nFontColor
                }
                Grid {
                    anchors.right: parent.right
                    columns: 2
                    spacing: 2
                    Label {
                        id: lb5
                        text: nLabel5
                        font.pixelSize: nFontPixelSize1
                        color: nFontColor
                    }
                    Label {
                        id: lb6
                        text: nLabel6
                        font.pixelSize: nFontPixelSize1
                        color: nFontColor
                    }
                    Label {
                        id: lb7
                        text: nLabel7
                        font.pixelSize: nFontPixelSize1
                        color: nFontColor
                    }
                    Label {
                        id: lb8
                        text: nLabel8
                        font.pixelSize: nFontPixelSize1
                        color: nFontColor
                    }
                }
            }
        }
    }
}
