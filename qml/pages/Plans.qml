import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    SilicaListView {
        anchors.fill: parent
        contentWidth: parent.width
        contentHeight: col.height + Theme.paddingLarge

        VerticalScrollDecorator {}

        Column {
            id:col
            spacing: Theme.paddingLarge
            width: parent.width
            PageHeader { title: "Plans" }
            Image {
                source: "qrc:Pics/Plan-Metro.png"

            }
        }
    }
}
