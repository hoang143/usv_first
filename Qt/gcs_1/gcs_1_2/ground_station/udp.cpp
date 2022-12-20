#include "udp.h"
#include "ui_udp.h"
#include <QKeyEvent>
#include <QQuickItem>
#include <QQuickView>
//-----------------Constructor---------------------
udp::udp(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::udp)
{
    ui->setupUi(this);
    socket = new QUdpSocket(this);
    socket->bind(QHostAddress("192.168.1.99"), 1403);
    connect(socket, &QUdpSocket::readyRead, this, &udp::readyData);

    ui->quickWidget->setSource(QUrl(QStringLiteral("qrc:/map.qml")));
    ui->quickWidget->show();
    auto obj = ui->quickWidget->rootObject();
    connect(this, SIGNAL(getPosition(QVariant, QVariant)), obj, SLOT(getPosition(QVariant, QVariant)));
}


void udp::readyData()
    {
    emit getPosition(home_lat,home_lng);
    // when data comes in
    QByteArray buffer;
    buffer.resize(socket->pendingDatagramSize());

    //qDebug() << "ip Observer" << ipObser.toString();
    QHostAddress sender;
    quint16 senderPort;
    // qint64 QUdpSocket::readDatagram(char * data, qint64 maxSize,
    //                 QHostAddress * address = 0, quint16 * port = 0)
    // Receives a datagram no larger than maxSize bytes and stores it in data.
    // The sender's host address and port is stored in *address and *port
    // (unless the pointers are 0).

    socket->readDatagram(buffer.data(), buffer.size(),
                         &sender, &senderPort);

    qDebug() << "Message from: " << sender.toString();
    qDebug() << "Message port: " << senderPort;
    qDebug() << "Message: " << buffer;
    str1 = buffer;

    // Parse USV data
    str1.replace(QString(" "), QString(""));
    usv_data = str1.split(u';');

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

    // ------------- Display data -------------
    // Mode 0: Manual
    ui->get_home_lat_lcd->display(temp1.setNum(home_lat));
    ui->get_home_lng_lcd->display(temp1.setNum(home_lng));

    // USV States
    ui->auto_mode_lcd->display(temp1.setNum(auto_mode));
    ui->select_auto_mode_lcd->display(temp1.setNum(select_auto_mode));
    ui->thrust_lcd->display(temp1.setNum(thrust));
    ui->moment_lcd->display(temp1.setNum(moment));
    ui->speed_1_lcd->display(temp1.setNum(speed_1));
    ui->speed_2_lcd->display(temp1.setNum(speed_2));
    ui->usv_yaw_lcd->display(temp1.setNum(usv_yaw));
    ui->desire_yaw_lcd->display(temp1.setNum(desire_yaw));
    ui->yaw_error_lcd->display(temp1.setNum(yaw_error));
    ui->distance_lcd->display(temp1.setNum(distance));
    ui->arrival_lcd->display(temp1.setNum(arrival));
    ui->step_no_lcd->display(temp1.setNum(step_no));
    ui->current_target_lcd->display(temp1.setNum(current_target));
    ui->end_zigzag_lcd->display(temp1.setNum(end_zigzag));
    ui->reach_A_lcd->display(temp1.setNum(reach_A));
    ui->usv_lat_lcd->display(temp1.setNum(usv_lat));
    ui->usv_lng_lcd->display(temp1.setNum(usv_lng));
    ui->valid_lcd->display(temp1.setNum(valid));
    ui->target_lat_lcd->display(temp1.setNum(target_lat));
    ui->target_lng_lcd->display(temp1.setNum(target_lng));
    ui->k_yaw_error_lcd->display(temp1.setNum(k_yaw_error));
    ui->k_distance_lcd->display(temp1.setNum(k_distance));
    ui->a_lcd->display(temp1.setNum(a));
    ui->b_lcd->display(temp1.setNum(b));
    ui->k_moment_lcd->display(temp1.setNum(k_moment));
    ui->cruise_lcd->display(temp1.setNum(cruise));
    ui->arrival_radius_lcd->display(temp1.setNum(arrival_radius));
    ui->zigzag_step_lcd->display(temp1.setNum(zigzag_step));
    ui->look_ahead_lcd->display(temp1.setNum(look_ahead));
}


