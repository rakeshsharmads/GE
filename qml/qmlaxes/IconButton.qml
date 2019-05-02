import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.3

Button {
    property string iconid

    property int iconW
    property int iconH
    property string istate
    property string iColor
    property string iText
    property string iSource
    property int iBorderRadius
    property string iOpacity
    property string iShadowColor
    property int iShadowOffsetHorizontal
    property int iShadowOffsetVertical
    property string iFontColor
    property string iFont
    property int iPixelSize
    property bool selected
    id: iconId

    width: iconW
    height: iconH

    layer.enabled: true
    layer.effect: DropShadow {
        color:  iShadowColor
        transparentBorder: true
        horizontalOffset: iShadowOffsetHorizontal
        verticalOffset: iShadowOffsetVertical

    }
    opacity: iOpacity
    property Component myIconStyle1: ButtonStyle {
        id: unselectedstyle
        background: Rectangle{
            id : rect1
            antialiasing: true
            smooth: true
            color: iColor
            radius: iBorderRadius

        }

        label: ColumnLayout {
            id: layout
            spacing: 2
            Image {
                Layout.alignment: Qt.AlignHCenter
                source: iSource
            }
            Text {
                text: iText
                Layout.alignment: Qt.AlignCenter
                color: iFontColor
                font.bold: true
                font.family: iFont
                font.pixelSize: iPixelSize
            }


        }
    }

    property Component myIconStyle2: ButtonStyle {
        id: scrollactivestyle

        background: Rectangle{
            id : rect2
            antialiasing: true
            smooth: true
            gradient: Gradient {
                GradientStop { position: 0.0; color: Qt.rgba(155/255, 158/255, 180/255); }
                GradientStop { position: 1.0; color: Qt.rgba(120/255, 128/255, 161/255); }
            }
            border.width: 3
            border.color: Qt.rgba(255/255, 186/255, 18/255);
            radius: iBorderRadius

        }

        label: ColumnLayout {
            id: layout2
            spacing: 2
            Image {
                Layout.alignment: Qt.AlignHCenter
                source: iSource
            }
            Text {
                text: iText
                Layout.alignment: Qt.AlignCenter
                color: iFontColor
                font.bold: true
                font.family: iFont
                font.pixelSize: iPixelSize
            }


        }
    }

    property Component myIconStyle3: ButtonStyle {
        id: touchedstyle
        background: Rectangle{
            id : rect3
            antialiasing: true
            smooth: true
            color: Qt.rgba(144/255, 164/255, 176/255);
            border.width: 3
            border.color: Qt.rgba(154/255, 227/255, 255/255);
            radius: iBorderRadius

        }

        label: ColumnLayout {
            id: layout3
            spacing: 2
            Image {
                Layout.alignment: Qt.AlignHCenter
                source: iSource
            }
            Text {
                text: iText
                Layout.alignment: Qt.AlignCenter
                color: iFontColor
                font.bold: true
                font.family: iFont
                font.pixelSize: iPixelSize
            }


        }
    }

    property Component myIconStyle4: ButtonStyle {
        id: disabledstyle
        background: Rectangle{
            id : rect4
            antialiasing: true
            smooth: true
            color: "#c7c7cc"
            radius: iBorderRadius

        }

        label: ColumnLayout {
            id: layout4
            spacing: 2
            Image {
                Layout.alignment: Qt.AlignHCenter
                source: iSource
            }
            Text {
                text: iText
                Layout.alignment: Qt.AlignCenter
                color: iFontColor
                font.bold: true
                font.family: iFont
                font.pixelSize: iPixelSize
            }


        }
    }
    property Component myIconStyle5: ButtonStyle {
        id: hoverstyle
        background: Rectangle{
            id : rect5
            antialiasing: true
            smooth: true
            color: "#4c4e56"
            radius: iBorderRadius

        }

        label: ColumnLayout {
            id: layout5
            spacing: 2
            Image {
                Layout.alignment: Qt.AlignHCenter
                source: iSource
            }
            Text {
                text: iText
                Layout.alignment: Qt.AlignCenter
                color: iFontColor
                font.bold: true
                font.family: iFont
                font.pixelSize: iPixelSize
            }


        }
    }


    states: [
        State {
            name: "Highlighted"
            PropertyChanges { target: iconId;
                style: myIconStyle2}
        },
        State {
            name: "Normal"
            PropertyChanges { target: iconId;
                style: myIconStyle1}
        },
        State {
            name: "pressandhold"
            PropertyChanges { target: iconId;
                style:myIconStyle3}
        },
        State {
            name: "disabled"
            PropertyChanges { target: iconId;
                style:myIconStyle4}
        },
        State {
            name: "Hover"
            PropertyChanges { target: iconId;
                style:myIconStyle5}
        }
    ]
}

