import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    // The effective value will be restricted by ApplicationWindow.allowedOrientations
    allowedOrientations: Orientation.All

    SilicaListView {
        id: listView
        model: Cdata.getJsonSize(0)
        anchors.fill: parent
        header: PageHeader { title: Cdata.getTitle(0) }
        height: Theme.itemSizeSmall

        ViewPlaceholder {
            enabled: listView.count === 0
            text: "Rien a afficher.. :/"
        }

        delegate: BackgroundItem {
            id:delegate
            width:parent.width
            onClicked: {
                Cdata.setTitle(Cdata.getJsonData("name",0,index),1)
                Cdata.setLinkInformation("code",Cdata.getJsonData("code",0,index))
                Cdata.requestData(1)
                pageStack.push(Qt.resolvedUrl("Station.qml"))
            }
            Row {
                anchors.verticalCenter: parent.Center
                Label {
                    anchors.verticalCenter: parent.bottom
                    text: Cdata.getJsonData("name",0,index)
                    color: delegate.highlighted ? Theme.highlightColor : Theme.primaryColor
                }
                Label {
                    anchors.verticalCenter: parent.bottom
                    font.pixelSize: Theme.fontSizeTiny
                    text: "    "+Cdata.getJsonData("directions",0,index)
                }
            }
        }
        VerticalScrollDecorator {}
    }
}
