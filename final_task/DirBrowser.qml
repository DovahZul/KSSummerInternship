import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQml.Models 2.2
import Qt.labs.folderlistmodel 2.2
import QtQuick.Controls.Styles 1.4
import QtQuick.Dialogs 1.2
//import io.qt.examples.quick.controls.filesystembrowser 1.0
//import my.model 1.0

Rectangle {
    id: mainRect
    x: 20
    y: 20
    ListView {
        y: 30
        width: parent.width
        height: parent.height - 70
        clip: true
        model: FolderListModel {
            id: folderListModel
            //showDirsFirst: true
            showDirs: true
            showFiles: false
            folder: "file:///home/mike"
            //                nameFilters: ["*.mp3", "*.flac"]
        }
        
        delegate: Button {
            id: listElement
            width: parent.width
            height: 20
            text: fileName
            onClicked: {
                if (fileIsDir) {
                    folderListModel.folder = fileURL
                }
            }
            hoverEnabled: true
            state: "normal"

            Rectangle
            {
                anchors.fill: parent
               // onHoveredChanged: hovered ? myRectId.opacity = 0 :
                //myRectId.opacity = .2;

            }



            
        }
    }

        anchors.bottom: parent.bottom
       // height: 20
        Layout.alignment: Qt.AlignCenter | Qt.AlignHCente
        Button
        {

            id: backButton

            anchors.left: parent.left
            anchors.bottom: parent.bottom
           // Layout.alignment: Qt.AlignCenter | Qt.AlignHCenter
           // anchors.leftMargin: 5
            text: "Back"
            onClicked: folderListModel.folder = folderListModel.parentFolder
            anchors.margins: 8

            background: Rectangle {
                   color: "aqua"
                   border.width: 1
                   border.color: "blue"
                   radius: 20
               }

        }
        Button
        {
            id: homeButton

            anchors.right: parent.right
            anchors.bottom: parent.bottom
            //Layout.alignment: Qt.AlignCenter | Qt.AlignHCenter
          //  anchors.leftMargin: 50
            text: "Home Folder"
            onClicked: folderListModel.folder = "file:///home/mike/"
            anchors.margins: 8

            background: Rectangle {
                   color: "aqua"
                   border.width: 1
                   border.color: "blue"
                   radius: 20
               }

        }


}
