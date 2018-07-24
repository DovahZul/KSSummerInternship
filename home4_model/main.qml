import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
//import my.model 1.0

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    PathView
    {

        id: scroller
        z: 1
        anchors.fill: parent
        pathItemCount: 3
        model: controller.list

        Component.onCompleted: {
            console.log("loaded");
            controller.setDirectory("file:///media/mike/Archive/Галерея/Изображение/Art/am");
            console.log(controller.list);
        }

        path: Path
        {

            startX: 45
            startY: 242

            PathCubic {
                x: 292.608
                y: 246.792
                control2Y: 246.2
                control1Y: 260
                control2X: 190.88
                control1X: 127.2
            }

            PathCubic {
                x: 620
                y: 215
                control2Y: 265.038
                control1Y: 251.754
                control2X: 503.082
                control1X: 384.526
            }
        }

        delegate: Rectangle
        {
            id: delegateImage
            state: "normal"

            width: 300
            height: 300
            ColumnLayout
            {
                anchors.fill: parent

                Image
                {
                    anchors.fill: parent
                    width:100
                    height:100
                    source: modelData
                    fillMode: Image.PreserveAspectFit
                }
                Text
                {
                    text: modelData
                }
            }
         }
    }





}
/*
    ListView {
        anchors.fill: parent
        model: controller.myModel

        move: Transition { //parallel animations by default
            NumberAnimation { properties: "x,y"; duration: 250}
            NumberAnimation { properties: "scale"; to: 1.0; duration: 250}
            NumberAnimation { properties: "opacity"; to: 1.0; duration: 250}
        }

        moveDisplaced: Transition {
            NumberAnimation { properties: "x,y"; duration: 250}
        }

        add: Transition {
            NumberAnimation { properties: "opacity"; from: 0.0; to: 1.0; duration: 500 }
            SequentialAnimation {
                NumberAnimation { properties: "scale"; from: 0.0; to: 2.0; duration: 250; easing.type: Easing.InOutQuad }
                NumberAnimation { properties: "scale"; to: 1.0; duration: 250; easing.type: Easing.InOutQuad }
            }
        }

        delegate: Rectangle {
            id: itemDelegate

            z:0
            ListView.onRemove://delegate's custom animation, before it remove
            SequentialAnimation {

                PropertyAction { target: itemDelegate; property: "ListView.delayRemove"; value: true } // don't remove item on the spot

                ParallelAnimation {
                    NumberAnimation { target: itemDelegate;  properties: "opacity"; from: 1.0; to: 0.0; duration: 500 }
                    SequentialAnimation {
                        NumberAnimation { target: itemDelegate;  properties: "scale"; from: 1.0; to: 2.0; duration: 250 }
                        NumberAnimation {  target: itemDelegate; properties: "scale"; to: 0.0; duration: 250 }
                    }
                }

                PropertyAction { target: itemDelegate; property: "ListView.delayRemove"; value: false } // ok, can remove it
            }

            anchors.left: parent.left
            anchors.right: parent.right
            height: titleLabel.implicitHeight

            gradient: Gradient {
                GradientStop {
                    position: 0.00;
                    color: "#ffffff";
                }
                GradientStop {
                    position: 0.87;
                    color: "#bdc8ec";
                }
                GradientStop {
                    position: 1.00;
                    color: "#ffffff";
                }
            }
            border.color: "grey"

            Text {
                id: titleLabel
                text: mText
                anchors.fill: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter


                Component.onCompleted: {
                    console.log("loaded");
                }
            }
        }

    }


    Timer {
        id:timer1
        interval: 1500
        repeat: true
        running: true
        onTriggered: {
            var number = Math.round(Math.random()*100);
            controller.addElement("from qml %1".arg(number));
        }
    }

    Timer {
        id:timer2
        interval: 2000
        repeat: true
        running: true
        onTriggered: {
            controller.deleteElement(Math.random()*count);
        }
    }

    Timer {
        id:timer3
        interval: 1000
        repeat: true
        running: true
        onTriggered: {
            var count = controller.myModel.rowCount();
            var from = Math.random()*count;
            var to = Math.random()*count;
            controller.moveElement(from, to);
        }
    }
}
*/
