#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "appcontroller.h"
#include <QQmlContext>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;


    QScopedPointer<AppController> ptr(new AppController());

    engine.rootContext()->setContextProperty("controller",ptr.data());

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
