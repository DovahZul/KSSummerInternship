import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Qt.labs.folderlistmodel 2.2

Window {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("HW")


    FolderListModel {
        id: folderModel

        showDirs: false
        nameFilters: ["*.*"]
        objectName: "folderDirModel"
        sortField: FolderListModel.Name
        folder: "file:///media/mike/Archive/Галерея/Изображение/Art/am/"
    }
    ColumnLayout
    {
        spacing: 30
        anchors.fill:parent
        property real globalPadding: 10
        /*
        TextField
        {
            anchors.margins: globalPadding
        }
*/
        PathView
        {
            height: parent.height/3
            model: folderModel
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            pathItemCount: 3

            path: Path
            {

                startX: 44
                startY: 18

                PathCubic {
                    x: 625
                    y: 24
                    control2Y: -35.9
                    control1Y: 104.9
                    control2X: 450.4
                    control1X: 188.6
                }
            }

            delegate: Rectangle
            {
               // border.color: "black"
                height: 200
                width: 200
                ColumnLayout
                {
                    spacing: 15
                    anchors.fill: parent
                    Image
                    {
                        anchors.fill: parent
                        anchors.bottomMargin: 20

                        width:50
                        height:50
                        mipmap: true
                        cache: true
                        fillMode: Image.PreserveAspectFit
                        source: folderModel.folder + "/" + fileName
                    }
                    Text
                    {
                       // Layout.alignment: Qt.AlignCenter
                        anchors.bottom: parent.bottom
                        anchors.left: parent.left
                        anchors.right: parent.right
                        horizontalAlignment: Qt.AlignCenter

                        id: titleText
                        text: fileName
                    }
                }
            }

        }
    }


 }



