import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    visible: true
    width: 600
    height: 400
    title: qsTr("Hello World")
   // color: "green"

    Rectangle
    {
      id: name1
      anchors.left: parent.left
      width: 100
      height: 500//parent.height/2
      color: "red"
      MouseArea{
                     anchors.fill: parent
                     hoverEnabled: true
                     onPressed:  parent.color = "green";
                     onReleased: parent.color = "red";
               }

    }

    Rectangle
    {
      id: name2
      anchors.left: name1.right
      anchors.right: parent.right
      width: parent.width/3
      height: 500// parent.height/2
      color: "#00000000"
      MouseArea{
                     id:ma1
                     anchors.fill: parent
                     hoverEnabled: true
                     onClicked:
                     {
                         if(parent.color=="#00000000")
                         parent.color = "blue";
                         else
                         parent.color = "#00000000"
                     }
                    // onReleased: parent.color = "blue";
                   // parent.color:  onClicked:
               }

    }
    Rectangle
    {
      id: name3
      anchors.left: parent.left
      anchors.right: parent.right
      anchors.bottom: parent.bottom
     // anchors.top: name1.bottom
      width: parent.width
      height: 100
      color: "gray"
      MouseArea{
                     anchors.fill: parent
                     hoverEnabled: true
                     onPressed:  parent.color = "blue";
                     onReleased: parent.color = "gray";
               }

    }


}
