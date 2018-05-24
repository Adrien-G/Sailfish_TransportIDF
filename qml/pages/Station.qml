import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    // The effective value will be restricted by ApplicationWindow.allowedOrientations
    allowedOrientations: Orientation.All

    SilicaListView {
        id: listView
        model: Cdata.getJsonSize(1)
        anchors.fill: parent
        header: PageHeader { title: Cdata.getTitle(1) }

        ViewPlaceholder {
            enabled: listView.count === 0
            text: "Rien a afficher.. :/"
        }

        delegate: BackgroundItem {
            id: delegate
            width:parent.width
            BackgroundItem {
                width:parent.width
                onClicked: {
                    Cdata.setLinkInformation("station",Cdata.getJsonData("slug",1,index))
                    Cdata.setTitle(Cdata.getJsonData("name",1,index),2)
                    Cdata.requestData(2)
                    pageStack.push(Qt.resolvedUrl("Result.qml"))
                }
                Label {
                    anchors.verticalCenter: parent.verticalCenter
                    text: "    "+Cdata.getJsonData("name",1,index)
                    color: delegate.highlighted ? Theme.highlightColor : Theme.primaryColor
                }
            }
        }
        VerticalScrollDecorator {}
    }
}
