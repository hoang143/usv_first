#include "udp.h"
#include <QDebug>

// --------------------------------- SETUP -------------------------------
udp::udp(QObject *parent)
    : QObject{parent}, socket(nullptr)
{
    socket = new QUdpSocket(this);
    socket->bind(QHostAddress("192.168.1.38"), 1403);
    connect(socket, &QUdpSocket::readyRead, this, &udp::receivePacket);
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

// ------------------------------ USER FUNCTIONS -----------------------------
QString udp::receivePacket()
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

    // Parse USV data
    udp_packet.replace(QString(" "), QString(""));
    usv_data = udp_packet.split(u';');

    auto_mode = usv_data.at(0).toFloat();
    select_auto_mode = usv_data.at(1).toFloat();
    thrust = usv_data.at(2).toFloat();
    moment = usv_data.at(3).toFloat();
    speed_1 = usv_data.at(4).toFloat();
    speed_2 = usv_data.at(5).toFloat();
    usv_yaw = usv_data.at(6).toFloat();
    desire_yaw = usv_data.at(7).toFloat();
    yaw_error = usv_data.at(8).toFloat();
    distance = usv_data.at(9).toFloat();
    arrival = usv_data.at(10).toFloat();
    step_no = usv_data.at(11).toFloat();
    current_target = usv_data.at(12).toFloat();
    end_zigzag = usv_data.at(13).toFloat();
    reach_A = usv_data.at(14).toFloat();
    usv_lat = usv_data.at(15).toDouble();
    usv_lng = usv_data.at(16).toDouble();
    valid = usv_data.at(17).toFloat();
    target_lat = usv_data.at(18).toDouble();
    target_lng = usv_data.at(19).toDouble();
    k_yaw_error = usv_data.at(20).toFloat();
    k_distance = usv_data.at(21).toFloat();
    a = usv_data.at(22).toFloat();
    b = usv_data.at(23).toFloat();
    k_moment = usv_data.at(24).toFloat();
    cruise = usv_data.at(25).toFloat();
    arrival_radius = usv_data.at(26).toFloat();
    zigzag_step = usv_data.at(27).toFloat();
    look_ahead = usv_data.at(28).toFloat();

    qDebug()<<usv_data;
    qDebug()<<temp1.setNum(auto_mode);
    qDebug()<<temp1.setNum(select_auto_mode);
    qDebug()<<temp1.setNum(thrust);
    qDebug()<<temp1.setNum(moment);
    qDebug()<<temp1.setNum(speed_1);
    qDebug()<<temp1.setNum(speed_2);
    qDebug()<<temp1.setNum(usv_yaw);
    qDebug()<<temp1.setNum(desire_yaw);
    qDebug()<<temp1.setNum(yaw_error);
    qDebug()<<temp1.setNum(distance);
    qDebug()<<temp1.setNum(arrival);
    qDebug()<<temp1.setNum(step_no);
    qDebug()<<temp1.setNum(current_target);
    qDebug()<<temp1.setNum(end_zigzag);
    qDebug()<<temp1.setNum(reach_A);
    qDebug()<<temp1.setNum(usv_lat);
    qDebug()<<temp1.setNum(usv_lng);
    qDebug()<<temp1.setNum(valid);
    qDebug()<<temp1.setNum(target_lat);
    qDebug()<<temp1.setNum(target_lng);
    qDebug()<<temp1.setNum(k_yaw_error);
    qDebug()<<temp1.setNum(k_distance);
    qDebug()<<temp1.setNum(a);
    qDebug()<<temp1.setNum(b);
    qDebug()<<temp1.setNum(k_moment);
    qDebug()<<temp1.setNum(cruise);
    qDebug()<<temp1.setNum(arrival_radius);
    qDebug()<<temp1.setNum(zigzag_step);
    qDebug()<<temp1.setNum(look_ahead);

    emit onReceivedPacket();
    return data;
}

void udp::sendPacket(quint16 port,QHostAddress sender,QString x)
{
    QByteArray Data;
    Data.append(x.toLocal8Bit());

    // Sends the datagram datagram
    // to the host address and at port.
    // qint64 QUdpSocket::writeDatagram(const QByteArray & datagram,
    //                      const QHostAddress & host, quint16 port)
    socket->writeDatagram(Data, QHostAddress(sender), port);
}


// ------------------------- QML FUNCTIONS -------------------------
QString udp::qmlReadPacket()
{
    qDebug() << udp_packet;
    return udp_packet;
}

