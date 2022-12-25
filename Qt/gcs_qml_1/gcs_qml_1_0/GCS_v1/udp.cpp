#include "udp.h"
#include <QDebug>

udp::udp(QObject *parent)
    : QObject{parent}, socket(nullptr)
{
    socket = new QUdpSocket(this);
    socket->bind(QHostAddress("192.168.1.7"), 1403);
    connect(socket, &QUdpSocket::readyRead, this, &udp::readData);
}

QVariant udp::show()
{
    return 1.3;
}

void udp::setup()
{

}

Q_INVOKABLE void udp::start()
{

}

void udp::callMe(double x)
{
    qDebug()<< "call me"<< x;
}

QString udp::readData()
{
    qDebug()<<"in";
    // when data comes in
    QByteArray buffer;
    QString data;
    buffer.resize(socket->pendingDatagramSize());
    QHostAddress sender;
    quint16 senderPort;
    socket->readDatagram(buffer.data(), buffer.size(),
                         &sender, &senderPort);
    qDebug() << "Message from: " << sender.toString();
    qDebug() << "Message port: " << senderPort;
    qDebug() << "Message: " << buffer;
    data = buffer;
    udp_packet = buffer;
    packet_value = udp_packet.toFloat();
    qDebug() << "Message 1: " << data;
    qDebug() << "Message 2: " << udp_packet;
    qDebug() << "Message 2: " << packet_value;
    return data;
}

float udp::qmlReadData()
{
    qDebug() << packet_value;
    return packet_value;
}

void udp::qmlWriteData(float _data)
{
    packet_value = _data;
}

void udp::sendData()
{
    QByteArray Data;
    Data.append("hello");
    socket->writeDatagram(Data, QHostAddress("192.168.1.7"), 4210);
}
