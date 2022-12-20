#include "udp.h"
#include "ui_udp.h"
#include <QKeyEvent>
#include <QQuickItem>
//-----------------Constructor---------------------
udp::udp(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::udp)
{
    ui->setupUi(this);
    socket = new QUdpSocket(this);
    socket->bind(QHostAddress("192.168.1.38"), 1403);
    connect(socket, &QUdpSocket::readyRead, this, &udp::readyData);

    ui->quickWidget->setSource(QUrl(QStringLiteral("qrc:/map.qml")));
    ui->quickWidget->show();
    auto obj = ui->quickWidget->rootObject();
    connect(this, SIGNAL(setCenter(QVariant, QVariant)), obj, SLOT(setCenter(QVariant, QVariant)));
    emit setCenter(25.000, 50.000);
}


void udp::readyData()
    {
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
    ui->textBoxGetHomeLocation->setText(buffer);

    // Parse USV data
    str1.replace(QString(" "), QString(""));
    usv_data = str1.split(u';');

    auto_mode = usv_data.at(0).toInt();
    select_auto_mode = usv_data.at(1).toInt();
    thrust = usv_data.at(2).toInt();
    moment = usv_data.at(3).toInt();
    speed_1 = usv_data.at(4).toInt();
    speed_2 = usv_data.at(5).toInt();
    usv_yaw = usv_data.at(6).toFloat();
    desire_yaw = usv_data.at(7).toFloat();
    yaw_error = usv_data.at(8).toFloat();
    distance = usv_data.at(9).toFloat();
    arrival = usv_data.at(10).toInt();
    step_no = usv_data.at(11).toInt();
    current_target = usv_data.at(12).toInt();
    end_zigzag = usv_data.at(13).toInt();
    reach_A = usv_data.at(14).toInt();
    usv_lat = usv_data.at(15).toDouble();
    usv_lng = usv_data.at(16).toDouble();
    valid = usv_data.at(17).toInt();
    target_lat = usv_data.at(18).toDouble();
    target_lng = usv_data.at(19).toDouble();
    k_yaw_error = usv_data.at(20).toFloat();
    k_distance = usv_data.at(21).toFloat();
    a = usv_data.at(22).toFloat();
    b = usv_data.at(23).toFloat();
    k_moment = usv_data.at(24).toFloat();
    cruise = usv_data.at(25).toInt();
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
    for(int i = 0; i < 20; i++){
        HelloUDP(4210,QHostAddress("192.168.1.52"),"^" );
    }
}

void udp::on_btnHome_pressed()
{
    qDebug()<<"@"+str1.replace(" +","");
    for(int i = 0; i < 20; i++){
        HelloUDP(4210,QHostAddress("192.168.1.52"),"@"+str1.replace(" +",""));
//        HelloUDP(4210,QHostAddress("192.168.1.52"),"@,21.006372000,105.857025000");
    }
}

