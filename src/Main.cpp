#ifdef QT_QML_DEBUG
#include <QtQuick>
#endif

#include <sailfishapp.h>
#include <QQmlContext>
#include <QGuiApplication>
#include <QScopedPointer>
#include <QQuickView>
#include "Cdata.h"

int main(int argc, char *argv[])
{
    QScopedPointer<QGuiApplication> application(SailfishApp::application(argc,argv));
    QScopedPointer<QQuickView> view(SailfishApp::createView());
    QScopedPointer<Cdata> cData(new Cdata(view.data()));
    view->rootContext()->setContextProperty("Cdata",cData.data());
    view->setSource((SailfishApp::pathTo("qml/TransportIDF.qml")));
    view->show();

    return application->exec();
}