void udp::writeFile(QString str){
    QString filename = "C:/Qt/MyFile.txt";
    QFile file(filename);
    if(!file.open(QFile::WriteOnly |QIODevice::Append|
                  QFile::Text))
    {
        qDebug() << " Could not open file for writing";
        return;
    }
    QTextStream out(&file);
    out << str+"\n";
    file.flush();
    file.close();
}

void udp::HelloUDP(quint16 port,QHostAddress sender,QString x)
{
    QByteArray Data;
    Data.append(x.toLocal8Bit());

    // Sends the datagram datagram
    // to the host address and at port.
    // qint64 QUdpSocket::writeDatagram(const QByteArray & datagram,
    //                      const QHostAddress & host, quint16 port)
    socket->writeDatagram(Data, QHostAddress(sender), port);
}

udp::~udp()
{
    delete ui;
}

void udp::on_btnRight_pressed()
{
    right = 20 + right;
    if(right > 250) right = 250;
    ui->textBox->setText("Right");
    for(int i = 0; i < 20; i++){
        HelloUDP(4210,QHostAddress("192.168.1.52"),"#,+000,+right" );
    }
}


void udp::on_btnLeft_pressed()
{
    left = -50 + left;
    if(left < -250) left = -250;
    ui->textBox->setText("left");
    for(int i = 0; i < 20; i++){
        HelloUDP(4210,QHostAddress("192.168.1.52"),"#,+000,left" );
    }
    qDebug()<<left;
}

void udp::on_btnForward_pressed()
{
    forward = 50 + forward;
    if(forward > 250) forward = 250;
    ui->textBox->setText("Forward");
    for(int i = 0; i < 20; i++){
        HelloUDP(4210,QHostAddress("192.168.1.52"),"#,+forward,+000" );
    }
}

void udp::keyPressEvent(QKeyEvent *e)
{
    if(e->key() == Qt::Key_W){
        forward = 10 + forward;
        if(forward > 10) forward = 10;
        ui->textBox->setText("Forward");
        QString temp,temp1;
        temp1 = temp1.setNum(state);
        if(temp1.size() == 1) temp1 = "00"+temp1;
        if(temp1.size() == 2) temp1 = "0"+temp1;
        temp = temp.setNum(forward);
        if(temp.size() == 1) temp = "00"+temp;
        if(temp.size() == 2) temp = "0"+temp;
        for(int i = 0; i < 20; i++){
            HelloUDP(4210,QHostAddress("192.168.1.52"),"#,+" + temp + ",+"+temp1 );
        }
        qDebug()<< "#,+" + temp + ",+"+temp1;
        qDebug()<< temp1;
    }
//    if(e->key() == Qt::Key_A){
//        left = 10 + left;
//        if(left > 180) left = 180;
//        ui->textBox->setText("left");
//        QString temp;
//        temp = temp.setNum(left);
//        if(temp.size() == 1) temp = "00"+temp;
//        if(temp.size() == 2) temp = "0"+temp;
//        for(int i = 0; i < 20; i++){
//            HelloUDP(4210,QHostAddress("192.168.1.52"),"#,+000,-" + temp );
//        }
//        qDebug()<< "#,+000,-" + temp ;
//    }
//    if(e->key() == Qt::Key_D){
//        right = 10 + right;
//        if(right > 180) right = 180;
//        ui->textBox->setText("Right");
//        QString temp;
//        temp = temp.setNum(right);
//        if(temp.size() == 1) temp = "00"+temp;
//        if(temp.size() == 2) temp = "0"+temp;
//        for(int i = 0; i < 20; i++){
//            HelloUDP(4210,QHostAddress("192.168.1.52"),"#,+000,+" + temp );
//        }
//        qDebug()<< "#,+000,+" + temp ;
//    }
    if(e->key() == Qt::Key_A){
        state = state - 10;
        if(state <= 0) state = state + 360;
        if(state > 360) state = state - 360;
        int print_state;
        print_state = state;
        if (state>180)
            print_state = state - 360;
        ui->textBox->setText(temp1.setNum(print_state));
        QString temp;
        temp = temp.setNum(state);
        if(temp.size() == 1) temp = "00"+temp;
        if(temp.size() == 2) temp = "0"+temp;
        for(int i = 0; i < 20; i++){
            HelloUDP(4210,QHostAddress("192.168.1.52"),"#,+001,+" + temp );
        }
        qDebug()<<"#,+001,+" + temp;
    }
    if(e->key() == Qt::Key_D){
        state = state + 10;
        if(state <= 0) state = state + 360;
        if(state > 360) state = state - 360;
        int print_state;
        print_state = state;
        if (state>180)
            print_state = state - 360;
        ui->textBox->setText(temp1.setNum(print_state));
        QString temp;
        temp = temp.setNum(state);
        if(temp.size() == 1) temp = "00"+temp;
        if(temp.size() == 2) temp = "0"+temp;
        for(int i = 0; i < 20; i++){
            HelloUDP(4210,QHostAddress("192.168.1.52"),"#,+001,+" + temp );
        }
        qDebug()<<"#,+001,+" + temp;
    }
    if(e->key() == Qt::Key_S){
        ui->textBox->setText("Stop");
        temp1 = temp1.setNum(state);
        if(temp1.size() == 1) temp1 = "00"+temp1;
        if(temp1.size() == 2) temp1 = "0"+temp1;
        for(int i = 0; i < 20; i++){
            HelloUDP(4210,QHostAddress("192.168.1.52"),"#,+001,"+temp1);
        }
        qDebug()<<"#,+001,"+temp1;
    }
    if(e->key() == Qt::Key_X){
        for(int i = 0; i < 20; i++){
            HelloUDP(4210,QHostAddress("192.168.1.52"),"#,+000,+180");
        }
    }
}

