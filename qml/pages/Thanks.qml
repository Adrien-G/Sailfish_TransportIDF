import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    SilicaFlickable {
        anchors.fill: parent
        contentWidth: parent.width
        contentHeight: col.height + Theme.paddingLarge

        VerticalScrollDecorator {}

        Column {
            id:col
            spacing: Theme.paddingLarge
            width: parent.width
            PageHeader { title: "remerciements / a propos de..." }
            Label {
                text: "Version  : 0.2 (alias : y'a encore du travail, mais la base fonctionne)"
                color: Theme.highlightColor
                font.pixelSize: Theme.fontSizeTiny
            }
            Label {
                text: "developpé par : Adrien Garreau"
                color: Theme.highlightColor
                font.pixelSize: Theme.fontSizeTiny
            }
            Label {
                text: "Merci a vous d'utiliser mon application 😃 (et d'avoir lu la totalité des remerciements !)"
                color: Theme.highlightColor
                font.pixelSize: Theme.fontSizeTiny
            }
        }
    }
}
