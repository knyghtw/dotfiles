import Quickshell.Networking
import Quickshell.Services.UPower
import Quickshell.Bluetooth
import QtQuick
import QtQuick.Layouts

RowLayout {
    spacing: 8
    Layout.alignment: Qt.AlignRight
    Layout.rightMargin: 8

    Text {
        text: BluetoothDeviceState.Connected ? "bluetooth" : "bluetooth_disabled"
        color: "white"
        font.pixelSize: 16
        font.family: "Material Symbols Rounded"
    }

    Text {
        text: !UPower.onBattery ? "battery_charging_full" : "battery_6_bar"
        color: "white"
        font.pixelSize: 16
        font.family: "Roboto"        
    }

    Text {
        text: DeviceConnectionState.Connected ? "signal_wifi_4_bar" : ""
        color: "white"
        font.pixelSize: 16
        font.family: "Material Symbols Rounded"
    }

}
