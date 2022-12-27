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
#include <QtMath>

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

    // Mode 1: Single target
    void on_target_lat_box_valueChanged(double arg1);
    void on_target_lng_box_valueChanged(double arg1);
    void on_auto_mode_1_send_clicked();

    void on_a_box_valueChanged(int arg1);

    void on_b_box_valueChanged(int arg1);

    void on_k_moment_box_valueChanged(int arg1);

    void on_cruise_box_valueChanged(int arg1);

    void on_zigzag_step_box_valueChanged(int arg1);

    void on_look_ahead_box_valueChanged(int arg1);

    void on_send_parameters_clicked();

    void on_set_default_parameters_clicked();

    void on_arrival_radius_box_valueChanged(int arg1);

    void on_target_lat_1_mode_2_box_valueChanged(double arg1);

    void on_target_lng_1_mode_2_box_valueChanged(double arg1);

    void on_target_lat_2_mode_2_box_valueChanged(double arg1);

    void on_target_lng_2_mode_2_box_valueChanged(double arg1);

    void on_target_lat_3_mode_2_box_valueChanged(double arg1);

    void on_target_lng_3_mode_2_box_valueChanged(double arg1);

    void on_target_lat_4_mode_2_box_valueChanged(double arg1);

    void on_target_lng_4_mode_2_box_valueChanged(double arg1);

    void on_target_lat_1_mode_3_box_valueChanged(double arg1);

    void on_target_lng_1_mode_3_box_valueChanged(double arg1);

    void on_target_lat_2_mode_3_box_valueChanged(double arg1);

    void on_target_lng_2_mode_2_box_2_valueChanged(double arg1);

    void on_auto_mode_2_send_clicked();

    void on_auto_mode_3_send_clicked();

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
    QString num_to_udp_string (double _num, int _top_digit, int _lowest_decimal);
    int left = 0;
    int forward = 0;
    int right = 0;
    int state = 180;
    QString temp1;

    // ------------------- USV DATA -------------------
        QStringList usv_data;

    // ----------- QT STATES: INPUT FROM UI -----------
    // ------SET PARAMETERS ------
        float a_send;                    // Index 22
        float b_send;                    // Index 23
        float k_moment_send;             // Index 24
        float cruise_send;                 // Index 25
        float arrival_radius_send;       // Index 26
        float zigzag_step_send;          // Index 27
        float look_ahead_send;           // Index 28

    // ------ QT States: MODE 0 ------
        double home_lat;
        double home_lng;

    // ------ QT States: MODE 1 ------
        double target_lat_mode_1;
        double target_lng_mode_1;

    // ------ QT States: MODE 2 ------
        double target_lat_1_mode_2;
        double target_lng_1_mode_2;
        double target_lat_2_mode_2;
        double target_lng_2_mode_2;
        double target_lat_3_mode_2;
        double target_lng_3_mode_2;
        double target_lat_4_mode_2;
        double target_lng_4_mode_2;

    // ------ QT States: MODE 3 ------
        double target_lat_1_mode_3;
        double target_lng_1_mode_3;
        double target_lat_2_mode_3;
        double target_lng_2_mode_3;

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
    void getPosition(QVariant, QVariant);
};

#endif // UDP_H
