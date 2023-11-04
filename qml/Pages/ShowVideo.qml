import QtQuick 2.15
import QtQuick.Controls 2.15

Page
{
    anchors.fill: parent

    Rectangle
    {
        TopBar
        {
            title: Text
            {
                visible:false
                text:""
            }
        }

        anchors.fill: parent
        color: "darkblue"

        Text {
            id: txt
            text: qsTr("Show Video")
            anchors.horizontalCenter: parent
            anchors.centerIn: parent
            color: "white"
        }

        CustomButton
        {
            width: 90
            height: 25
            text: "Back"
            font.pixelSize: 14
            anchors.top: txt.bottom
            anchors.topMargin: 90
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked:
            {
                loader.pop();
            }
        }
    }
}
