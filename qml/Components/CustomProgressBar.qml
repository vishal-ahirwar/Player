import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Shapes 1.6
ProgressBar {
    id: control
    value: 0.5 // change this to your desired value
    height: 20
    clip: true
    background: Rectangle {
        implicitWidth: 200
        implicitHeight: 6
        color: "transparent" // make the background transparent
        border.color: "#999999"
        radius: 5
    }
    contentItem: Item {
        implicitWidth: 200
        implicitHeight: 4

        Rectangle {
            id: bar
            width: control.visualPosition * parent.width
            height: parent.height
            radius: 5
            color: "#17a81a"
            // add a gradient effect to the progress bar
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#17a81a" }
                GradientStop { id: grad; position: 0.5; color: Qt.lighter ("#17a81a", 2) }
                GradientStop { position: 1.0; color: "#17a81a" }
            }
            // add an animation to the gradient position
            PropertyAnimation {
                target: grad
                property: "position"
                from: 0.1
                to: 0.9
                duration: 1000
                running: true
                loops: Animation.Infinite
            }
        }
        // add a light effect to the progress bar
        Item
        {

        }

    }
}
