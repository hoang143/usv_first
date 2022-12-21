#ifndef UDP_H
#define UDP_H

#include <QObject>
#include <QUdpSocket>
#include <QVariant>

class udp :public QObject
{
    Q_OBJECT
public:
    explicit udp(QObject *parent = Q_NULLPTR);
    Q_INVOKABLE void start();
    void setup();
public slots:
    void callMe(double x);
    void readData();
    void sendData();
    QVariant show();

private:
    QUdpSocket *socket;

};

#endif // UDP_H
