import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts
import com.player.im 1.0
import QtQuick.Dialogs
import "../Components"
Page
{
        anchors.fill: parent


    Rectangle
    {
        anchors.centerIn: parent
        color: "black"
        anchors.fill: parent

//        Image {
//            id: picture
//            anchors.fill: parent
//            fillMode: Image.PreserveAspectFit

//        }
        ImageManager
        {
            id:imageManager
            anchors.fill: parent
            visible: false

        }
        TopBar
        {
            id:bottomBar
        }

        Row
        {
            anchors.top: bottomBar.top
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: -5
            Component.onCompleted:
            {
                imageManager.setWidthHeight(window.width,window.height)
            }

            spacing: 10
            padding: 15
            CustomButton
            {
                width: 90
                height: 25
                text: "Back"
                font.pixelSize: 14
                onClicked:
                {
                    loader.pop();
                }
            }

            CustomButton
            {
                width: 90
                height: 25
                text: "Open Image"
                font.pixelSize: 14
                onClicked:
                {
                    imageDialog.open()
                }
            }

            FileDialog
            {
                id:imageDialog
                title: "select Image"
                currentFolder:shortcuts.pictures
                onAccepted: {
                            print(imageDialog.selectedFile.toString())
                     imageManager.OpenImage(imageDialog.selectedFile.toString())
//                    picture.visible=false
                    imageManager.visible=true

                }
            }

        }

    }
}