// --------------------- QML GET USV STATES ---------------------
bool udp::qml_read_auto_mode()             // Index 0
{
    return auto_mode;
}
int udp::qml_read_select_auto_mode()       // Index 1
{
    return select_auto_mode;
}
int udp::qml_read_thrust()                 // Index 2
{
    return thrust;
}
int udp::qml_read_moment()                 // Index 3
{
    return moment;
}
int udp::qml_read_speed_1()                // Index 4
{
    return speed_1;
}
int udp::qml_read_speed_2()                // Index 5
{
    return speed_2;
}
float udp::qml_read_usv_yaw()              // Index 6
{
    return usv_yaw;
}
float udp::qml_read_desire_yaw()           // Index 7
{
    return desire_yaw;
}
float udp::qml_read_yaw_error()            // Index 8
{
    return yaw_error;
}
float udp::qml_read_distance()             // Index 9
{
    return distance;
}
bool udp::qml_read_arrival()               // Index 10
{
    return arrival;
}
int udp::qml_read_step_no()                // Index 11
{
    return step_no;
}
int udp::qml_read_current_target()         // Index 12
{
    return current_target;
}
bool udp::qml_read_end_zigzag()            // Index 13
{
    return end_zigzag;
}
bool udp::qml_read_reach_A()               // Index 14
{
    return reach_A;
}
double udp::qml_read_usv_lat()             // Index 15
{
    return usv_lat;
}
double udp::qml_read_usv_lng()             // Index 16
{
    return usv_lng;
}
bool udp::qml_read_valid()                 // Index 17
{
    return valid;
}
double udp::qml_read_target_lat()          // Index 18
{
    return target_lat;
}
double udp::qml_read_target_lng()          // Index 19
{
    return target_lng;
}
float udp::qml_read_k_yaw_error()          // Index 20
{
    return k_yaw_error;
}
float udp::qml_read_k_distance()           // Index 21
{
    return k_distance;
}
float udp::qml_read_a()                    // Index 22
{
    return a;
}
float udp::qml_read_b()                    // Index 23
{
    return b;
}
float udp::qml_read_k_moment()             // Index 24
{
    return k_moment;
}
int udp::qml_read_cruise()                 // Index 25
{
    return cruise;
}
float udp::qml_read_arrival_radius()       // Index 26
{
    return arrival_radius;
}
float udp::qml_read_zigzag_step()          // Index 27
{
    return zigzag_step;
}
float udp::qml_read_look_ahead()           // Index 28
{
    return look_ahead;
}

// -------------------------- QML WRITE --------------------------
// ------SET PARAMETERS ------
    float udp::qml_write_a_send(float _val)                    // Index 22
    {
        a_send = _val;
        return a_send;
    }
    float udp::qml_write_b_send(float _val)                    // Index 23
    {
        b_send = _val;
        return b_send;
    }
    float udp::qml_write_k_moment_send(float _val)             // Index 24
    {
        k_moment_send = _val;
        return k_moment_send;
    }
    float udp::qml_write_cruise_send(float _val)               // Index 25
    {
        cruise_send = _val;
        return cruise_send;
    }
    float udp::qml_write_arrival_radius_send(float _val)       // Index 26
    {
        arrival_radius_send = _val;
        return arrival_radius_send;
    }
    float udp::qml_write_zigzag_step_send(float _val)          // Index 27
    {
        zigzag_step_send = _val;
        return zigzag_step_send;
    }
    float udp::qml_write_look_ahead_send(float _val)           // Index 28
    {
        look_ahead_send = _val;
        return look_ahead_send;
    }

// ------ QT States: MODE 0 ------
    double udp::qml_read_home_lat()
    {
        return home_lat;
    }
    double udp::qml_read_home_lng()
    {
        return home_lng;
    }
    void udp::qml_get_home(bool _val)
    {
        if (_val > 0)
        {
            home_lat = usv_lat;
            home_lng = usv_lng;
        }
        emit gotHome();
        qDebug() << "USV lat" << usv_lat;
        qDebug() << "USV lng" <<usv_lng;
        qDebug() << "Home lat" <<home_lat;
        qDebug() << "Home lng" <<home_lng;
    }
    void udp::send_home(bool _val)
    {
        if (_val > 0)
        {
            for(int i = 0; i < 20; i++){
                sendPacket(4210,QHostAddress("192.168.1.52"),"@" + num_to_udp_string(home_lat,2,9)
                                                                 + num_to_udp_string(home_lng,3,9));
            }
            for(int i = 0; i < 20; i++){
                sendPacket(3210,QHostAddress("192.168.1.38"),"@" + num_to_udp_string(home_lat,2,9)
                                                                 + num_to_udp_string(home_lng,3,9));
            }
        }
    }