void udp::on_btnStop_pressed()
{
    left = 0;
    right = 0;
    forward = 0;
    ui->textBox->setText("Stop");
    for(int i = 0; i < 20; i++){
        HelloUDP(4210,QHostAddress("192.168.1.52"),"#,+000,+000" );
    }
}

void udp::on_btnGetHomeLocation_pressed()
{
    home_lat = usv_lat;
    home_lng = usv_lng;
}

void udp::on_btnHome_pressed()
{
    for(int i = 0; i < 20; i++)
    {
        HelloUDP(4210,QHostAddress("192.168.1.52"),"@" + num_to_udp_string(home_lat,2,9) + num_to_udp_string(home_lng,3,9));
    }
}

// --------------------------- SET PARAMETERS ---------------------------
//
void udp::on_a_box_valueChanged(int arg1)
{
    a_send = arg1;
}

void udp::on_b_box_valueChanged(int arg1)
{
    b_send = arg1;
}

void udp::on_k_moment_box_valueChanged(int arg1)
{
    k_moment_send = arg1;
}

void udp::on_cruise_box_valueChanged(int arg1)
{
    cruise_send = arg1;
}

void udp::on_arrival_radius_box_valueChanged(int arg1)
{
    arrival_radius_send = arg1;
}

void udp::on_zigzag_step_box_valueChanged(int arg1)
{
    zigzag_step_send = arg1;
}

void udp::on_look_ahead_box_valueChanged(int arg1)
{
    look_ahead_send = arg1;
}

void udp::on_send_parameters_clicked()
{
    for(int i = 0; i < 20; i++)
    {
        HelloUDP(4210,QHostAddress("192.168.1.52"),"%,"  + num_to_udp_string(a_send,3,0)
                                                        + num_to_udp_string(b_send,3,0)
                                                        + num_to_udp_string(k_moment_send,3,0)
                                                        + num_to_udp_string(cruise_send,3,0)
                                                        + num_to_udp_string(arrival_radius_send,3,0)
                                                        + num_to_udp_string(zigzag_step_send,3,0)
                                                        + num_to_udp_string(look_ahead_send,3,0));
        HelloUDP(3210,QHostAddress("192.168.1.99"),"%,"  + num_to_udp_string(a_send,3,0)
                                                        + num_to_udp_string(b_send,3,0)
                                                        + num_to_udp_string(k_moment_send,3,0)
                                                        + num_to_udp_string(cruise_send,3,0)
                                                        + num_to_udp_string(arrival_radius_send,3,0)
                                                        + num_to_udp_string(zigzag_step_send,3,0)
                                                        + num_to_udp_string(look_ahead_send,3,0));
    }
}


