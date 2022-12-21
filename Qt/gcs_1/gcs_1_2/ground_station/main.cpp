#include "udp.h"
#include <QApplication>
#include <QQuickView>
#include <QObject>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QGuiApplication>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    udp w;
    w.show();
    return a.exec();
}
