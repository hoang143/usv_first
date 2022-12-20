#ifndef UDP_H
#define UDP_H

#include <QObject>
#include <QUdpSocket>
#include <QVariant>
#include <QString>
#include <qqml.h>
#include <QtMath>

class udp :public QObject
{
    Q_OBJECT

    // ----------------- READ-ONLY PROPERTIES -----------------
    Q_PROPERTY(QString udpPacket READ qmlReadPacket NOTIFY onReceivedPacket)

    Q_PROPERTY(float autoMode READ qml_read_auto_mode NOTIFY onReceivedPacket)
    Q_PROPERTY(float selectAutoMode READ qml_read_select_auto_mode NOTIFY onReceivedPacket)
    Q_PROPERTY(float thrust READ qml_read_thrust NOTIFY onReceivedPacket)
    Q_PROPERTY(float moment READ qml_read_moment NOTIFY onReceivedPacket)
    Q_PROPERTY(float speed1 READ qml_read_speed_1 NOTIFY onReceivedPacket)
    Q_PROPERTY(float speed2 READ qml_read_speed_2 NOTIFY onReceivedPacket)
    Q_PROPERTY(float usvYaw READ qml_read_usv_yaw NOTIFY onReceivedPacket)
    Q_PROPERTY(float desireYaw READ qml_read_desire_yaw NOTIFY onReceivedPacket)
    Q_PROPERTY(float yawError READ qml_read_yaw_error NOTIFY onReceivedPacket)
    Q_PROPERTY(float distance READ qml_read_distance NOTIFY onReceivedPacket)
    Q_PROPERTY(float arrival READ qml_read_arrival NOTIFY onReceivedPacket)
    Q_PROPERTY(float stepNo READ qml_read_step_no NOTIFY onReceivedPacket)
    Q_PROPERTY(float currentTarget READ qml_read_current_target NOTIFY onReceivedPacket)
    Q_PROPERTY(float endZigzag READ qml_read_end_zigzag NOTIFY onReceivedPacket)
    Q_PROPERTY(float reachA READ qml_read_reach_A NOTIFY onReceivedPacket)
    Q_PROPERTY(float usvLat READ qml_read_usv_lat NOTIFY onReceivedPacket)
    Q_PROPERTY(float usvLng READ qml_read_usv_lng NOTIFY onReceivedPacket)
    Q_PROPERTY(float valid READ qml_read_valid NOTIFY onReceivedPacket)
    Q_PROPERTY(float targetLat READ qml_read_target_lat NOTIFY onReceivedPacket)
    Q_PROPERTY(float targetLng READ qml_read_target_lng NOTIFY onReceivedPacket)
    Q_PROPERTY(float kYawError READ qml_read_k_yaw_error NOTIFY onReceivedPacket)
    Q_PROPERTY(float kDistance READ qml_read_k_distance NOTIFY onReceivedPacket)
    Q_PROPERTY(float a READ qml_read_a NOTIFY onReceivedPacket)
    Q_PROPERTY(float b READ qml_read_b NOTIFY onReceivedPacket)
    Q_PROPERTY(float kMoment READ qml_read_k_moment NOTIFY onReceivedPacket)
    Q_PROPERTY(float cruise READ qml_read_cruise NOTIFY onReceivedPacket)
    Q_PROPERTY(float arrivalRadius READ qml_read_arrival_radius NOTIFY onReceivedPacket)
    Q_PROPERTY(float zigzagStep READ qml_read_zigzag_step NOTIFY onReceivedPacket)
    Q_PROPERTY(float lookAhead READ qml_read_look_ahead NOTIFY onReceivedPacket)

