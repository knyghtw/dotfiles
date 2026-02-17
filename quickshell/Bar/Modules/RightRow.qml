import Quickshell
import Quickshell.Networking
import Quickshell.Services.UPower
import Quickshell.Bluetooth
import Quickshell.Widgets
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

RowLayout {
    spacing: 8
    Layout.alignment: Qt.AlignRight
    Layout.rightMargin: 8

    Item {
        id: bluetoothItem
        width: 24
        height: 24
        visible: Bluetooth.defaultAdapter && Bluetooth.defaultAdapter.adapterId !== ""

        Text {
            anchors.centerIn: parent
            text: {
                if (!Bluetooth.defaultAdapter) return "bluetooth_disabled"
                return Bluetooth.defaultAdapter.enabled ? "bluetooth" : "bluetooth_disabled"
            }
            color: "white"
            font.pixelSize: 20
            font.family: "Material Symbols Sharp"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: bluetoothPopup.open()
        }

        Popup {
            id: bluetoothPopup
            width: 300
            height: 400
            x: parent.x - 50
            y: parent.y + 30
            modal: true
            closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

            Column {
                anchors.fill: parent
                spacing: 10

                Row {
                    Text { text: "Bluetooth" }
                    Switch {
                        checked: Bluetooth.defaultAdapter.enabled
                        onToggled: Bluetooth.defaultAdapter.enabled = checked
                    }
                }

                ListView {
                    width: parent.width
                    height: parent.height - 50
                    model: Bluetooth.defaultAdapter ? Bluetooth.defaultAdapter.devices : []
                    delegate: Row {
                        Text { text: modelData.name }
                        Switch {
                            checked: modelData.connected
                            onToggled: modelData.connected = checked
                        }
                    }
                }
            }
        }
    }

    RowLayout {
        id: batteryRow
        spacing: 2
        visible: UPower.displayDevice && UPower.displayDevice.ready && UPower.displayDevice.isLaptopBattery

        Text {
            id: batteryIcon
            text: {
                const perc = Math.round(UPower.displayDevice.percentage * 100) + "%"
                const charging = UPower.displayDevice.state === UPowerDeviceState.Charging

                if (charging) {
                    return "battery_charging_full"
                } else if (perc >= 90) {
                    return "battery_6_bar"
                } else if (perc >= 70) {
                    return "battery_5_bar"
                } else if (perc >= 50) {
                    return "battery_4_bar"
                } else if (perc >= 30) {
                    return "battery_3_bar"
                } else if (perc >= 15) {
                    return "battery_2_bar"
                } else {
                    return "battery_0_bar"
                }                                
            }
            color: "white"
            font.pixelSize: 20
            font.family: "Material Symbols Sharp"
        }

        Text {
            text: Math.round(UPower.displayDevice.percentage * 100) + "%"
            color: "white"
            font.pixelSize: 16
            font.family: "Roboto"
        }

        MouseArea {
            onClicked: powerPopup.open()
        }

        Popup {
            id: powerPopup
            width: 250
            height: 150
            x: parent.x - 20
            y: parent.y + 30
            modal: true

            Column {
                spacing: 8

                Button {
                    text: "Power Saver"
                }
                Button {
                    text: "Balanced"
                }
            }
        }
    }

    Text {
        text: DeviceConnectionState.Connected ? "signal_wifi_4_bar" : ""
        color: "white"
        font.pixelSize: 16
        font.family: "Material Symbols Sharp"
    }

}
