import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import QtQml.Models 2.2
import Qt.labs.folderlistmodel 2.2
import QtQuick.Controls.Styles 1.4
import QtQuick.Dialogs 1.2
//import io.qt.examples.quick.controls.filesystembrowser 1.0
//import my.model 1.0

ApplicationWindow {
    id:mainWindow
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

property real globalPadding: 10

    Component.onCompleted:
    {
        textFieldDirectory.text = controller.getDirectoryPath()
    }

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
    RowLayout
    {
        anchors.fill: parent
        spacing: 20


*/

        /*
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        height: parent.height/2
        */




    ColumnLayout
    {
        id: mainColumn

        anchors.fill: parent


       // anchors.left: parent.left
       // anchors.top: parent.top
       // anchors.bottom: parent.bottom
       // anchors.right: fsBrowser.left

        height: parent.height/2



        spacing: 20

        anchors.margins: globalPadding;

        RowLayout
        {
            id: rowDirectorySelection
            height: 30
           // width: parent.width
            anchors.left: parent.left
            anchors.right: parent.right
            spacing: 10
            //Layout.margins: 10
/*
            Rectangle
            {
                border.color: "gray"
                border.width: 10
                anchors.fill: parent
            }
*/

            Text
            {
                id: directoryLabel
              //  anchors.right: parent.left
                text:"Directory: "
                anchors.margins: globalPadding
            }
            TextField
            {
                id: textFieldDirectory

                anchors.margins: globalPadding
                width: parent.width - (directoryLabel.width + directoryBrowseButton.width)
                Layout.fillWidth: true


            }

            Button
            {
                id: directoryBrowseButton
               // anchors.right: parent.right
                text: "Browse.."
              //  anchors.margins: globalPadding
                onClicked:
                {
                    fileDialog.open();
                }


            }


            FileDialog {
                 id: fileDialog
                 title: "Please choose a Path to Source"
                 folder: shortcuts.home
                 selectFolder: true
                 onAccepted:
                 {
                     /*
                     console.log("Accepted: " + fileDialog.fileUrls);
                     for (var i = 0; i < fileDialog.fileUrls.length; ++i)
                         textFieldDirectory.text = fileDialog.folder.replace(/^(file:\/{3})/,"");
                         */
                      var path = fileDialog.fileUrl.toString();
                      // remove prefixed "file:///"
                      path = path.replace(/^(file:\/{2})/,"");
                      // unescape html codes like '%23' for '#'
                      textFieldDirectory.text = path + "/" //decodeURIComponent(path);
                      controller.setDirectoryPath(textFieldDirectory.text)
                      console.log(textFieldDirectory.text)
                      mainImage.source = "file://"+controller.itemAt(0)

                 }
             }

            Button
            {
                id: directoryProceedButton
               // anchors.right: parent.right
                text: "Go"
              //  anchors.margins: globalPadding
                onClicked:
                {
                    controller.setDirectoryPath(textFieldDirectory.text)
                    console.log(textFieldDirectory.text)
                    mainImage.source = "file://"+controller.itemAt(0)
                   // scroller.model = controller.list
                }

            }
        }


        RowLayout
        {
            id: mainView
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignVCenter
            //  Layout.fillWidth: true
            anchors.top: rowDirectorySelection.bottom
            anchors.bottom: rowScroller.top
            anchors.margins: globalPadding;
            spacing: 5
            Layout.margins: 10
            //height: 200 // - rowDirectorySelection.height - rowScroller.height

            Rectangle
            {

                MouseArea
                {
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked:
                    {
                        scroller.decrementCurrentIndex()
                        mainImage.source = "file://"+controller.itemAt(scroller.currentIndex)
                    }
                }
                id: prevButton

                state: "normal"
                color: "transparent"
                Layout.fillHeight: true
                width: 30
                height: parent.height
                //Layout.fillWidth: true
                Image
                {
                    anchors.fill: parent
                    anchors.centerIn: parent
                    fillMode: Image.PreserveAspectFit
                    source: "icon-pointer-left"
                }
            }

            Rectangle
            {
               // Layout.alignment: Qt.AlignCenter
                color: "transparent"
                Layout.fillHeight: true
                antialiasing: false

              //  border.color: "black"
                //border.width: 10

                anchors.fill: parent
                height: parent.height
               // width: mainWindow.width
                Layout.fillWidth: true
                width: parent.width - 70
                Layout.margins: globalPadding



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

                MouseArea
                {

                    id: nextButtonArea
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked:
                    {
                        scroller.incrementCurrentIndex()
                        mainImage.source = "file://"+controller.itemAt(scroller.currentIndex)
                    }
                }
                id: nextButton
                color: "transparent"
                Layout.fillHeight: true
               // Layout.fillWidth: true
                width: 30
                height: parent.height
                Image
                {
                    anchors.fill: parent
                    anchors.centerIn: parent
                    fillMode: Image.PreserveAspectFit
                    source: "icon-pointer-right"
                }

/*
                states: [
                State
                    {
                        name: "normal"
                        when: nextButtonArea.containsMouse == false
                        PropertyChanges
                        {
                            target: nextButton
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
                        when:  nextButtonArea.containsMouse == true
                        PropertyChanges
                        {
                            target: nextButton
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
                            target: nextButton
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
*/



            }



        }


        RowLayout
        {
            id: rowScroller
            //height: 30
            anchors.bottom: mySlider.top
            anchors.left: parent.left
            anchors.right: parent.right
           // anchors.top: mainView.bottom
            Layout.margins: globalPadding


        PathView
        {
            anchors.fill: parent
            width: parent.width
            height: 30
            Layout.fillHeight: true
            Layout.fillWidth: true
            highlightRangeMode: PathView.ApplyRange
            id: scroller
            z: 1
            pathItemCount: 7
            model: controller.list

            Component.onCompleted: {

                console.log("loaded");
                // controller.setDirectory("file:///media/mike/Archive/Галерея/Изображение/Art/am");
                console.log(controller.list);
                mainImage.source = "file://"+controller.itemAt(0)
            }



            Binding
            {
                target: mySlider
                property: "value"
                value: scroller.currentIndex
                when: true//scroller.moving || mySlider.pressed
            }

            Binding
            {
                target: scroller
                property: "currentIndex"
                value: Slider.value
              //  when: mySlider.onWheel

            }





            path: Path
            {

                startX: 12
                startY: 31

                PathCubic {
                    x: 259.608
                    y: 35.792
                    control2Y: 35.2
                    control1Y: 49
                    control2X: 157.88
                    control1X: 94.2
                }

                PathCubic {
                    x: 608
                    y: 25
                    control2Y: 60.038
                    control1Y: 40.754
                    control2X: 479.082
                    control1X: 351.526
                }


            }
            MouseArea{

               id: scrollerarea
               anchors.fill: parent
              // hoverEnabled: true;
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
                    duration: 150
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
        Slider
        {
            id: mySlider
            wheelEnabled: false
            anchors.left: parent.left
            anchors.right:parent.right
            anchors.bottom: parent.bottom
            minimumValue: 0
            maximumValue: controller.getCount()
            stepSize: 1



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
            /*
            MouseArea
            {
                id: sliderArea
                anchors.fill: parent
                hoverEnabled: true

            }*/

            Binding
            {
                target: scroller
                property: "currentIndex"
                value: mySlider.value
                when: mySlider.pressed //|| sliderArea.containsMouse
            }

        Component.onCompleted:
        {
            console.log("COUNT:"+controller.getCount())
        }
        }




    }


/*
    DirBrowser {
        id: fsBrowser
        border.color: "black"
        //height: 450
        radius: 30
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
      //  anchors.left: mainColumn.right
       // height: parent.height/2
        width:parent.width/4
        anchors.margins: 10

    }

*/

    ///END
   // }


    statusBar: StatusBar {
        RowLayout {
            anchors.fill: parent
            Label  { text: "Current idex: "+scroller.currentIndex+" of "+ controller.getCount() }
            //{ text:scroller.itemAt(1) }// { text: "Current idex: "+scroller.currentIndex+" of "+ controller.getCount() }
          //  Label { text:scroller.childAt(0) }
        }
    }




}
