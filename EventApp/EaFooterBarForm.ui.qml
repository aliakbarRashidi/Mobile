import QtQuick 2.7
import QtQuick.Controls 2.0
//import QtQuick.Controls.Material 2.0
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0
//import EventAppData 1.0
import "qrc:///shared"

ToolBar {
    id: footerBar
    property alias backBut: backBut
    RowLayout {
        spacing: 20
        anchors.fill: parent

        ToolButton {
            id: backBut
            contentItem: Image {
                fillMode: Image.Pad
                horizontalAlignment: Image.AlignHCenter
                verticalAlignment: Image.AlignVCenter
                source:  "qrc:///shared/images/back.png"
            }
        }
    }
}
