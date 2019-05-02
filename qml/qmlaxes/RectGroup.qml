import QtQuick 2.0
import QtQuick.Layouts 1.11
Item{

    //property int stepSize: 0



    Rectangle{
        width: parent.width
        height: parent.height
        color: "lightgray"
        Row{
            id: mainrow
            width: parent.width
            height: parent.height
            spacing: 1







            function moveRight(index){
                var length = rep.count
                console.log("length: "+length+" index: "+index)

                //                if(index === length-1){

                //                    rep.itemAt(0).focus = true

                //                } else if(index === 0){

                //                    rep.itemAt(index + 1).focus = true

                //                }else if(index > 0 && index < length){

                //                    rep.itemAt(index + 1).focus = true

                //                }
                if(rep.itemAt((index + 1)%length).state !== "disabled"){


                    rep.itemAt((index + 1)%length).focus = true} else {
                    console.log("disabled index :" + (index + 1)%length + "move to : "+ (index + 2)%length);
                    rep.itemAt((index + 2)%length).focus = true
                }
            }
            function moveLeft(index){
                var length = rep.count
                console.log("length: "+length+" index: "+index)
                //                if(index === length-1){

                //                    rep.itemAt(index - 1).focus = true

                //                } else if(index === 0){

                //                    rep.itemAt(length-1).focus = true

                //                }else if(index > 0 && index < length){

                //                    rep.itemAt(index - 1).focus = true

                //                }
                console.log("left mod result: " + (((index - 1)%length) + length)%length)
                if(rep.itemAt((((index - 1)%length) + length)%length).state !== "disabled"){
                    rep.itemAt((((index - 1)%length) + length)%length).focus = true
                } else {
                    console.log("disabled index :" + (((index - 1)%length) + length)%length + "move to : "+ (((index - 2)%length) + length)%length);
                    rep.itemAt((((index - 2)%length) + length)%length).focus = true
                }
            }

            function incrementTV(value){
                if (value >=20 && value <100) {
                    //stepSize = 5;
                    value += 5;
                } else if (value >=100 && value <300) {
                    //stepSize = 10;
                    value += 10;
                } else if (value >=300 && value <1000) {
                    //stepSize = 25;
                    value += 25;
                } else if (value >=1000 && value <1500){
                    //stepSize = 50;
                    value += 50;
                }
                return value;
            }

            function incrementRR(value){
                if (value >=4 && value <99) {
                    //stepSize = 5;
                    value += 1;
                }
                return value;
            }

            function decrementTV(value){
                if (value >20 && value <100) {
                    //stepSize = 5;
                    value -= 5;
                } else if (value >=100 && value <300) {
                    //stepSize = 10;
                    value -= 10;
                } else if (value >=300 && value <1000) {
                    //stepSize = 25;
                    value -= 25;
                } else if (value >=1000 && value <=1500){
                    //stepSize = 50;
                    value -= 50;
                }
                return value;
            }

            function decrementRR(value){
                if (value >4 && value <=99) {
                    //stepSize = 5;
                    value -= 1;
                }
                return value;
            }


            Repeater{
                id: rep
                model: xmlModel


                delegate: Rect{


                    objectName: ventId1

                    //index : mainrow.itemIndex(objectName)
                    width: (objectName === "vent1")? parent.width * 0.2 - 10 : 100;
                    height: (objectName === "vent1")?parent.height/3 : 100;
                    //        anchors.bottom: parent.bottom
                    //        anchors.bottomMargin: 5
                    //Layout.alignment: Qt.AlignBottom
                    Layout.margins: (objectName === "vent1")? 5: 0;
                    //Layout.bottomMargin: 5
                    //Layout.bottom: parent.bottom
                    Layout.bottomMargin: (objectName === "vent1")? 10: 0;
                    state: (objectName === "vent4")? "disabled": "normal"
                    //focus: true
                    property int index1: index
                    color: "grey"
                    mode: ventMode
                    valueToChange: valueToBeChanged
                    unit: unitLable
                    vBColor:ventBorderColor
                    vBWidth: ventBorderWidth
                    vBRadius: ventBorderRadius
                    fFam: fontFamily

                    border.color: focus? "orange":"transparent"
                    border.width: 2
                    focus: objectName === 'vent1'? true: false
                    //KeyNavigation.right: mainrow.moveRight(index1);
                    Component.onCompleted: console.log("rep index: "+ index)
                    focusRectVisible: false
                    Keys.onPressed: {
                        console.log("key pressed" + index)


                        if(event.key == Qt.Key_Enter){
                            console.log("Enter pressed" + index)
                        }

                        else if(event.key == Qt.Key_Return ){
                             console.log("Return pressed" + index)
                            if(index == 1 || index == 2)
                            {
                                //vtColor= focus? "orange":"black"
                                rep.itemAt(index).focusRectVisible = rep.itemAt(index).focusRectVisible? false: true
                            }
//                            if(index == 2)
//                            {
//                                vtColor= focus? "orange":"black"
//                                textFocus = (textFocus = true)? false: true
//                            }
                        }

                        else if(event.key == Qt.Key_Right){
                            console.log("Right pressed" + index)
                            mainrow.moveRight(index)
                        }
                        else if(event.key == Qt.Key_Left){
                            console.log("Left pressed" + index)
                            mainrow.moveLeft(index)
                        }
                        else if(event.key == Qt.Key_Down){

                            console.log("Down pressed" + index)
                            if(index == 1)
                            {
                                var val = mainrow.decrementTV(parseInt(rep.itemAt(1).valueToChange));
                                rep.itemAt(1).valueToChange = val
                            }
                            else if(index == 2)
                            {
                                rep.itemAt(2).valueToChange = mainrow.decrementRR(parseInt(rep.itemAt(2).valueToChange));
                            }}
                        else if(event.key == Qt.Key_Up){
                            //mainrow.moveLeft(index)

                            console.log("Up pressed" + index)
                            if(index == 1)
                            {
                                var val = mainrow.incrementTV(parseInt(rep.itemAt(1).valueToChange));
                                rep.itemAt(1).valueToChange = val


                                //var val = parseInt(rep.itemAt(1).valueToChange);
                                console.log("value"+val);
                            }
                            else if(index == 2)
                            {
                                rep.itemAt(2).valueToChange = mainrow.incrementRR(parseInt(rep.itemAt(2).valueToChange));
                            }
                        }




                    }







                }




            }
        }
    }
}
