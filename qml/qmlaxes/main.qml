/****************************************************************************
**
** Autor: Tata Elxsi ltd, Bengaluru
**
****************************************************************************/
import QtQuick 2.0

import QtQuick 2.8
import QtQuick.Window 2.2
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import QtQuick.XmlListModel 2.0

//import BackendNumericsData 1.0
import com.example.data 1.0

Item {
    width: 640
    height: 530

//    Loader{
//        id: rectgrouploader
//        // item: mainwin
//        width: parent.width
//        height: parent.height * 0.2
//        anchors.bottom: parent.bottom
//        focus: true

//    }

    //    BackendNumericsData {
    //        id: numericsData
    //    }
    Data {
        id: data
    }

    //Vent Button XML Model
    XmlListModel {
        id: xmlModel
        source: "qrc:///qml/qmlaxes/styling.xml"
        query: "/styleQml/ventButtonStyle/ventButton"

        XmlRole { name: "ventId1"; query: "ventId/string()" }

        XmlRole {
            name: "ventWidth"
            query: "ventWidth/number()"
        }
        XmlRole {
            name: "ventHeight"
            query: "ventHeight/number()"
        }
        XmlRole {
            name: "ventColor"
            query: "ventColor/string()"
        }
        XmlRole {
            name: "ventMode"
            query: "ventMode/string()"
        }
        XmlRole {
            name: "valueToBeChanged"
            query: "valueToBeChanged/string()"
        }
        XmlRole {
            name: "unitLable"
            query: "unitLable/string()"
        }
        XmlRole {
            name: "fontFamily"
            query: "fontFamily/string()"
        } //-----
        XmlRole {
            name: "ventBorderColor"
            query: "ventBorderColor/string()"
        } //-----
        XmlRole {
            name: "ventBorderWidth"
            query: "ventBorderWidth/number()"
        } //-----
        XmlRole {
            name: "ventBorderRadius"
            query: "ventBorderRadius/number()"
        } //-----

//        onStatusChanged:{ if(status === XmlListModel.Ready, progress === 1.0){
//                console.log("xml loaded")
//                rectgrouploader.source = "RectGroup.qml"

//            }
//        }
    }

    //Icon Button XML Model
    XmlListModel {
        id: iconxmlModel
        source: "qrc:///qml/qmlaxes/styling.xml"
        query: "/styleQml/iconButtonStyle/iconButton"

        XmlRole {
            name: "iconId"
            query: "iconId/string()"
        }
        XmlRole {
            name: "iconstate"
            query: "state/string()"
        }
        XmlRole {
            name: "iconColor"
            query: "iconColor/string()"
        }
        XmlRole {
            name: "iconText"
            query: "iconText/string()"
        }
        XmlRole {
            name: "Source"
            query: "Source/string()"
        }
        XmlRole {
            name: "iconBorderRadius"
            query: "iconBorderRadius/number()"
        }
        XmlRole {
            name: "iconOpacity"
            query: "iconOpacity/string()"
        }
        XmlRole {
            name: "shadowColor"
            query: "shadowColor/string()"
        }
        XmlRole {
            name: "shadowOffsetHorizontal"
            query: "shadowOffsetHorizontal/number()"
        }
        XmlRole {
            name: "shadowOffsetVertical"
            query: "shadowOffsetVertical/number()"
        }
        XmlRole {
            name: "iconFontColor"
            query: "iconFontColor/string()"
        }
        XmlRole {
            name: "iconFont"
            query: "iconFont/number()"
        }
        XmlRole {
            name: "iconPixelSize"
            query: "iconPixelSize/number()"
        }
    }

    //Numerics XML Model
    XmlListModel {
        id: numericxmlModel
        source: "qrc:///qml/qmlaxes/styling.xml"
        query: "/styleQml/numericStyling/numericStyle"

        XmlRole {
            name: "backgroundColor"
            query: "backgroundColor/string()"
        }
        XmlRole {
            name: "borderColor"
            query: "borderColor/string()"
        }
        XmlRole {
            name: "borderWidth"
            query: "borderWidth/number()"
        }
        XmlRole {
            name: "fontColor"
            query: "fontColor/string()"
        }
        XmlRole {
            name: "fontPixelSize1"
            query: "fontPixelSize1/number()"
        }
        XmlRole {
            name: "fontPixelSize2"
            query: "fontPixelSize2/number()"
        }
        XmlRole {
            name: "label1"
            query: "label1/string()"
        }
        XmlRole {
            name: "label2"
            query: "label2/string()"
        }
        XmlRole {
            name: "label3"
            query: "label3/string()"
        }
        XmlRole {
            name: "label4"
            query: "label4/string()"
        }
        XmlRole {
            name: "label5"
            query: "label5/string()"
        }
        XmlRole {
            name: "label6"
            query: "label6/string()"
        }
        XmlRole {
            name: "label7"
            query: "label7/string()"
        }
        XmlRole {
            name: "label8"
            query: "label8/string()"
        }
    }

    Column {
        id: col1
        width: parent.width
        height: parent.height

        //spacing: 4
        Row {
            id: row1
            width: parent.width
            height: parent.height * 0.8
            //spacing: 5
            Rectangle {
                id: chartrect
                width: parent.width * 0.6
                height: parent.height
                color: "black"

                ListView {
                    id: root
                    focus: true
                    width: parent.width
                    height: parent.height

                    ColorAnimation {
                        from: "black"
                        to: "black"
                        duration: 200
                    }
                    snapMode: ListView.SnapOneItem
                    highlightRangeMode: ListView.StrictlyEnforceRange
                    highlightMoveDuration: 250
                    orientation: ListView.Horizontal
                    boundsBehavior: Flickable.StopAtBounds

                    model: ListModel {
                        ListElement {
                            component: "Charts.qml"
                        }
                    }

                    delegate: Loader {
                        width: /*280*/ root.width
                        height: /*480*/ root.height
                        source: component
                        asynchronous: true
                        //onLoaded: sourceLoaded = true
                    }
                }
            }
            Rectangle {
                id: slider
                height: parent.height
                color: "black"

                Flow {
                    id: flow1
                    anchors.fill: parent
                    topPadding: 10
                    Repeater {
                        id: repeaterNumeric
                        model: numericxmlModel
                        function setValue(index) {
                            if (index === 0) {
                                if (data.cm2H < 10 || data.cm2H > 50) {
                                    repeaterNumeric.itemAt(0).nFontColor = "red"
                                } else {
                                    repeaterNumeric.itemAt(
                                                0).nFontColor = "yellow"
                                }
                                return data.cm2H
                            } else if (index === 1) {
                                if (data.mv < 1 || data.mv > 10) {
                                    repeaterNumeric.itemAt(1).nFontColor = "red"
                                } else {
                                    repeaterNumeric.itemAt(
                                                1).nFontColor = "green"
                                }
                                return data.mv
                            } else if (index === 2) {
                                if (data.o2 < 10 || data.o2 > 50) {
                                    repeaterNumeric.itemAt(2).nFontColor = "red"
                                } else {
                                    repeaterNumeric.itemAt(
                                                2).nFontColor = "white"
                                }
                                return data.o2
                            }
                        }

                        Numerics {
                            id: numerics1
                            width: parent.width
                            height: parent.height * 0.32
                            nFontColor: fontColor
                            nBackgroundColor: backgroundColor
                            nBorderColor: borderColor
                            nBorderWidth: borderWidth
                            nFontPixelSize1: fontPixelSize1
                            nFontPixelSize2: fontPixelSize2
                            nLabel1: label1
                            nLabel2: label2
                            nLabel3: label3
                            nLabel4: repeaterNumeric.setValue(index)
                            nLabel5: label5
                            nLabel6: label6
                            nLabel7: label7
                            nLabel8: label8
                        }
                    }
                }

                Timer {
                    id: textTimer
                    interval: 1000
                    repeat: true
                    running: true
                    triggeredOnStart: true
                    onTriggered: data.start()
                }
                state: "close"
                states: [
                    State {
                        name: "close"
                        PropertyChanges {
                            target: slider
                            width: parent.width * 0.2
                        }
                    },
                    State {
                        name: "open"
                        PropertyChanges {
                            target: slider
                            width: parent.width * 0.8
                        }
                        PropertyChanges {
                            target: chartrect
                            width: parent.width * 0
                        }
                        PropertyChanges {
                            target: repeaterNumeric.itemAt(0)
                            width: (parent.width / 2) * 0.9
                            height: (parent.height / 2) * 0.9
                        }
                        PropertyChanges {
                            target: repeaterNumeric.itemAt(1)
                            width: (parent.width / 2) * 0.9
                            height: (parent.height / 2) * 0.9
                        }
                        PropertyChanges {
                            target: repeaterNumeric.itemAt(2)
                            width: (parent.width / 2) * 0.9
                            height: (parent.height / 2) * 0.9
                        }
                        PropertyChanges {
                            target: flow1
                            leftPadding: 20
                            rightPadding: 10
                            spacing: 10
                        }
                    }
                ]
                transitions: [
                    Transition {
                        NumberAnimation {
                            target: slider
                            property: "width"
                            duration: 500
                            easing.type: Easing.InOutBack
                        }
                        NumberAnimation {
                            target: chartrect
                            property: "width"
                            duration: 500
                            easing.type: Easing.InOutBack
                        }
                        NumberAnimation {
                            target: repeaterNumeric.itemAt(0)
                            property: "width"
                            duration: 500
                            easing.type: Easing.InOutBack
                        }
                        NumberAnimation {
                            target: repeaterNumeric.itemAt(1)
                            property: "width"
                            duration: 500
                            easing.type: Easing.InOutBack
                        }
                        NumberAnimation {
                            target: repeaterNumeric.itemAt(2)
                            property: "width"
                            duration: 500
                            easing.type: Easing.InOutBack
                        }
                        NumberAnimation {
                            target: repeaterNumeric.itemAt(0)
                            property: "height"
                            duration: 500
                            easing.type: Easing.InOutBack
                        }
                        NumberAnimation {
                            target: repeaterNumeric.itemAt(1)
                            property: "height"
                            duration: 500
                            easing.type: Easing.InOutBack
                        }
                        NumberAnimation {
                            target: repeaterNumeric.itemAt(2)
                            property: "height"
                            duration: 500
                            easing.type: Easing.InOutBack
                        }
                    }
                ]
                MouseArea {

                    id: mouseArea
                    anchors.fill: parent
                    onClicked: {
                        if (slider.state == "close") {
                            slider.state = "open"
                            slider.border.width = 2
                            slider.border.color = "gray"
                            repeaterNumeric.itemAt(0).nFontPixelSize2 = 70
                            repeaterNumeric.itemAt(1).nFontPixelSize2 = 70
                            repeaterNumeric.itemAt(2).nFontPixelSize2 = 70
                        } else {
                            slider.state = "close"
                            slider.border.width = 0
                            slider.border.color = "gray"
                            repeaterNumeric.itemAt(0).nFontPixelSize2 = 30
                            repeaterNumeric.itemAt(1).nFontPixelSize2 = 30
                            repeaterNumeric.itemAt(2).nFontPixelSize2 = 30
                        }
                    }
                }
            }
            Rectangle {
                id: iconrect
                width: parent.width * 0.2 //occupy 20% of full window space
                height: parent.height
                color: "black"

                Column {
                    spacing: 3
                    topPadding: 10
                    width: parent.width
                    height: parent.height
                    leftPadding: 5
                    rightPadding: 5
                    anchors.fill: parent
                    Repeater {
                        id: iconrepeater
                        property int i
                        model: iconxmlModel
                        function listProperty(item) {
                            for (var p in item)
                                console.log(p + ": " + item[p])
                        }

                        function resetButton(index) {
                            if (iconrepeater.itemAt(
                                        index).state !== "disabled") {
                                for (i = 0; i < iconrepeater.count; i++) {

                                    if (iconrepeater.itemAt(
                                                i).state !== "disabled"
                                            && i !== index) {
                                        iconrepeater.itemAt(i).state = "Normal"
                                        iconrepeater.itemAt(i).selected = false
                                    }
                                }
                            }
                        }

                        IconButton {
                            iconid: iconId
                            iconW: parent.width * 0.9 //90% of the parent layout
                            iconH: parent.height / 6.4 //6 icon buttons + 0.4 spacing
                            iSource: Source
                            iText: iconText

                            iColor: iconColor
                            iBorderRadius: iconBorderRadius
                            iOpacity: iconOpacity
                            iShadowColor: shadowColor
                            iShadowOffsetHorizontal: shadowOffsetHorizontal
                            iShadowOffsetVertical: shadowOffsetVertical
                            iFontColor: iconFontColor
                            iFont: iconFont
                            iPixelSize: iconPixelSize
                            state: iconstate
                            selected: false

                            MouseArea {
                                id: iconarea
                                anchors.fill: parent
                                hoverEnabled: true
                                onEntered: {
                                    parent.state = (parent.state
                                                    == "Normal" ? "Hover" : parent.state)
                                }
                                onExited: {
                                    parent.state = (parent.state
                                                    == "Hover" ? "Normal" : parent.state)
                                }

                                onClicked: {
                                    parent.state = (parent.state
                                                    == "Hover" ? "Highlighted" : parent.state)
                                    parent.selected = true
                                    iconrepeater.resetButton(index)
                                }
                                onPressAndHold: {
                                    if (parent.selected
                                            && parent.state != "disabled") {
                                        parent.state = "pressandhold"
                                    }
                                    parent.state = (parent.state
                                                    == "Hover" ? "pressandhold" : parent.state)
                                }
                                onReleased: {
                                    if (parent.selected
                                            && parent.state != "disabled") {
                                        parent.state = "Highlighted"
                                    }
                                    console.log(parent.enabled)
                                    parent.state = (parent.state
                                                    == "pressandhold" ? "Normal" : parent.state)
                                }
                            }
                        }
                    }
                }
            }
        }

        RectGroup{
            id:rctgrp
            width: parent.width
            height: parent.height * 0.2 //occupy 20% of full window space
            anchors.bottom: parent.bottom

        }

    }
}
