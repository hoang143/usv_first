#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "udp.h"
#include "backend.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    //udp client;
    //client.setup();

    qmlRegisterType<udp>("GetPosition", 1, 0, "GetPosition");
    qmlRegisterType<BackEnd>("io.qt.examples.backend", 1, 0, "BackEnd");

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