    // ----------------- WRITE PROPERTIES -----------------
    // ------ SET PARAMETERS ------
    Q_PROPERTY(float aSend READ qml_read_a_send WRITE qml_write_a_send NOTIFY onASendChanged)
    Q_PROPERTY(float bSend READ qml_read_b_send WRITE qml_write_b_send NOTIFY onBSendChanged)
    Q_PROPERTY(float kMomentSend READ qml_read_k_moment_send WRITE qml_write_k_moment_send NOTIFY onKMomentSendChanged)
    Q_PROPERTY(float cruiseSend READ qml_read_cruise_send WRITE qml_write_cruise_send NOTIFY onCruiseSendChanged)
    Q_PROPERTY(float arrivalRadiusSend READ qml_read_arrival_radius_send WRITE qml_write_arrival_radius_send NOTIFY onArrivalRadiusSendChanged)
    Q_PROPERTY(float zigzagStepSend READ qml_read_zigzag_step_send WRITE qml_write_zigzag_step_send NOTIFY onZigzagStepSendChanged)
    Q_PROPERTY(float lookAheadSend READ qml_read_look_ahead_send WRITE qml_write_look_ahead_send NOTIFY onLookAheadSendChanged)
    Q_PROPERTY(bool sendParameters WRITE send_parameters)

    // ------ QT States: MODE 0 ------
    Q_PROPERTY(float thrustSend READ qml_read_thrust_send WRITE qml_write_thrust_send NOTIFY onThrustSendChanged)
    Q_PROPERTY(float momentSend READ qml_read_moment_send WRITE qml_write_moment_send NOTIFY onMomentSendChanged)
    Q_PROPERTY(bool sendManual WRITE send_manual)

    Q_PROPERTY(float homeLat READ qml_read_home_lat NOTIFY gotHome)
    Q_PROPERTY(float homeLng READ qml_read_home_lng NOTIFY gotHome)
    Q_PROPERTY(bool getHome WRITE qml_get_home)
    Q_PROPERTY(bool sendHome WRITE send_home)

    // ------ QT States: MODE 1 ------
    Q_PROPERTY(float targetLatMode1 WRITE qml_write_target_lat_mode_1)
    Q_PROPERTY(float targetLngMode1 WRITE qml_write_target_lng_mode_1)
    Q_PROPERTY(bool sendMode1 WRITE send_mode_1)

    // ------ QT States: MODE 2 ------
    Q_PROPERTY(double targetLat1Mode2 READ qml_read_target_lat_1_mode_2 WRITE qml_write_target_lat_1_mode_2 NOTIFY onTargetLat1Mode2Changed)
    Q_PROPERTY(double targetLng1Mode2 READ qml_read_target_lng_1_mode_2 WRITE qml_write_target_lng_1_mode_2 NOTIFY onTargetLng1Mode2Changed)
    Q_PROPERTY(double targetLat2Mode2 READ qml_read_target_lat_2_mode_2 WRITE qml_write_target_lat_2_mode_2 NOTIFY onTargetLat2Mode2Changed)
    Q_PROPERTY(double targetLng2Mode2 READ qml_read_target_lng_2_mode_2 WRITE qml_write_target_lng_2_mode_2 NOTIFY onTargetLng2Mode2Changed)
    Q_PROPERTY(double targetLat3Mode2 READ qml_read_target_lat_3_mode_2 WRITE qml_write_target_lat_3_mode_2 NOTIFY onTargetLat3Mode2Changed)
    Q_PROPERTY(double targetLng3Mode2 READ qml_read_target_lng_3_mode_2 WRITE qml_write_target_lng_3_mode_2 NOTIFY onTargetLng3Mode2Changed)
    Q_PROPERTY(double targetLat4Mode2 READ qml_read_target_lat_4_mode_2 WRITE qml_write_target_lat_4_mode_2 NOTIFY onTargetLat4Mode2Changed)
    Q_PROPERTY(double targetLng4Mode2 READ qml_read_target_lng_4_mode_2 WRITE qml_write_target_lng_4_mode_2 NOTIFY onTargetLng4Mode2Changed)
    Q_PROPERTY(bool sendMode2 WRITE send_mode_2)

