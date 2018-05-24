import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    // The effective value will be restricted by ApplicationWindow.allowedOrientations
    allowedOrientations: Orientation.All

    SilicaListView {
        id: listView
        model: Cdata.getJsonSize("thing")
        anchors.fill: parent
        header: PageHeader { title: Cdata.getTitle() }

        ViewPlaceholder {
            enabled: listView.count === 0
            text: "Aucun horaire trouvé :/"
        }

        delegate: BackgroundItem {
            id: delegate
            width:parent.width
            Row {
                Label {
                    anchors.verticalCenter: parent.verticalCenter
                    text: "  "+Cdata.getJsonData("thing","message",index)
                    color: delegate.highlighted ? Theme.highlightColor : Theme.primaryColor
                    font.pixelSize: Theme.fontSizeExtraLarge
                }
                Label {
                    anchors.verticalCenter: parent.verticalCenter
                    text: "   " + Cdata.getJsonData("thing","destination",index)
                    font.pixelSize: Theme.fontSizeMedium
                }

            }
        }

        VerticalScrollDecorator {}
    }
}
