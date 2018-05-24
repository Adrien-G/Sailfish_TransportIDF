import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    allowedOrientations: Orientation.Portrait

    Drawer {
        id: drawer
        anchors.fill: parent

        SilicaFlickable {
            anchors.fill: parent
            PullDownMenu {
                MenuItem {
                    text: qsTr("a propos.. / remerciements")
                    onClicked: pageStack.push(Qt.resolvedUrl("Thanks.qml"))
                }
                MenuItem {
                    text: qsTr("Paramètres (Bientôt dispo..)")
                    //onClicked: pageStack.push(Qt.resolvedUrl("SecondPage.qml"))
                }
            }
            VerticalScrollDecorator {}

            Column {
                id: column
                spacing: Theme.paddingLarge
                width: parent.width
                enabled: !drawer.opened

                PageHeader { title: "Menu Principal" }
                ExpandingSectionGroup {
                    currentIndex: 0

                    ExpandingSection {
                        id:section
                        title: "Prochains départs"
                        content.sourceComponent: Column {
                            width: section.width
                            BackgroundItem {
                                width:parent.width
                                onClicked: {
                                    Cdata.setTitle("Réseau Express Régional",0)
                                    Cdata.setLinkInformation("type","rers");
                                    Cdata.requestData(0)
                                    pageStack.push(Qt.resolvedUrl("Code.qml"))
                                }
                                Label {
                                    text:"    RER"
                                    anchors.verticalCenter: parent.verticalCenter
                                }
                            }
                            BackgroundItem {
                                width:parent.width
                                onClicked: {
                                    Cdata.setTitle("Métropolitain",0)
                                    Cdata.setLinkInformation("type","metros")
                                    Cdata.requestData(0)
                                    pageStack.push(Qt.resolvedUrl("Code.qml"))
                                }
                                Label {
                                    text:"    métro"
                                    anchors.verticalCenter: parent.verticalCenter
                                }
                            }
                            BackgroundItem {
                                width:parent.width
                                onClicked: {
                                    Cdata.setTitle("Tramways",0)
                                    Cdata.setLinkInformation("type","tramways")
                                    Cdata.requestData(0)
                                    pageStack.push(Qt.resolvedUrl("Code.qml"))
                                }
                                Label {
                                    text:"    Tramways"
                                    anchors.verticalCenter: parent.verticalCenter
                                }
                            }
                            BackgroundItem {
                                width:parent.width
                                onClicked: {
                                    Cdata.setTitle("Autobus",0)
                                    Cdata.setLinkInformation("type","bus")
                                    Cdata.requestData(0)
                                    pageStack.push(Qt.resolvedUrl("Code.qml"))
                                }
                                Label {
                                    text:"    Bus"
                                    anchors.verticalCenter: parent.verticalCenter
                                }
                            }
                            BackgroundItem {
                                width:parent.width
                                onClicked: {
                                    Cdata.setTitle("Noctiliens",0)
                                    Cdata.setLinkInformation("type","noctiliens")
                                    Cdata.requestData(0)
                                    pageStack.push(Qt.resolvedUrl("Code.qml"))
                                }
                                Label {
                                    text:"    Noctiliens"
                                    anchors.verticalCenter: parent.verticalCenter
                                }
                            }
                        }
                    }
                    ExpandingSection {
                        id:section2
                        property int sectionIndex: 1
                        title: "Information Trafic"
                        content.sourceComponent: Column {
                            width: section2.width
                            BackgroundItem {
                                width:parent.width
                                onClicked: pageStack.push(Qt.resolvedUrl("InfoTrafic.qml"))
                                Label {
                                    text:"    Afficher les informations (Bientôt dispo..)"
                                    anchors.verticalCenter: parent.verticalCenter
                                }
                            }
                        }
                    }
                    ExpandingSection {
                        property int sectionIndex: 2
                        title: "Favoris"
                        content.sourceComponent: Column {
                            BackgroundItem {
                                width:parent.width
                                onClicked: pageStack.push(Qt.resolvedUrl("Favorite.qml"))
                                Label {
                                    text:"    Afficher les favoris (Bientôt dispo..)"
                                    anchors.verticalCenter: parent.verticalCenter
                                }
                            }
                        }
                    }
                    ExpandingSection {
                        property int sectionIndex: 3
                        title: "Plans"
                        content.sourceComponent: Column {
                            BackgroundItem {
                                width:parent.width
                                onClicked: pageStack.push(Qt.resolvedUrl("Plans.qml"))
                                Label {
                                    text:"    Plan Métro, RER, Tramway"
                                    anchors.verticalCenter: parent.verticalCenter
                                }
                            }
                        }
                    }
                }
            }
        }


    }

}


    // To enable PullDownMenu, place our content in a SilicaFlickable
    /*SilicaFlickable {
        anchors.fill: parent

        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
        PullDownMenu {
            MenuItem {
                text: qsTr("Information Traffic")
                onClicked: pageStack.push(Qt.resolvedUrl("SecondPage.qml"))
            }
            PushUpMenu {
                MenuLabel { text: "Favoris" }
              MenuItem {
                  text: "Fav1"
                  //onClicked: pageStack.push(Qt.resolvedUrl("Favorite.qml"))
                  onClicked: JsonRequest.requestData("https://api-ratp.pierre-grimaud.fr/v3/lines");
                }
            }

        }

        // Tell SilicaFlickable the height of its content.
        contentHeight: column.height

        // Place our content in a Column.  The PageHeader is always placed at the top
        // of the page, followed by our content.


        SilicaListView {
            id: listView
            model: 5
            anchors.fill: parent
            header: PageHeader {
                title: qsTr("Nested Page")
            }
            delegate: BackgroundItem {
                id: delegate

                Label {
                    x: Theme.horizontalPageMargin
                    text: qsTr("Item") + " " + index
                    anchors.verticalCenter: parent.verticalCenter
                    color: delegate.highlighted ? Theme.highlightColor : Theme.primaryColor
                }
                onClicked: console.log("Clicked " + index)
            }
            VerticalScrollDecorator {}
        }


        /*Column {
            id: column

            width: page.width
            spacing: Theme.paddingLarge
            PageHeader {
                title: qsTr("Lignes")
            }
            Label {
                x: Theme.horizontalPageMargin
                text: qsTr("Hello Sailor")
                color: Theme.secondaryHighlightColor
                font.pixelSize: Theme.fontSizeExtraLarge
            }

        }
}*/