    // ------ QT States: MODE 3 ------
    Q_PROPERTY(double targetLat1Mode3 READ qml_read_target_lat_1_mode_3 WRITE qml_write_target_lat_1_mode_3 NOTIFY onTargetLat1Mode3Changed)
    Q_PROPERTY(double targetLng1Mode3 READ qml_read_target_lng_1_mode_3 WRITE qml_write_target_lng_1_mode_3 NOTIFY onTargetLng1Mode3Changed)
    Q_PROPERTY(double targetLat2Mode3 READ qml_read_target_lat_2_mode_3 WRITE qml_write_target_lat_2_mode_3 NOTIFY onTargetLat2Mode3Changed)
    Q_PROPERTY(double targetLng2Mode3 READ qml_read_target_lng_2_mode_3 WRITE qml_write_target_lng_2_mode_3 NOTIFY onTargetLng2Mode3Changed)
    Q_PROPERTY(bool sendMode3 WRITE send_mode_3)

    QML_ELEMENT

public:
    explicit udp(QObject *parent = Q_NULLPTR);

signals:
    void onReceivedPacket();
    // ----------------- UI SIGNALS -----------------
    // SET PARAMETERS
    void onASendChanged();
    void onBSendChanged();
    void onKMomentSendChanged();
    void onCruiseSendChanged();
    void onArrivalRadiusSendChanged();
    void onZigzagStepSendChanged();
    void onLookAheadSendChanged();

    // MODE 0
    void onThrustSendChanged();
    void onMomentSendChanged();
    void gotHome();

    // MODE 2
    void onTargetLat1Mode2Changed();
    void onTargetLng1Mode2Changed();
    void onTargetLat2Mode2Changed();
    void onTargetLng2Mode2Changed();
    void onTargetLat3Mode2Changed();
    void onTargetLng3Mode2Changed();
    void onTargetLat4Mode2Changed();
    void onTargetLng4Mode2Changed();

    // MODE 3
    void onTargetLat1Mode3Changed();
    void onTargetLng1Mode3Changed();
    void onTargetLat2Mode3Changed();
    void onTargetLng2Mode3Changed();

public slots:
    // --------------------------- SOCKET FUNCTIONS ---------------------------
    QString receivePacket();
    void sendPacket(quint16 port,QHostAddress sender,QString x);


private:
    QUdpSocket *socket;

    // --------------------------- CUSTOM FUNCTIONS ---------------------------
    QString num_to_udp_string (double _num, int _top_digit, int _lowest_decimal);

    // --------------------------- QML FUNCTIONS ---------------------------
    QString qmlReadPacket();

    // ----------------- QML read USV STATE -----------------
    bool qml_read_auto_mode();             // Index 0
    int qml_read_select_auto_mode();       // Index 1
    int qml_read_thrust();                 // Index 2
    int qml_read_moment();                 // Index 3
    int qml_read_speed_1();                // Index 4
    int qml_read_speed_2();                // Index 5
    float qml_read_usv_yaw();              // Index 6
    float qml_read_desire_yaw();           // Index 7
    float qml_read_yaw_error();            // Index 8
    float qml_read_distance();             // Index 9
    bool qml_read_arrival();               // Index 10
    int qml_read_step_no();                // Index 11
    int qml_read_current_target();         // Index 12
    bool qml_read_end_zigzag();            // Index 13
    bool qml_read_reach_A();               // Index 14
    double qml_read_usv_lat();             // Index 15
    double qml_read_usv_lng();             // Index 16
    bool qml_read_valid();                 // Index 17
    double qml_read_target_lat();          // Index 18
    double qml_read_target_lng();          // Index 19
    float qml_read_k_yaw_error();          // Index 20
    float qml_read_k_distance();           // Index 21
    float qml_read_a();                    // Index 22
    float qml_read_b();                    // Index 23
    float qml_read_k_moment();             // Index 24
    int qml_read_cruise();                 // Index 25
    float qml_read_arrival_radius();       // Index 26
    float qml_read_zigzag_step();          // Index 27
    float qml_read_look_ahead();           // Index 28

