#ifndef UDP_H
#define UDP_H

#include <QObject>
#include <QUdpSocket>
#include <QVariant>
#include <QString>
#include <qqml.h>

class udp :public QObject
{
    Q_OBJECT
    Q_PROPERTY(float qmlReadData READ qmlReadData WRITE qmlWriteData)
    QML_ELEMENT

public:
    explicit udp(QObject *parent = Q_NULLPTR);
    Q_INVOKABLE void start();
    void setup();

public slots:
    void callMe(double x);

    void sendData();
    QVariant show();

private:
    QUdpSocket *socket;
    QString udp_packet;
    float packet_value = 1;
    float qmlReadData();
    void qmlWriteData(float _data);
    QString readData();

};

#endif // UDP_H
