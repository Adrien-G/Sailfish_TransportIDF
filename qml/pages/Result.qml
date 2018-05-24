import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    // The effective value will be restricted by ApplicationWindow.allowedOrientations
    allowedOrientations: Orientation.All

    SilicaListView {
        id: listView
        model: 1
        anchors.fill: parent
        header: PageHeader { title: Cdata.getTitle(1)+" / "+Cdata.getTitle(2) }

        PullDownMenu {
            MenuItem {
                text: qsTr("Rafraîchir")
                onClicked:{
                    Cdata.requestData(2)
                }
            }
        }
        PushUpMenu {
            MenuItem { text: qsTr("ajouter aux favoris") }
        }

        ViewPlaceholder {
            enabled: listView.count === 0
            text: "Aucun horaire trouvé :/"
        }

        delegate: Column {
            id: delegate
            width:parent.width
            SectionHeader {
                text: Cdata.getJsonData("destination",2,0)
            }
            Repeater {
                model: Cdata.getJsonSize(2)/2
                Row {
                    Label {
                        text: "  "+Cdata.getJsonData("message",2,index)
                        color: delegate.highlighted ? Theme.highlightColor : Theme.primaryColor
                        font.pixelSize: Theme.fontSizeExtraLarge
                    }
                    Label {
                        text: "   " + Cdata.getJsonData("destination",2,index)
                        font.pixelSize: Theme.fontSizeSmall
                    }
                }
            }
            Label { text: "" }
            SectionHeader {
                 text: Cdata.getJsonData("destination",2,Cdata.getJsonSize(2)/2)
            }
            Repeater {
                model: Cdata.getJsonSize(2)/2
                Row {
                    Label {
                        text: "  "+Cdata.getJsonData("message",2,index+Cdata.getJsonSize(2)/2)
                        color: delegate.highlighted ? Theme.highlightColor : Theme.primaryColor
                        font.pixelSize: Theme.fontSizeExtraLarge
                    }
                    Label {
                        text: "   " + Cdata.getJsonData("destination",2,index+Cdata.getJsonSize(2)/2)
                        font.pixelSize: Theme.fontSizeSmall
                    }
                }
            }
        }
        VerticalScrollDecorator {}
    }
}
