import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Qt.labs.platform 1.0

Window {
    id: mainWindow
    visible: true
    title: qsTr("CTDI CMTx3 Tester UK Edition")
    visibility: Window.Maximized

    Rectangle {
        id: mainWindowRect
        anchors.fill: parent
        color: "#d6d3ce"

        // Menu bar
        MenuBar {
            id: menuBar
            Menu {
                title: "File"
                MenuItem {
                    text: "Load"
                }
                MenuItem {
                    text: "Edit"
                }

                MenuItem {
                    text: "Send"
                }

                MenuItem {
                    text: "Exit"
                    onTriggered: Qt.quit()
                }
            }

            Menu {
                title: "Help"
                MenuItem {
                    text: "About"
                    onTriggered: {
                    }
                }
            }
        }

        // CMTx3 Banner
        Item {
            id: cmtx3Banner
            width: 900
            height: 100
            anchors.horizontalCenter: parent.horizontalCenter
            Image {
                id: bannerImage
                anchors.fill: parent
                source: "qrc:/gui/GUI/CMTx3 Multi Modem Tester.png"
            }
        }

        // Version and Time/Date box
        Rectangle {
            id: verDateTime
            height: 100
            width: 200
            anchors.top: menuBar.bottom
            anchors.right: parent.right
            anchors.rightMargin: 25
            Column {
                height: parent.height
                width: parent.width

                Rectangle {
                    id: version
                    height: parent.height * 0.333
                    width: parent.width
                    border.color: "darkgrey"
                    Text {
                        anchors.topMargin: 10
                        anchors.centerIn: parent
                        text: "Version: " + "20.0.0.0"
                    }
                }
                Rectangle {
                    id: dateTimeBox
                    height: parent.height * 0.666
                    width: parent.width
                    border.color: "darkgrey"
                    Row {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        spacing: 5
                        Text {
                            id: time
                            Timer {
                                interval: 500; running: true; repeat: true
                                onTriggered: time.text = Qt.formatDateTime(new Date(), "hh:mm:ss")
                            }
                        }
                        Text {
                            text: Qt.formatDateTime(new Date(), "dd/MM/yyyy")
                        }
                    }
                }
            }
        }

        // Drop-down menus
        Row {
            id: dropdownMenuRow
            anchors.top: cmtx3Banner.bottom
            anchors.topMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 20
            ComboBox {
                currentIndex: 2
                textRole: "text"
                model: ListModel {
                    id: customer
                    ListElement { text: "Virgin Media" }
                    ListElement { text: "Magyar Telekom" }
                    ListElement { text: "BT" }
                }
                width: 200
                onCurrentIndexChanged: console.debug(customer.get(currentIndex).text)
            }
            ComboBox {
                currentIndex: 2
                textRole: "text"
                model: ListModel {
                    id: modelType
                    ListElement { text: "V3 Mercury" }
                    ListElement { text: "SpeedPort Smart" }
                    ListElement { text: "Homehub 6" }
                }
                width: 200
                onCurrentIndexChanged: console.debug(modelType.get(currentIndex).text)
            }
        }

        // Tester Grid & Debug Window on RHS
        Row {
            id: testerGridAndDebugRow
            anchors.top: dropdownMenuRow.bottom
            anchors.topMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 10

            Rectangle {
                id: testerGridRect
                height: 835
                width: (mainWindowRect.width - 10) * 0.8

                // Tester name and Slot buttons row
                Row {
                    id: slotRow
                    height: 35
                    width: parent.width
                    Rectangle {
                        id: testerId
                        border.color: "darkgrey"
                        height: 35
                        width: parent.width / 9
                        Text {
                            text: "101"
                            anchors.centerIn: parent
                        }
                        MultiPointTouchArea {
                            anchors.fill: parent
                            onPressed: console.log("Tester 101 area pressed")
                        }

                    }
                    Repeater {
                        model: 16
                        Rectangle {
                            border.color: "darkgrey"
                            height: 35
                            width: (parent.width - testerId.width) / 16
                            Text {
                                text: index + 1
                                anchors.centerIn: parent
                            }
                            MultiPointTouchArea {
                                anchors.fill: parent
                                onPressed: console.log("Slot" + index + "pressed")
                            }
                        }
                    }
                }
                // Test name and each slots Test status
                Row {
                    id: testOverview
                    height: parent.height - slotRow.height
                    width: parent.width
                    anchors.top: slotRow.bottom

                    // TEST LIST COLUMN ON LHS
                    Column {
                        height: parent.height
                        width: parent.width / 9
                        id: testList
                        ListModel {
                            id: testListModel
                            ListElement { text: qsTr("Power Test") }
                            ListElement { text: qsTr("Verify Firmware") }
                            ListElement { text: qsTr("Initial Factory Reset") }
                            ListElement { text: qsTr("Online Status") }
                            ListElement { text: qsTr("information") }
                            ListElement { text: qsTr("USB Port") }
                            ListElement { text: qsTr("Ethernet") }
                            ListElement { text: qsTr("Wireless") }
                            ListElement { text: qsTr("Phone Lines") }
                            ListElement { text: qsTr("RF Test") }
                            ListElement { text: qsTr("Final Factory Reset") }
                            ListElement { text: qsTr("Pass / Fail") }
                            ListElement { text: qsTr("OLP") }
                            ListElement { text: qsTr("") }
                            ListElement { text: qsTr("Timer") }
                            ListElement { text: qsTr("") }
                        }

                        Repeater {
                            id: rectRepeat
                            model: testListModel
                            Rectangle {
                                height: testList.height / 16
                                width: testList.width
                                border.color: "darkgrey"
                                Text {
                                    id: testNameText
                                    anchors.centerIn: parent
                                    text: qsTr(model.text)
                                    font.pointSize: 10
                                    wrapMode: Text.WordWrap
                                }
                            }
                        }
                    }

                    //CURRENT TEST STATUS GRID
                    Repeater {
                        id: slots
                        model: 16
                        SlotColumnData {
                            columnHeight: testOverview.height
                            columnWidth: (parent.width - testerId.width) / 16
                            columIndex: index
                        }
                    }
                }
            }
            Rectangle {
                id: debugOutput
                height: 835
                width: (mainWindowRect.width - 10) * 0.175
                border.color: "darkgrey"
            }
        }
    }
}