void udp::on_set_default_parameters_clicked()
{
    // Set Parameters
    ui->a_box->setValue(2);
    ui->b_box->setValue(20);
    ui->k_moment_box->setValue(175);
    ui->cruise_box->setValue(190);
    ui->arrival_radius_box->setValue(2);
    ui->zigzag_step_box->setValue(3);
    ui->look_ahead_box->setValue(5);
}

// --------------------------- MODE 1: SINGLE TARGET ---------------------------
//
void udp::on_target_lat_box_valueChanged(double arg1)
{
    target_lat_mode_1 = arg1;
}

void udp::on_target_lng_box_valueChanged(double arg1)
{
    target_lng_mode_1 = arg1;
}

void udp::on_auto_mode_1_send_clicked()
{
    for(int i = 0; i < 20; i++)
    {
        HelloUDP(4210,QHostAddress("192.168.1.52"),"@" + num_to_udp_string(target_lat_mode_1,2,9)
                                                       + num_to_udp_string(target_lng_mode_1,3,9));
    }
}


// --------------------------- MODE 2: ZIGZAG ---------------------------
//
void udp::on_target_lat_1_mode_2_box_valueChanged(double arg1)
{
    target_lat_1_mode_2 = arg1;
}


void udp::on_target_lng_1_mode_2_box_valueChanged(double arg1)
{
    target_lng_1_mode_2 = arg1;
}


void udp::on_target_lat_2_mode_2_box_valueChanged(double arg1)
{
    target_lat_2_mode_2 = arg1;
}


void udp::on_target_lng_2_mode_2_box_valueChanged(double arg1)
{
    target_lng_2_mode_2 = arg1;
}


void udp::on_target_lat_3_mode_2_box_valueChanged(double arg1)
{
    target_lat_3_mode_2 = arg1;
}


void udp::on_target_lng_3_mode_2_box_valueChanged(double arg1)
{
    target_lng_3_mode_2 = arg1;
}


void udp::on_target_lat_4_mode_2_box_valueChanged(double arg1)
{
    target_lat_4_mode_2 = arg1;
}


void udp::on_target_lng_4_mode_2_box_valueChanged(double arg1)
{
    target_lng_4_mode_2 = arg1;
}

void udp::on_auto_mode_2_send_clicked()
{
    for(int i = 0; i < 20; i++)
    {
        HelloUDP(4210,QHostAddress("192.168.1.52"),"!" + num_to_udp_string(target_lat_1_mode_2,2,9)
                                                       + num_to_udp_string(target_lng_1_mode_2,3,9)
                                                       + num_to_udp_string(target_lat_2_mode_2,2,9)
                                                       + num_to_udp_string(target_lng_2_mode_2,3,9)
                                                       + num_to_udp_string(target_lat_3_mode_2,2,9)
                                                       + num_to_udp_string(target_lng_3_mode_2,3,9)
                                                       + num_to_udp_string(target_lat_4_mode_2,2,9)
                                                       + num_to_udp_string(target_lng_4_mode_2,3,9));
    }
}



// --------------------------- MODE 3: AB line ---------------------------
//
void udp::on_target_lat_1_mode_3_box_valueChanged(double arg1)
{
    target_lat_1_mode_3 = arg1;
}


void udp::on_target_lng_1_mode_3_box_valueChanged(double arg1)
{
    target_lng_1_mode_3 = arg1;
}


void udp::on_target_lat_2_mode_3_box_valueChanged(double arg1)
{
    target_lat_2_mode_3 = arg1;
}


void udp::on_target_lng_2_mode_2_box_2_valueChanged(double arg1)
{
    target_lng_2_mode_3 = arg1;
}


void udp::on_auto_mode_3_send_clicked()
{
    for(int i = 0; i < 20; i++)
    {
        HelloUDP(4210,QHostAddress("192.168.1.52"),">" + num_to_udp_string(target_lat_1_mode_3,2,9)
                                                       + num_to_udp_string(target_lng_1_mode_3,3,9)
                                                       + num_to_udp_string(target_lat_2_mode_3,2,9)
                                                       + num_to_udp_string(target_lng_2_mode_3,3,9));
    }
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
