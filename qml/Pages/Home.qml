import QtQuick 2.15
import QtQuick.Controls 2.15
import "../Components"
Page
{

    Rectangle
    {
        TopBar
        {
            title: Text
            {
                text:"Knight Imaage/Video Player"
                visible:true
            }
        }

        anchors.fill: parent
        color: "black"

        Text {
            id: name
            text: qsTr("Page has been loaded!")
            anchors.centerIn: parent
            anchors.horizontalCenter: parent.horizontalCenter
            color: "white"
            font.bold: true
            font.pixelSize: 14
        }
        Row
        {
            anchors.top: name.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 90
            spacing: 25
            CustomButton
            {
                id:btnShowImage
                onClicked:
                {

                    loader.push("qrc:/qml/Pages/ShowImage.qml")
                }
                text: "Show Image"

                    width: 90
                    height: 25
                    font.pixelSize: 14

            }
            CustomButton
            {
                onClicked:
                {

                    loader.push("qrc:/qml/Pages/ShowVideo.qml")
                }
                text: "Show Video"
                width: 90
                height: 25
                font.pixelSize: 14

            }
        }


    }

}
