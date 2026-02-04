import Quickshell
import Quickshell.Io
import QtQuick

Scope {

    Variants {
        model: Quickshell.screens;

        PanelWindow {
            color: "transparent"
            required property var modelData
            screen: modelData

            anchors {
                top: true
                left:true
                right: true
            }

            implicitHeight: 20

            ClockWidget {
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 8
            }
        }
    }
}