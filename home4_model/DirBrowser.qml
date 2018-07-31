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

Rectangle {
    id: mainRect
    x: 20
    y: 20
    ListView {
        y: 30
        width: parent.width
        height: parent.height - 60
        clip: true
        model: FolderListModel {
            id: folderListModel
            showDirsFirst: true
            //                nameFilters: ["*.mp3", "*.flac"]
        }
        
        delegate: Button {
            width: parent.width
            height: 50
            text: fileName
            onClicked: {
                if (fileIsDir) {
                    folderListModel.folder = fileURL
                }
            }
            
        }
    }
    
    Button {
        anchors.left: mainRect.right
        anchors.leftMargin: 5
        text: "back"
        onClicked: folderListModel.folder = folderListModel.parentFolder
        
    }
}
