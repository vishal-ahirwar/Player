import QtQuick 2.15
import QtQuick.Controls 2.15

Button {
    id: control
    text: "Custom Button"
    font.pixelSize: 32

    contentItem: Text {
        text: control.text
        font: control.font
        color: "white"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }

    background: Rectangle {
        implicitWidth: 200
        implicitHeight: 50
        radius: 10
        // add a gradient effect to the background
        gradient: Gradient {
            GradientStop { position: 0.0; color:Qt.rgba(1,1,1,0.2) }
            GradientStop { position: 1.0; color:Qt.rgba(1,1,1,0.2)}
        }
    }
}
