import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io

Scope {
    Variants {
        model: Quickshell.screens

        PanelWindow {
            required property var modelData

            color: "#80000000"
            screen: modelData
            implicitHeight: 30

            anchors {
                top: true
                left: true
                right: true
            }

            RowLayout {
                anchors.fill: parent
                spacing: 6
                LeftRow {
                }

                RightRow {
                }

            }

        }

    }

}
