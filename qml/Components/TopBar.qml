import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Rectangle
{
    property Text title
    width: parent.width-40
    height: 45
    color: Qt.rgba(1,1,1,0.1)
    anchors.bottom: parent.bottom
    anchors.bottomMargin: 10
    radius: 16
    anchors.horizontalCenter: parent.horizontalCenter
    Text {
        id: name
        text: title.text
        visible: title.visible
        font.pixelSize: 16
        font.bold: true
        color: "white"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }
    CustomButton
    {
        width: 90
        height: 25
        text: "Quit"
        anchors.left: parent.left
        anchors.leftMargin: 90
        anchors.verticalCenter: parent.verticalCenter
        font.pixelSize: 14
        onClicked:
        {
            Qt.quit()
        }

    }

    CustomButton
    {
        width: 90
        height: 25
        id:btnChangeWindowSize
        text: bIsFullScreen?"[NORMAL SCREEN]" :"[FULL SCREEN]"
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        anchors.rightMargin: 90
        font.pixelSize: 14
        onClicked:
        {
            if (bIsFullScreen)
            {
                bIsFullScreen=false
                showNormal()

            }else
            {
                bIsFullScreen=true
                showFullScreen()
            }


        }
    }
}
