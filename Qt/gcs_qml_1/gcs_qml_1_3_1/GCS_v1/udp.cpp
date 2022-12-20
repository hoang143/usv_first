#include "udp.h"
#include <QDebug>

udp::udp(QObject *parent)
    : QObject{parent}, socket(nullptr)
{
    socket = new QUdpSocket(this);
    socket->bind(QHostAddress("10.13.64.204"), 1403);
    connect(socket, &QUdpSocket::readyRead, this, &udp::readData);
}

Q_INVOKABLE void udp::start()
{

}
void udp::callMe(double x)
{
    qDebug()<< "call me"<< x;
}

void udp::readData()
{
    qDebug()<<"in";
    // when data comes in
    QByteArray buffer;
    buffer.resize(socket->pendingDatagramSize());
    QHostAddress sender;
    quint16 senderPort;
    socket->readDatagram(buffer.data(), buffer.size(),
                         &sender, &senderPort);
    qDebug() << "Message from: " << sender.toString();
    qDebug() << "Message port: " << senderPort;
    qDebug() << "Message: " << buffer;
}

void udp::sendData()
{
    QByteArray Data;
    Data.append("hello");
    socket->writeDatagram(Data, QHostAddress("10.13.64.204"), 4210);
}

QVariant udp::show()
{
    return 1.3;
}

void udp::setup()
{

}