// ------ QT States: MODE 1 ------
    double udp::qml_write_target_lat_mode_1(double _val)
    {
        target_lat_mode_1 = _val;
        return target_lat_mode_1;
    }
    double udp::qml_write_target_lng_mode_1(double _val)
    {
        target_lng_mode_1 = _val;
        return target_lng_mode_1;
    }
    void udp::send_mode_1 (bool _val)
    {
        if (_val > 0)
        {
            for(int i = 0; i < 20; i++){
                sendPacket(4210,QHostAddress("192.168.1.52"),"@" + num_to_udp_string(target_lat_mode_1,2,9)
                                                                 + num_to_udp_string(target_lng_mode_1,3,9));
            }
            for(int i = 0; i < 20; i++){
                sendPacket(3210,QHostAddress("192.168.1.38"),"@" + num_to_udp_string(target_lat_mode_1,2,9)
                                                                 + num_to_udp_string(target_lng_mode_1,3,9));
            }
        }
    }

// ------ QT States: MODE 2 ------
    double udp::qml_write_target_lat_1_mode_2(double _val)
    {
        target_lat_1_mode_2 = _val;
        return target_lat_1_mode_2;
    }
    double udp::qml_write_target_lng_1_mode_2(double _val)
    {
        target_lng_1_mode_2 = _val;
        return target_lng_1_mode_2;
    }
    double udp::qml_write_target_lat_2_mode_2(double _val)
    {
        target_lat_2_mode_2 = _val;
        return target_lat_2_mode_2;
    }
    double udp::qml_write_target_lng_2_mode_2(double _val)
    {
        target_lng_2_mode_2 = _val;
        return target_lng_2_mode_2;
    }
    double udp::qml_write_target_lat_3_mode_2(double _val)
    {
        target_lat_3_mode_2 = _val;
        return target_lat_3_mode_2;
    }
    double udp::qml_write_target_lng_3_mode_2(double _val)
    {
        target_lng_3_mode_2 = _val;
        return target_lng_3_mode_2;
    }
    double udp::qml_write_target_lat_4_mode_2(double _val)
    {
        target_lat_4_mode_2 = _val;
        return target_lat_4_mode_2;
    }
    double udp::qml_write_target_lng_4_mode_2(double _val)
    {
        target_lng_4_mode_2 = _val;
        return target_lng_4_mode_2;
    }

// ------ QT States: MODE 3 ------
    double udp::qml_write_target_lat_1_mode_3(double _val)
    {
        target_lat_1_mode_3 = _val;
        return target_lat_1_mode_3;
    }
    double udp::qml_write_target_lng_1_mode_3(double _val)
    {
        target_lng_1_mode_3 = _val;
        return target_lng_1_mode_3;
    }
    double udp::qml_write_target_lat_2_mode_3(double _val)
    {
        target_lat_2_mode_3 = _val;
        return target_lat_2_mode_3;
    }
    double udp::qml_write_target_lng_2_mode_3(double _val)
    {
        target_lng_2_mode_3 = _val;
        return target_lng_2_mode_3;
    }


// -------------------------------- CUSTOM FUNCTIONS --------------------------------
    QString udp::num_to_udp_string (double _num, int _top_digit, int _lowest_decimal)
    {
      QString _udp_string = "";
      QString _char = "";
      int _integer_part = 0;


      if (_num<0)
      {
        _num = abs(_num);
        _udp_string.append("-");
      }
      else _udp_string.append("+");

      for (int i = _top_digit; i>=1; i--)
      {
       _integer_part = qFloor(_num/qPow(10,(i-1)));
       _udp_string.append(_char.setNum(_integer_part));

       _num = _num - _integer_part * qPow(10,(i-1));
      }

      _udp_string.append(".");

      for (int i = 1; i <= _lowest_decimal; i++)
      {
       _integer_part = qFloor(_num/qPow(10,-i));
       _udp_string.append(_char.setNum(_integer_part));

       _num = _num - _integer_part * qPow(10,-i);
      }

      return _udp_string;
    }

