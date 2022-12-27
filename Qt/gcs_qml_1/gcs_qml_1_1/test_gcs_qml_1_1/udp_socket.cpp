#include "udp_socket.h"
#include <QDebug>

udp_socket::udp_socket(QObject *parent)
    : QObject{parent}, socket(nullptr)
{
    socket = new QUdpSocket(this);
    socket->bind(QHostAddress("192.168.1.7"), 1403);
    connect(socket, &QUdpSocket::readyRead, this, &udp_socket::readData);
}

QVariant udp_socket::show()
{
    return 1.3;
}

void udp_socket::setup()
{

}

Q_INVOKABLE void udp_socket::start()
{

}

QString udp_socket::readData()
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

float udp_socket::qmlReadData()
{
    qDebug() << packet_value;
    return packet_value;
}

void udp_socket::qmlWriteData(float _data)
{
    packet_value = _data;
}

void udp_socket::sendData()
{
    QByteArray Data;
    Data.append("hello");
    socket->writeDatagram(Data, QHostAddress("192.168.1.7"), 4210);
}
