#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "udp_socket.h"

int main(int argc, char *argv[])
{
    // ---------------------------CHECK VERSION --------------------------
    #if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
        QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    #endif

    // ---------------------------- USER CODE ----------------------------
    udp_socket gcs_socket;

    // ------------------------ AUTO-GENERATED CODE ----------------------
    QGuiApplication app(argc, argv);
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
