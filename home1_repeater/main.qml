import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 1.4

Window {
    visible: true
    width: 640
    height: 530

  //  maximumWidth: 800
  //  maximumHeight: 530

  //  minimumWidth: 400
  //  minimumHeight: 530

    title: qsTr("Hello World")
    Column
    {
        spacing: 10//height/fieldsKeeper.count/2
        anchors.fill: parent
        anchors.topMargin: 50
        anchors.bottomMargin: 35
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        bottomPadding: 10

        Repeater
        {
            id: fields
            model: ["Title:", "Type:", "Authors:","asd","qwe"]


            TextField
            {

                id: texts
                height: 40

                anchors.left: parent.left
                anchors.right: parent.right
                anchors.leftMargin: labels.width

                Text
                {
                    width: 65
                    height: 40
                    id:labels
                    text: qsTr(modelData)
                    anchors.right: parent.left
                   // anchors.horizontalCenter: parent.horizontalCenter
                   // anchors.top: parent.top+100
                    verticalAlignment: Text.AlignVCenter


                }

            }

        }

        Text
        {
            id: textAreaLabel
            text: qsTr("Comments:")
            anchors.left: parent.left
           // anchors.horizontalCenter: parent.horizontalCenter

        }
        TextArea
        {
            //anchors.fill: parent
            anchors.left: parent.left
            anchors.right: parent.right
           // anchors.bottom: parent.bottom
           // anchors.bottom: parent.bottom
            //anchors.top: textAreaLabel.bottom
           // height: parent.height/2

        }

        Button
        {
            anchors.right: parent.right
         //   anchors.bottom: parent.bottom
          //  anchors.bottomMargin: 10
            width: 60
            height: 30
            text: "Save"

        }

    }


}
