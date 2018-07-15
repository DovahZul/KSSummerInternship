import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2

Window
{
    visible: true
    width: 640
    height: 480

    minimumWidth: 400
    minimumHeight: 530

   // title: qsTr("Hello World")

   ColumnLayout
   {

       id: mainColumn
       property real globalPadding: 10
       property  var datalabels: ["label1","label2","label3"]


       anchors.fill: parent;
       anchors.margins: globalPadding;

       GridLayout
       {
            id: gridLayout
            Layout.fillWidth: true
            flow: GridLayout.TopToBottom
            Layout.alignment: Qt.AlignTop
            rows: mainColumn.datalabels.length

               Repeater
               {
                   model: mainColumn.datalabels
                   Text
                   {
                        text: modelData
                   }
               }

               Repeater
               {
                   id: fieldrep
                   model: mainColumn.datalabels

                   TextField
                   {
                       Layout.fillWidth: true
                       states: [
                       State
                           {
                               name: "normal"
                               when: area.containsMouse == false
                               PropertyChanges
                               {
                                   target: statusLabel
                                   color: "gray"
                                   //visible: false
                                   opacity: 0
                               }

                           },
                       State
                           {
                               name: "error"
                               when:  area.containsMouse || area.pressed
                               PropertyChanges
                               {
                                   target: statusLabel
                                   color: "red"
                                   //visible: true;
                                   opacity: 1
                               }

                           }
                       ]
                       transitions: [
                           Transition {
                               from: "error"
                               to: "normal"
                               ColorAnimation
                               {
                                   target: statusLabel
                                   properties: "color, opacity"
                                   duration: 2000
                               }
                           },
                           Transition {
                               from: "normal"
                               to: "error"
                               ColorAnimation
                               {
                                   target: statusLabel
                                   properties: "color"
                                   duration: 2000
                               }

                           }
                       ]

                       MouseArea{
                           hoverEnabled: true;
                           anchors.fill: parent
                           id: area;
                       }

                   }
               }


      }
       GroupBox
       {
           title: "Comments"
           Layout.fillHeight: true
           Layout.fillWidth: true

       TextArea
       {
           anchors.fill: parent
           wrapMode: TextArea.WrapAnywhere
           anchors.bottomMargin: 50
       }

       }
       Text
       {
           id: statusLabel
           state: "normal"
           text: "Сообщение об ошибке"
           anchors.bottom: parent.bottom
       }

       Button
       {
           anchors.right: parent.right
           anchors.bottom: parent.bottom
           width: 60
           height: 30
           text: "Save"
           onClicked: {
               for(var i=0;i<fieldrep; i++)
               {
                   var item = fieldrep.itemAt(i)

               }
           }
       }



   }



    /*
   Rectangle {
       id:root
       state: "normal"
       color: "green"
       anchors.bottom: parent.bottom

       height: 100
       width: 100

       TextField {
           property color borderColor: "silver"
           id:rectangleTwo
           anchors.fill: parent
           anchors.margins: 30
           color: "white"
          // border.color: borderColor
       }

       states: [
           State {
               when: area.containsMouse
               name: "hot"
               PropertyChanges {
                   target: root
                   color: "#b31515"
                   borderColor: "red"
               }
           },
           State {
               name: "normal"
               when: area.containsMouse == false
               PropertyChanges {
                   target: root
                   color: "#c5dffa"
                   borderColor: "silver"


               }
           }
       ]

       transitions: Transition {
           from: "hot"
           to: "normal"

           ColorAnimation {

               targets: [rectangleTwo]
               properties: "color, borderColor"
               duration: 1000
           }

       }

       MouseArea {
           id: area

           hoverEnabled: true
           anchors.fill: parent
       }

   }
*/
}
