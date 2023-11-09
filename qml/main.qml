import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import Qt.labs.platform 1.1
Window {
    id:window
    property bool bIsFullScreen:false
    width: 1024
    height: 720
    visible: true
    title: qsTr("Knight")

    flags: "FramelessWindowHint"

    SystemTrayIcon
    {

        visible: true
        icon.source:"qrc:/res/icon.ico"
        tooltip:
        {
            text: "Knight Player"
        }

        menu: Menu
        {
            MenuItem
            {
                text:"Quit"
                onTriggered: Qt.quit()
            }
        }

        onActivated:
        {
            if(SystemTrayIcon.DoubleClick)
            {
                window.showFullScreen()
                bIsFullScreen:true
            }

            window.show()
            window.raise()
        }

        Component.onCompleted:
        {
            show()
            showMessage("Knight Player","App is running in background",)
        }
    }

    StackView
    {
        id:loader
        anchors.fill: parent
        initialItem: "qrc:/qml/Pages/Home.qml"
    }
}
