#ifndef UDP_SOCKET_H
#define UDP_SOCKET_H

#include <QObject>
#include <QVariant>
#include <QUdpSocket>
#include <QString>
#include <qqml.h>


class udp_socket: public QObject
{
    Q_OBJECT
    Q_PROPERTY(float qmlReadData READ qmlReadData WRITE qmlWriteData)
    QML_ELEMENT

public:
    explicit udp_socket (QObject *parent = Q_NULLPTR);
    Q_INVOKABLE void start();
    void setup();

public slots:
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

#endif // UDP_SOCKET_H
