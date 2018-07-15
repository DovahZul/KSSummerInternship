import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

Window {
    visible: true
    width: 640
    height: 480
    color: "#ffffff"
    title: qsTr("Hello World")

    ListModel
    {
        id:mymodel
        ListElement
        {
            title: "picture 1"
            image: "img1"
        }
        ListElement
        {
            title: "picture 2"
            image: "img1"
        }
        ListElement
        {
            title: "picture 2"
            image: "img1"
        }
        ListElement
        {
            title: "picture 2"
            image: "img1"
        }
    }



    PathView
    {

        id: scroller
        z: 1
        anchors.fill: parent
        pathItemCount: 3
        model: mymodel

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
            states:[
                State
                {
                    name: "selected"
                    when: scroller.isCurrentItem == delegateImage
                    PropertyChanges
                    {
                        target:delegateImage
                        height: 500
                        width: 500
                    }

                },

                State
                {
                    name: "selected"
                    when: scroller.isCurrentItem == false
                    PropertyChanges
                    {
                        target:delegateImage
                        height: 300
                        width: 300
                    }


                }

            ]
            onStateChanged:
            {
                console.log(state);

            }


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
                    source: "img1"
                    fillMode: Image.PreserveAspectFit
                }
                Text
                {
                    text: "text"
                }
            }
         }
    }



}
