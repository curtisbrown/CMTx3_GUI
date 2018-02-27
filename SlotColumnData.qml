import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Qt.labs.platform 1.0


Column {
    id: columContent

    property alias columnWidth: columContent.width
    property alias columnHeight: columContent.height
    property alias columIndex: testInitiation.columIndex
    TestSequencePreparationWindow {id: testInitiation}

    Rectangle {
        id: powerTestRect
        height: parent.height / 16
        width: parent.width
        border.color: "darkgrey"
    }
    Rectangle {
        id: verifyFirmwareRect
        height: parent.height / 16
        width: parent.width
        border.color: "darkgrey"
    }
    Rectangle {
        id: initialFactoryResetRect
        height: parent.height / 16
        width: parent.width
        border.color: "darkgrey"
    }
    Rectangle {
        id: onlineStatusRect
        height: parent.height / 16
        width: parent.width
        border.color: "darkgrey"
    }
    Rectangle {
        id: infoRect
        height: parent.height / 16
        width: parent.width
        border.color: "darkgrey"
    }
    Rectangle {
        id: usbRect
        height: parent.height / 16
        width: parent.width
        border.color: "darkgrey"
    }
    Rectangle {
        id: ethernetRect
        height: parent.height / 16
        width: parent.width
        border.color: "darkgrey"
    }
    Rectangle {
        id: wirelessRect
        height: parent.height / 16
        width: parent.width
        border.color: "darkgrey"
    }
    Rectangle {
        id: phoneLinesRect
        height: parent.height / 16
        width: parent.width
        border.color: "darkgrey"
    }
    Rectangle {
        id: rfTestRect
        height: parent.height / 16
        width: parent.width
        border.color: "darkgrey"
    }
    Rectangle {
        id: finalFactoryResetRect
        height: parent.height / 16
        width: parent.width
        border.color: "darkgrey"
    }
    Rectangle {
        id: passFailRect
        height: parent.height / 16
        width: parent.width
        border.color: "darkgrey"
    }
    Rectangle {
        id: olpRect
        height: parent.height / 16
        width: parent.width
        border.color: "darkgrey"
    }
    Rectangle {
        id: startButtonRect
        height: parent.height / 16
        width: parent.width
        border.color: "darkgrey"
        Button {
            id: startTest
            height: parent.height - 10
            width: parent.width - 10
            anchors.centerIn: parent
            onPressed: testInitiation.visible = true
            Text {
                anchors.centerIn: parent
                text: qsTr("Start")
            }
        }
    }
    Rectangle {
        id: timerRect
        height: parent.height / 16
        width: parent.width
        border.color: "darkgrey"
        Text {
            anchors.centerIn: parent
            text: qsTr("0:00")
        }
    }
    Rectangle {
        id: clearButtonRect
        height: parent.height / 16
        width: parent.width
        border.color: "darkgrey"
        Button {
            id: clearTest
            height: parent.height - 10
            width: parent.width - 10
            anchors.centerIn: parent
            Text {
                anchors.centerIn: parent
                text: qsTr("Clear")
            }
        }
    }
}
