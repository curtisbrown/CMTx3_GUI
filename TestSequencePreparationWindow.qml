import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Qt.labs.platform 1.0

Window {
    id: testPreparationWindow

    property int slotIndex: -1
    property alias columIndex : testPreparationWindow.slotIndex

    title: "Slot " + (columIndex + 1) + " Test Initialisation"

    width: 1024
    height: 768

}
