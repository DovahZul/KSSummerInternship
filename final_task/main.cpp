#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "appcontroller.h"
#include <QQmlContext>
#include <asyncimageprovider.h>


#include <QtQml>

#include <QDateTime>
#include <QDesktopServices>
#include <QUrl>



int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    QScopedPointer<AppController> ptr(new AppController());

    engine.rootContext()->setContextProperty("controller",ptr.data());
    engine.addImageProvider("async", new AsyncImageProvider);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
