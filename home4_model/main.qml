import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import QtQml.Models 2.2
import Qt.labs.folderlistmodel 2.2
import QtQuick.Controls.Styles 1.4
//import io.qt.examples.quick.controls.filesystembrowser 1.0
//import my.model 1.0

ApplicationWindow {
    id:mainWindow
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")


    menuBar: MenuBar {
        Menu {
            title: qsTr("File")
            MenuItem {
                text: qsTr("Exit")
                onTriggered: Qt.quit();
            }
        }
    }

/*
    ColumnLayout
    {
        id: mainColumn
        property real globalPadding: 10
        anchors.fill: parent
        spacing: 5

        anchors.margins: globalPadding;
*/
        Row
        {
            Layout.alignment: Qt.AlignTop
            id: rowDirectorySelection
            height: 30
            anchors.top: parent.left
            anchors.right: parent.right
            spacing: 5
            Layout.margins: 10

            Rectangle
            {
                border.color: "gray"
                border.width: 10
                anchors.fill: parent
            }


            Text
            {
                id: directoryLabel
                anchors.right: parent.left
                text:"Directory: "
                anchors.margins: globalPadding
            }
            TextField
            {              
                anchors.margins: globalPadding
                width: parent.width - (directoryLabel.width + directoryBrowseButton.width)
            }

            Button
            {
                id: directoryBrowseButton
               // anchors.right: parent.right
                text: "Browse.."
              //  anchors.margins: globalPadding

            }
            Button
            {
                id: directoryProceedButton
               // anchors.right: parent.right
                text: "Go"
              //  anchors.margins: globalPadding

            }
        }


        Row
        {
            id: mainView
            Layout.fillHeight: true
            Layout.fillWidth: true
            //  Layout.fillWidth: true
            anchors.top: rowDirectorySelection.bottom
            anchors.bottom: rowScroller.top
           // Layout.preferredHeight: 400
            //Layout.alignment: Qt.AlignVCenter
            spacing: 5
            Layout.margins: 10
            //height: 200 // - rowDirectorySelection.height - rowScroller.height

            Rectangle
            {
                id: prevButton
                color: "transparent"
                width: 30
                height: parent.height


                Image
                {
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectFit
                    source: "icon-pointer-left"

                }
            }


            Rectangle
            {
               // Layout.alignment: Qt.AlignCenter
                color: "transparent"
                border.color: "black"
                border.width: 10
                //anchors.fill: parent
                height: parent.height
               // width: mainWindow.width
                Layout.fillWidth: true



                Image
                {
                    anchors.fill: parent
                    anchors.centerIn: parent
                    id: mainImage
                    fillMode: Image.PreserveAspectFit
                    source: "testimg"
                }
            }


            Rectangle
            {

                id: nextButton
                color: "transparent"
                width: 30
                height: parent.height
                Image
                {
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectFit
                    source: "icon-pointer-right"
                }
            }



        }


        Row
        {
            id: rowScroller
            //height: 30
            anchors.bottom: mainWindow.bottom
           // anchors.top: mainView.bottom


        PathView
        {

            height: 30
            id: scroller
            z: 1
            pathItemCount: 5
            model: controller.list

            Component.onCompleted: {
                console.log("loaded");
                // controller.setDirectory("file:///media/mike/Archive/Галерея/Изображение/Art/am");
                console.log(controller.list);
                mainImage.source = scroller.childAt(0)
            }



            Binding
            {
                target: mySlider
                property: "value"
                value: scroller.currentIndex
                when: scroller.moving
            }





            path: Path
            {

                startX: 24
                startY: 53

                PathCubic {
                    x: 271.608
                    y: 57.792
                    control2Y: 57.2
                    control1Y: 71
                    control2X: 169.88
                    control1X: 106.2
                }

                PathCubic {
                    x: 599
                    y: 26
                    control2Y: 76.038
                    control1Y: 62.754
                    control2X: 482.082
                    control1X: 363.526
                }
            }

            delegate: Rectangle
            {
                id: delegateImage
                state: "normal"
            //      visible: scroller.onPath == false
             //   width: 60
             //   height: 60
             //   radius: 10
                color: "transparent"
                border.color: "gray"
                border.width: 1

                ScaleAnimator {
                    target: delegateImage;
                    from: 0.5;
                    to: 1;
                    duration: 100
                    running: true
                }

                ColumnLayout
                {
                    anchors.fill: parent

                    Image
                    {
                        id: miniature
                        anchors.fill: parent
                       // width:80
                     //   height:80

                        source:  "image://async/"+modelData
                        fillMode: Image.PreserveAspectFit
                        mipmap: true
                        smooth: false
                        state: "normal"




                        states: [
                        State
                            {
                                name: "normal"
                                when: miniatureArea.containsMouse == false
                                PropertyChanges
                                {
                                    target: delegateImage
                                    //color: "gray"
                                    //visible: false
                                   // opacity: 0
                                    width:80
                                    height:80
                                }

                            },
                        State
                            {
                                name: "hovered"
                                when:  miniatureArea.containsMouse == true
                                PropertyChanges
                                {
                                    target: delegateImage
                                   // color: "red"
                                    //visible: true;
                                   // opacity: 1
                                    width:125
                                    height:125
                                }

                            }
                        ]
                        transitions: [
                            Transition {
                                from: "hovered"
                                to: "normal"
                                NumberAnimation
                                {
                                    target: delegateImage
                                    properties: "width, height"
                                    duration: 60
                                }
                            },
                            Transition {
                                from: "normal"
                                to: "hovered"
                                NumberAnimation
                                {
                                    target: delegateImage
                                    properties:  "width, height"
                                    duration: 60
                                }

                            }
                        ]



                        MouseArea{

                           id: miniatureArea
                           anchors.fill: parent
                           hoverEnabled: true;
                           onWheel:
                                {
                                   if( wheel.angleDelta.y > 0 ) scroller.incrementCurrentIndex();
                                   else scroller.decrementCurrentIndex();
                                }
                           onClicked:
                               {
                                   mainImage.source = "file://"+modelData
                               }

                        }


                    }
                    Text
                    {
                        text: modelData
                    }
                }
            }
        }


        }
        Slider {
           // anchors.centerIn: parent
            id: mySlider

            style: SliderStyle {
                groove: Rectangle {
                    implicitWidth: 200
                    implicitHeight: 8
                    color: "gray"
                    radius: 8
                }
                handle: Rectangle {
                    anchors.centerIn: parent
                    color: control.pressed ? "white" : "lightgray"
                    border.color: "gray"
                    border.width: 2
                    implicitWidth: 20
                    implicitHeight: 20
                    radius: 20
                }
            }
            anchors.left: parent.left
            anchors.right:parent.right
            anchors.bottom: parent.bottom
            minimumValue: 0
            maximumValue: controller.getCount()
            stepSize: 1
            Binding
            {
                target: scroller
                property: "currentIndex"
                value: mySlider.value
                when: mySlider.pressed
            }

        Component.onCompleted:
        {
            console.log("COUNT:"+controller.getCount())
        }
        }




    ///////////////////////////////////}


    statusBar: StatusBar {
        RowLayout {
            anchors.fill: parent
            Label {text: mainWindow.height - rowDirectorySelection.height - rowScroller.height}
            //{ text:scroller.itemAt(1) }// { text: "Current idex: "+scroller.currentIndex+" of "+ controller.getCount() }
          //  Label { text:scroller.childAt(0) }
        }
    }




}
