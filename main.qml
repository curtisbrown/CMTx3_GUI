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
        color: "lightgrey"

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

        // Drop Down menus
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

                // tester name and Slot bar
                Row {
                    id: slotRow
                    height: 35
                    width: parent.width
                    Button {
                        id: testerId
                        text: "101"
                        height: 35
                        width: parent.width / 9
                    }

                    Repeater {
                        model: 16
                        Button {
                            text: index + 1
                            height: 35
                            width: (parent.width - testerId.width) / 16
                        }
                    }
                }

                ListView {
                    id: testList
                    height: parent.height - slotRow.height
                    width: parent.width / 9
                    anchors.top: slotRow.bottom
                    Repeater {
                        model: 16
                        Rectangle {
                            height: testList.height / 16
                            width: testList.width
                            border.color: "Black"
                        }
                    }
                }

//                Rectangle {
//                    width: parent.width
//                    height: parent.height - slotRow.height
//                    anchors.top: slotRow.bottom
//                    color: "orange"
//                    border.color: "black"
//                    Component {
//                        id: baysDelegate
//                        Rectangle {
//                            width: grid.cellWidth
//                            height: grid.cellHeight
//                            border.color: "black"
//                            Column {
//                                id: container
//                                anchors.fill: parent
//                                spacing: 3
//                                Text { id: bayName; text: "SLOT"; anchors.horizontalCenter: parent.horizontalCenter }
//                            }
//                        }
//                    }
//                    GridView {
//                        id: grid
//                        anchors.fill: parent

//                        cellWidth: parent.width / 17
//                        cellHeight: parent.height / 16

//                        model: ["1,2,3,4,5"]
//                        delegate: baysDelegate
//                        focus: true
//                    }
//                }
            }
            Rectangle {
                id: debugOutput
                height: 835
                width: (mainWindowRect.width - 10) * 0.175
            }
        }
    }
}
