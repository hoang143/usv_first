#ifndef UDP_H
#define UDP_H

#include <QMainWindow>
#include <QUdpSocket>
#include <QFile>
#include <QString>
#include <QDebug>
#include <QWidget>
#include <QKeyEvent>
#include <QVariant>

QT_BEGIN_NAMESPACE
namespace Ui { class udp; }
QT_END_NAMESPACE

class udp : public QMainWindow
{
    Q_OBJECT

public:
    udp(QWidget *parent = nullptr);
    ~udp();



private slots:
    void readyData();
    void HelloUDP(quint16 port, QHostAddress sender, QString x);
    void on_btnRight_pressed();
    void on_btnLeft_pressed();
    void on_btnForward_pressed();
    void on_btnStop_pressed();
    void on_btnGetHomeLocation_pressed();
    void on_btnHome_pressed();

    void on_test_but_clicked();

    void on_lcdNumber_overflow();

private:
    Ui::udp *ui;
    QUdpSocket *socket;
    void writeFile(QString str);
    QHostAddress ipObser;
    QHostAddress ipContro;
    QString temp;
    QString ip3Contro;
    QString ip4Contro;
    QString ip3Obser;
    QString ip4Obser;
    QString str;
    QString str1;
    void keyPressEvent(QKeyEvent *e);
    int left = 0;
    int forward = 0;
    int right = 0;
    int state = 180;
    QString temp1;

    // ------ USV DATA ------
    QStringList usv_data;

    // ------ USV States ------
        bool auto_mode;             // Index 0
        int select_auto_mode;       // Index 1
        int thrust;                 // Index 2
        int moment;                 // Index 3
        int speed_1;                // Index 4
        int speed_2;                // Index 5
        float usv_yaw;              // Index 6
        float desire_yaw;           // Index 7
        float yaw_error;            // Index 8
        float distance;             // Index 9
        bool arrival;               // Index 10
        int step_no;                // Index 11
        int current_target;         // Index 12
        bool end_zigzag;            // Index 13
        bool reach_A;               // Index 14
        double usv_lat;             // Index 15
        double usv_lng;             // Index 16
        bool valid;                 // Index 17
        double target_lat;          // Index 18
        double target_lng;          // Index 19
        float k_yaw_error;          // Index 20
        float k_distance;           // Index 21
        float a;                    // Index 22
        float b;                    // Index 23
        float k_moment;             // Index 24
        int cruise;                 // Index 25
        float arrival_radius;       // Index 26
        float zigzag_step;          // Index 27
        float look_ahead;           // Index 28

signals:
    void setCenter(QVariant, QVariant);
};
#endif // UDP_H