    // ----------------- QML WRITE -----------------
    // ------SET PARAMETERS ------
    float qml_write_a_send(float _val);                    // Index 22
    float qml_write_b_send(float _val);                    // Index 23
    float qml_write_k_moment_send(float _val);             // Index 24
    float qml_write_cruise_send(float _val);               // Index 25
    float qml_write_arrival_radius_send(float _val);       // Index 26
    float qml_write_zigzag_step_send(float _val);          // Index 27
    float qml_write_look_ahead_send(float _val);           // Index 28

    float qml_read_a_send();                                // Index 22
    float qml_read_b_send();                                // Index 23
    float qml_read_k_moment_send();                         // Index 24
    float qml_read_cruise_send();                           // Index 25
    float qml_read_arrival_radius_send();                   // Index 26
    float qml_read_zigzag_step_send();                      // Index 27
    float qml_read_look_ahead_send();                       // Index 28

    void send_parameters(bool _val);

    // ------ QT States: MODE 0 ------
    float qml_write_thrust_send(float _val);
    float qml_write_moment_send(float _val);

    float qml_read_thrust_send();
    float qml_read_moment_send();
    double qml_read_home_lat();
    double qml_read_home_lng();

    void send_manual(bool _val);
    void qml_get_home(bool _val);
    void send_home (bool _val);

    // ------ QT States: MODE 1 ------
    double qml_write_target_lat_mode_1(double _val);
    double qml_write_target_lng_mode_1(double _val);
    void send_mode_1 (bool _val);

    // ------ QT States: MODE 2 ------
    double qml_write_target_lat_1_mode_2(double _val);
    double qml_write_target_lng_1_mode_2(double _val);
    double qml_write_target_lat_2_mode_2(double _val);
    double qml_write_target_lng_2_mode_2(double _val);
    double qml_write_target_lat_3_mode_2(double _val);
    double qml_write_target_lng_3_mode_2(double _val);
    double qml_write_target_lat_4_mode_2(double _val);
    double qml_write_target_lng_4_mode_2(double _val);

    double qml_read_target_lat_1_mode_2 ();
    double qml_read_target_lng_1_mode_2 ();
    double qml_read_target_lat_2_mode_2 ();
    double qml_read_target_lng_2_mode_2 ();
    double qml_read_target_lat_3_mode_2 ();
    double qml_read_target_lng_3_mode_2 ();
    double qml_read_target_lat_4_mode_2 ();
    double qml_read_target_lng_4_mode_2 ();
    void send_mode_2 (bool _val);

    // ------ QT States: MODE 3 ------
    double qml_write_target_lat_1_mode_3(double _val);
    double qml_write_target_lng_1_mode_3(double _val);
    double qml_write_target_lat_2_mode_3(double _val);
    double qml_write_target_lng_2_mode_3(double _val);

    double qml_read_target_lat_1_mode_3 ();
    double qml_read_target_lng_1_mode_3 ();
    double qml_read_target_lat_2_mode_3 ();
    double qml_read_target_lng_2_mode_3 ();
    void send_mode_3 (bool _val);

    // --------------------------- TEMP VARIABLES ---------------------------
    float packet_value = 1;
    QString temp1;

    // --------------------------- IP ADDRESSES ---------------------------
    QString ip_laptop = "192.168.1.38";
    QString ip_controller = "192.168.1.52";

    // --------------------------- USV DATA ---------------------------
    QString udp_packet;
    QStringList usv_data;

    // ----------- QT STATES: INPUT FROM UI -----------
    // ------SET PARAMETERS ------
        float a_send;                    // Index 22
        float b_send;                    // Index 23
        float k_moment_send;             // Index 24
        float cruise_send;               // Index 25
        float arrival_radius_send;       // Index 26
        float zigzag_step_send;          // Index 27
        float look_ahead_send;           // Index 28

    // ------ QT States: MODE 0 ------
        float thrust_send;
        float moment_send;
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

};

#endif // UDP_H
