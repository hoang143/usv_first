/****************************************************************************
** Meta object code from reading C++ file 'udp.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../../QtApp/udp.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'udp.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_udp_t {
    QByteArrayData data[100];
    char stringdata0[1322];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_udp_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_udp_t qt_meta_stringdata_udp = {
    {
QT_MOC_LITERAL(0, 0, 3), // "udp"
QT_MOC_LITERAL(1, 4, 11), // "QML.Element"
QT_MOC_LITERAL(2, 16, 4), // "auto"
QT_MOC_LITERAL(3, 21, 16), // "onReceivedPacket"
QT_MOC_LITERAL(4, 38, 0), // ""
QT_MOC_LITERAL(5, 39, 14), // "onASendChanged"
QT_MOC_LITERAL(6, 54, 14), // "onBSendChanged"
QT_MOC_LITERAL(7, 69, 20), // "onKMomentSendChanged"
QT_MOC_LITERAL(8, 90, 19), // "onCruiseSendChanged"
QT_MOC_LITERAL(9, 110, 26), // "onArrivalRadiusSendChanged"
QT_MOC_LITERAL(10, 137, 23), // "onZigzagStepSendChanged"
QT_MOC_LITERAL(11, 161, 22), // "onLookAheadSendChanged"
QT_MOC_LITERAL(12, 184, 19), // "onThrustSendChanged"
QT_MOC_LITERAL(13, 204, 19), // "onMomentSendChanged"
QT_MOC_LITERAL(14, 224, 7), // "gotHome"
QT_MOC_LITERAL(15, 232, 24), // "onTargetLat1Mode2Changed"
QT_MOC_LITERAL(16, 257, 24), // "onTargetLng1Mode2Changed"
QT_MOC_LITERAL(17, 282, 24), // "onTargetLat2Mode2Changed"
QT_MOC_LITERAL(18, 307, 24), // "onTargetLng2Mode2Changed"
QT_MOC_LITERAL(19, 332, 24), // "onTargetLat3Mode2Changed"
QT_MOC_LITERAL(20, 357, 24), // "onTargetLng3Mode2Changed"
QT_MOC_LITERAL(21, 382, 24), // "onTargetLat4Mode2Changed"
QT_MOC_LITERAL(22, 407, 24), // "onTargetLng4Mode2Changed"
QT_MOC_LITERAL(23, 432, 24), // "onTargetLat1Mode3Changed"
QT_MOC_LITERAL(24, 457, 24), // "onTargetLng1Mode3Changed"
QT_MOC_LITERAL(25, 482, 24), // "onTargetLat2Mode3Changed"
QT_MOC_LITERAL(26, 507, 24), // "onTargetLng2Mode3Changed"
QT_MOC_LITERAL(27, 532, 13), // "receivePacket"
QT_MOC_LITERAL(28, 546, 10), // "sendPacket"
QT_MOC_LITERAL(29, 557, 4), // "port"
QT_MOC_LITERAL(30, 562, 12), // "QHostAddress"
QT_MOC_LITERAL(31, 575, 6), // "sender"
QT_MOC_LITERAL(32, 582, 1), // "x"
QT_MOC_LITERAL(33, 584, 9), // "udpPacket"
QT_MOC_LITERAL(34, 594, 8), // "autoMode"
QT_MOC_LITERAL(35, 603, 14), // "selectAutoMode"
QT_MOC_LITERAL(36, 618, 6), // "thrust"
QT_MOC_LITERAL(37, 625, 6), // "moment"
QT_MOC_LITERAL(38, 632, 6), // "speed1"
QT_MOC_LITERAL(39, 639, 6), // "speed2"
QT_MOC_LITERAL(40, 646, 6), // "usvYaw"
QT_MOC_LITERAL(41, 653, 9), // "desireYaw"
QT_MOC_LITERAL(42, 663, 8), // "yawError"
QT_MOC_LITERAL(43, 672, 8), // "distance"
QT_MOC_LITERAL(44, 681, 7), // "arrival"
QT_MOC_LITERAL(45, 689, 6), // "stepNo"
QT_MOC_LITERAL(46, 696, 13), // "currentTarget"
QT_MOC_LITERAL(47, 710, 9), // "endZigzag"
QT_MOC_LITERAL(48, 720, 6), // "reachA"
QT_MOC_LITERAL(49, 727, 6), // "usvLat"
QT_MOC_LITERAL(50, 734, 6), // "usvLng"
QT_MOC_LITERAL(51, 741, 5), // "valid"
QT_MOC_LITERAL(52, 747, 9), // "targetLat"
QT_MOC_LITERAL(53, 757, 9), // "targetLng"
QT_MOC_LITERAL(54, 767, 9), // "kYawError"
QT_MOC_LITERAL(55, 777, 9), // "kDistance"
QT_MOC_LITERAL(56, 787, 1), // "a"
QT_MOC_LITERAL(57, 789, 1), // "b"
QT_MOC_LITERAL(58, 791, 7), // "kMoment"
QT_MOC_LITERAL(59, 799, 6), // "cruise"
QT_MOC_LITERAL(60, 806, 13), // "arrivalRadius"
QT_MOC_LITERAL(61, 820, 10), // "zigzagStep"
QT_MOC_LITERAL(62, 831, 9), // "lookAhead"
QT_MOC_LITERAL(63, 841, 10), // "voltageBat"
QT_MOC_LITERAL(64, 852, 5), // "depth"
QT_MOC_LITERAL(65, 858, 15), // "depthConfidence"
QT_MOC_LITERAL(66, 874, 17), // "batteryPercentage"
QT_MOC_LITERAL(67, 892, 14), // "distanceToHome"
QT_MOC_LITERAL(68, 907, 5), // "aSend"
QT_MOC_LITERAL(69, 913, 5), // "bSend"
QT_MOC_LITERAL(70, 919, 11), // "kMomentSend"
QT_MOC_LITERAL(71, 931, 10), // "cruiseSend"
QT_MOC_LITERAL(72, 942, 17), // "arrivalRadiusSend"
QT_MOC_LITERAL(73, 960, 14), // "zigzagStepSend"
QT_MOC_LITERAL(74, 975, 13), // "lookAheadSend"
QT_MOC_LITERAL(75, 989, 14), // "sendParameters"
QT_MOC_LITERAL(76, 1004, 10), // "thrustSend"
QT_MOC_LITERAL(77, 1015, 10), // "momentSend"
QT_MOC_LITERAL(78, 1026, 10), // "sendManual"
QT_MOC_LITERAL(79, 1037, 7), // "homeLat"
QT_MOC_LITERAL(80, 1045, 7), // "homeLng"
QT_MOC_LITERAL(81, 1053, 7), // "getHome"
QT_MOC_LITERAL(82, 1061, 8), // "sendHome"
QT_MOC_LITERAL(83, 1070, 14), // "targetLatMode1"
QT_MOC_LITERAL(84, 1085, 14), // "targetLngMode1"
QT_MOC_LITERAL(85, 1100, 9), // "sendMode1"
QT_MOC_LITERAL(86, 1110, 15), // "targetLat1Mode2"
QT_MOC_LITERAL(87, 1126, 15), // "targetLng1Mode2"
QT_MOC_LITERAL(88, 1142, 15), // "targetLat2Mode2"
QT_MOC_LITERAL(89, 1158, 15), // "targetLng2Mode2"
QT_MOC_LITERAL(90, 1174, 15), // "targetLat3Mode2"
QT_MOC_LITERAL(91, 1190, 15), // "targetLng3Mode2"
QT_MOC_LITERAL(92, 1206, 15), // "targetLat4Mode2"
QT_MOC_LITERAL(93, 1222, 15), // "targetLng4Mode2"
QT_MOC_LITERAL(94, 1238, 9), // "sendMode2"
QT_MOC_LITERAL(95, 1248, 15), // "targetLat1Mode3"
QT_MOC_LITERAL(96, 1264, 15), // "targetLng1Mode3"
QT_MOC_LITERAL(97, 1280, 15), // "targetLat2Mode3"
QT_MOC_LITERAL(98, 1296, 15), // "targetLng2Mode3"
QT_MOC_LITERAL(99, 1312, 9) // "sendMode3"

    },
    "udp\0QML.Element\0auto\0onReceivedPacket\0"
    "\0onASendChanged\0onBSendChanged\0"
    "onKMomentSendChanged\0onCruiseSendChanged\0"
    "onArrivalRadiusSendChanged\0"
    "onZigzagStepSendChanged\0onLookAheadSendChanged\0"
    "onThrustSendChanged\0onMomentSendChanged\0"
    "gotHome\0onTargetLat1Mode2Changed\0"
    "onTargetLng1Mode2Changed\0"
    "onTargetLat2Mode2Changed\0"
    "onTargetLng2Mode2Changed\0"
    "onTargetLat3Mode2Changed\0"
    "onTargetLng3Mode2Changed\0"
    "onTargetLat4Mode2Changed\0"
    "onTargetLng4Mode2Changed\0"
    "onTargetLat1Mode3Changed\0"
    "onTargetLng1Mode3Changed\0"
    "onTargetLat2Mode3Changed\0"
    "onTargetLng2Mode3Changed\0receivePacket\0"
    "sendPacket\0port\0QHostAddress\0sender\0"
    "x\0udpPacket\0autoMode\0selectAutoMode\0"
    "thrust\0moment\0speed1\0speed2\0usvYaw\0"
    "desireYaw\0yawError\0distance\0arrival\0"
    "stepNo\0currentTarget\0endZigzag\0reachA\0"
    "usvLat\0usvLng\0valid\0targetLat\0targetLng\0"
    "kYawError\0kDistance\0a\0b\0kMoment\0cruise\0"
    "arrivalRadius\0zigzagStep\0lookAhead\0"
    "voltageBat\0depth\0depthConfidence\0"
    "batteryPercentage\0distanceToHome\0aSend\0"
    "bSend\0kMomentSend\0cruiseSend\0"
    "arrivalRadiusSend\0zigzagStepSend\0"
    "lookAheadSend\0sendParameters\0thrustSend\0"
    "momentSend\0sendManual\0homeLat\0homeLng\0"
    "getHome\0sendHome\0targetLatMode1\0"
    "targetLngMode1\0sendMode1\0targetLat1Mode2\0"
    "targetLng1Mode2\0targetLat2Mode2\0"
    "targetLng2Mode2\0targetLat3Mode2\0"
    "targetLng3Mode2\0targetLat4Mode2\0"
    "targetLng4Mode2\0sendMode2\0targetLat1Mode3\0"
    "targetLng1Mode3\0targetLat2Mode3\0"
    "targetLng2Mode3\0sendMode3"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_udp[] = {

 // content:
       8,       // revision
       0,       // classname
       1,   14, // classinfo
      25,   16, // methods
      67,  172, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
      23,       // signalCount

 // classinfo: key, value
       1,    2,

 // signals: name, argc, parameters, tag, flags
       3,    0,  141,    4, 0x06 /* Public */,
       5,    0,  142,    4, 0x06 /* Public */,
       6,    0,  143,    4, 0x06 /* Public */,
       7,    0,  144,    4, 0x06 /* Public */,
       8,    0,  145,    4, 0x06 /* Public */,
       9,    0,  146,    4, 0x06 /* Public */,
      10,    0,  147,    4, 0x06 /* Public */,
      11,    0,  148,    4, 0x06 /* Public */,
      12,    0,  149,    4, 0x06 /* Public */,
      13,    0,  150,    4, 0x06 /* Public */,
      14,    0,  151,    4, 0x06 /* Public */,
      15,    0,  152,    4, 0x06 /* Public */,
      16,    0,  153,    4, 0x06 /* Public */,
      17,    0,  154,    4, 0x06 /* Public */,
      18,    0,  155,    4, 0x06 /* Public */,
      19,    0,  156,    4, 0x06 /* Public */,
      20,    0,  157,    4, 0x06 /* Public */,
      21,    0,  158,    4, 0x06 /* Public */,
      22,    0,  159,    4, 0x06 /* Public */,
      23,    0,  160,    4, 0x06 /* Public */,
      24,    0,  161,    4, 0x06 /* Public */,
      25,    0,  162,    4, 0x06 /* Public */,
      26,    0,  163,    4, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
      27,    0,  164,    4, 0x0a /* Public */,
      28,    3,  165,    4, 0x0a /* Public */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

 // slots: parameters
    QMetaType::QString,
    QMetaType::Void, QMetaType::UShort, 0x80000000 | 30, QMetaType::QString,   29,   31,   32,

 // properties: name, type, flags
      33, QMetaType::QString, 0x00495001,
      34, QMetaType::Float, 0x00495001,
      35, QMetaType::Float, 0x00495001,
      36, QMetaType::Float, 0x00495001,
      37, QMetaType::Float, 0x00495001,
      38, QMetaType::Float, 0x00495001,
      39, QMetaType::Float, 0x00495001,
      40, QMetaType::Float, 0x00495001,
      41, QMetaType::Float, 0x00495001,
      42, QMetaType::Float, 0x00495001,
      43, QMetaType::Float, 0x00495001,
      44, QMetaType::Float, 0x00495001,
      45, QMetaType::Float, 0x00495001,
      46, QMetaType::Float, 0x00495001,
      47, QMetaType::Float, 0x00495001,
      48, QMetaType::Float, 0x00495001,
      49, QMetaType::Float, 0x00495001,
      50, QMetaType::Float, 0x00495001,
      51, QMetaType::Float, 0x00495001,
      52, QMetaType::Float, 0x00495001,
      53, QMetaType::Float, 0x00495001,
      54, QMetaType::Float, 0x00495001,
      55, QMetaType::Float, 0x00495001,
      56, QMetaType::Float, 0x00495001,
      57, QMetaType::Float, 0x00495001,
      58, QMetaType::Float, 0x00495001,
      59, QMetaType::Float, 0x00495001,
      60, QMetaType::Float, 0x00495001,
      61, QMetaType::Float, 0x00495001,
      62, QMetaType::Float, 0x00495001,
      63, QMetaType::Float, 0x00495001,
      64, QMetaType::Float, 0x00495001,
      65, QMetaType::Float, 0x00495001,
      66, QMetaType::Float, 0x00495001,
      67, QMetaType::Float, 0x00495001,
      68, QMetaType::Float, 0x00495003,
      69, QMetaType::Float, 0x00495003,
      70, QMetaType::Float, 0x00495003,
      71, QMetaType::Float, 0x00495003,
      72, QMetaType::Float, 0x00495003,
      73, QMetaType::Float, 0x00495003,
      74, QMetaType::Float, 0x00495003,
      75, QMetaType::Bool, 0x00095002,
      76, QMetaType::Float, 0x00495003,
      77, QMetaType::Float, 0x00495003,
      78, QMetaType::Bool, 0x00095002,
      79, QMetaType::Float, 0x00495001,
      80, QMetaType::Float, 0x00495001,
      81, QMetaType::Bool, 0x00095002,
      82, QMetaType::Bool, 0x00095002,
      83, QMetaType::Float, 0x00095002,
      84, QMetaType::Float, 0x00095002,
      85, QMetaType::Bool, 0x00095002,
      86, QMetaType::Double, 0x00495003,
      87, QMetaType::Double, 0x00495003,
      88, QMetaType::Double, 0x00495003,
      89, QMetaType::Double, 0x00495003,
      90, QMetaType::Double, 0x00495003,
      91, QMetaType::Double, 0x00495003,
      92, QMetaType::Double, 0x00495003,
      93, QMetaType::Double, 0x00495003,
      94, QMetaType::Bool, 0x00095002,
      95, QMetaType::Double, 0x00495003,
      96, QMetaType::Double, 0x00495003,
      97, QMetaType::Double, 0x00495003,
      98, QMetaType::Double, 0x00495003,
      99, QMetaType::Bool, 0x00095002,

 // properties: notify_signal_id
       0,
       0,
       0,
       0,
       0,
       0,
       0,
       0,
       0,
       0,
       0,
       0,
       0,
       0,
       0,
       0,
       0,
       0,
       0,
       0,
       0,
       0,
       0,
       0,
       0,
       0,
       0,
       0,
       0,
       0,
       0,
       0,
       0,
       0,
       0,
       1,
       2,
       3,
       4,
       5,
       6,
       7,
       0,
       8,
       9,
       0,
      10,
      10,
       0,
       0,
       0,
       0,
       0,
      11,
      12,
      13,
      14,
      15,
      16,
      17,
      18,
       0,
      19,
      20,
      21,
      22,
       0,

       0        // eod
};

void udp::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<udp *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->onReceivedPacket(); break;
        case 1: _t->onASendChanged(); break;
        case 2: _t->onBSendChanged(); break;
        case 3: _t->onKMomentSendChanged(); break;
        case 4: _t->onCruiseSendChanged(); break;
        case 5: _t->onArrivalRadiusSendChanged(); break;
        case 6: _t->onZigzagStepSendChanged(); break;
        case 7: _t->onLookAheadSendChanged(); break;
        case 8: _t->onThrustSendChanged(); break;
        case 9: _t->onMomentSendChanged(); break;
        case 10: _t->gotHome(); break;
        case 11: _t->onTargetLat1Mode2Changed(); break;
        case 12: _t->onTargetLng1Mode2Changed(); break;
        case 13: _t->onTargetLat2Mode2Changed(); break;
        case 14: _t->onTargetLng2Mode2Changed(); break;
        case 15: _t->onTargetLat3Mode2Changed(); break;
        case 16: _t->onTargetLng3Mode2Changed(); break;
        case 17: _t->onTargetLat4Mode2Changed(); break;
        case 18: _t->onTargetLng4Mode2Changed(); break;
        case 19: _t->onTargetLat1Mode3Changed(); break;
        case 20: _t->onTargetLng1Mode3Changed(); break;
        case 21: _t->onTargetLat2Mode3Changed(); break;
        case 22: _t->onTargetLng2Mode3Changed(); break;
        case 23: { QString _r = _t->receivePacket();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 24: _t->sendPacket((*reinterpret_cast< quint16(*)>(_a[1])),(*reinterpret_cast< QHostAddress(*)>(_a[2])),(*reinterpret_cast< QString(*)>(_a[3]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (udp::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&udp::onReceivedPacket)) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (udp::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&udp::onASendChanged)) {
                *result = 1;
                return;
            }
        }
        {
            using _t = void (udp::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&udp::onBSendChanged)) {
                *result = 2;
                return;
            }
        }
        {
            using _t = void (udp::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&udp::onKMomentSendChanged)) {
                *result = 3;
                return;
            }
        }
        {
            using _t = void (udp::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&udp::onCruiseSendChanged)) {
                *result = 4;
                return;
            }
        }
        {
            using _t = void (udp::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&udp::onArrivalRadiusSendChanged)) {
                *result = 5;
                return;
            }
        }
        {
            using _t = void (udp::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&udp::onZigzagStepSendChanged)) {
                *result = 6;
                return;
            }
        }
        {
            using _t = void (udp::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&udp::onLookAheadSendChanged)) {
                *result = 7;
                return;
            }
        }
        {
            using _t = void (udp::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&udp::onThrustSendChanged)) {
                *result = 8;
                return;
            }
        }
        {
            using _t = void (udp::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&udp::onMomentSendChanged)) {
                *result = 9;
                return;
            }
        }
        {
            using _t = void (udp::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&udp::gotHome)) {
                *result = 10;
                return;
            }
        }
        {
            using _t = void (udp::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&udp::onTargetLat1Mode2Changed)) {
                *result = 11;
                return;
            }
        }
        {
            using _t = void (udp::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&udp::onTargetLng1Mode2Changed)) {
                *result = 12;
                return;
            }
        }
        {
            using _t = void (udp::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&udp::onTargetLat2Mode2Changed)) {
                *result = 13;
                return;
            }
        }
        {
            using _t = void (udp::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&udp::onTargetLng2Mode2Changed)) {
                *result = 14;
                return;
            }
        }
        {
            using _t = void (udp::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&udp::onTargetLat3Mode2Changed)) {
                *result = 15;
                return;
            }
        }
        {
            using _t = void (udp::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&udp::onTargetLng3Mode2Changed)) {
                *result = 16;
                return;
            }
        }
        {
            using _t = void (udp::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&udp::onTargetLat4Mode2Changed)) {
                *result = 17;
                return;
            }
        }
        {
            using _t = void (udp::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&udp::onTargetLng4Mode2Changed)) {
                *result = 18;
                return;
            }
        }
        {
            using _t = void (udp::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&udp::onTargetLat1Mode3Changed)) {
                *result = 19;
                return;
            }
        }
        {
            using _t = void (udp::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&udp::onTargetLng1Mode3Changed)) {
                *result = 20;
                return;
            }
        }
        {
            using _t = void (udp::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&udp::onTargetLat2Mode3Changed)) {
                *result = 21;
                return;
            }
        }
        {
            using _t = void (udp::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&udp::onTargetLng2Mode3Changed)) {
                *result = 22;
                return;
            }
        }
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        auto *_t = static_cast<udp *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QString*>(_v) = _t->qmlReadPacket(); break;
        case 1: *reinterpret_cast< float*>(_v) = _t->qml_read_auto_mode(); break;
        case 2: *reinterpret_cast< float*>(_v) = _t->qml_read_select_auto_mode(); break;
        case 3: *reinterpret_cast< float*>(_v) = _t->qml_read_thrust(); break;
        case 4: *reinterpret_cast< float*>(_v) = _t->qml_read_moment(); break;
        case 5: *reinterpret_cast< float*>(_v) = _t->qml_read_speed_1(); break;
        case 6: *reinterpret_cast< float*>(_v) = _t->qml_read_speed_2(); break;
        case 7: *reinterpret_cast< float*>(_v) = _t->qml_read_usv_yaw(); break;
        case 8: *reinterpret_cast< float*>(_v) = _t->qml_read_desire_yaw(); break;
        case 9: *reinterpret_cast< float*>(_v) = _t->qml_read_yaw_error(); break;
        case 10: *reinterpret_cast< float*>(_v) = _t->qml_read_distance(); break;
        case 11: *reinterpret_cast< float*>(_v) = _t->qml_read_arrival(); break;
        case 12: *reinterpret_cast< float*>(_v) = _t->qml_read_step_no(); break;
        case 13: *reinterpret_cast< float*>(_v) = _t->qml_read_current_target(); break;
        case 14: *reinterpret_cast< float*>(_v) = _t->qml_read_end_zigzag(); break;
        case 15: *reinterpret_cast< float*>(_v) = _t->qml_read_reach_A(); break;
        case 16: *reinterpret_cast< float*>(_v) = _t->qml_read_usv_lat(); break;
        case 17: *reinterpret_cast< float*>(_v) = _t->qml_read_usv_lng(); break;
        case 18: *reinterpret_cast< float*>(_v) = _t->qml_read_valid(); break;
        case 19: *reinterpret_cast< float*>(_v) = _t->qml_read_target_lat(); break;
        case 20: *reinterpret_cast< float*>(_v) = _t->qml_read_target_lng(); break;
        case 21: *reinterpret_cast< float*>(_v) = _t->qml_read_k_yaw_error(); break;
        case 22: *reinterpret_cast< float*>(_v) = _t->qml_read_k_distance(); break;
        case 23: *reinterpret_cast< float*>(_v) = _t->qml_read_a(); break;
        case 24: *reinterpret_cast< float*>(_v) = _t->qml_read_b(); break;
        case 25: *reinterpret_cast< float*>(_v) = _t->qml_read_k_moment(); break;
        case 26: *reinterpret_cast< float*>(_v) = _t->qml_read_cruise(); break;
        case 27: *reinterpret_cast< float*>(_v) = _t->qml_read_arrival_radius(); break;
        case 28: *reinterpret_cast< float*>(_v) = _t->qml_read_zigzag_step(); break;
        case 29: *reinterpret_cast< float*>(_v) = _t->qml_read_look_ahead(); break;
        case 30: *reinterpret_cast< float*>(_v) = _t->qml_read_voltage_bat(); break;
        case 31: *reinterpret_cast< float*>(_v) = _t->qml_read_depth(); break;
        case 32: *reinterpret_cast< float*>(_v) = _t->qml_read_depth_confidence(); break;
        case 33: *reinterpret_cast< float*>(_v) = _t->qml_read_battery_percentage(); break;
        case 34: *reinterpret_cast< float*>(_v) = _t->qml_read_distance_to_home(); break;
        case 35: *reinterpret_cast< float*>(_v) = _t->qml_read_a_send(); break;
        case 36: *reinterpret_cast< float*>(_v) = _t->qml_read_b_send(); break;
        case 37: *reinterpret_cast< float*>(_v) = _t->qml_read_k_moment_send(); break;
        case 38: *reinterpret_cast< float*>(_v) = _t->qml_read_cruise_send(); break;
        case 39: *reinterpret_cast< float*>(_v) = _t->qml_read_arrival_radius_send(); break;
        case 40: *reinterpret_cast< float*>(_v) = _t->qml_read_zigzag_step_send(); break;
        case 41: *reinterpret_cast< float*>(_v) = _t->qml_read_look_ahead_send(); break;
        case 43: *reinterpret_cast< float*>(_v) = _t->qml_read_thrust_send(); break;
        case 44: *reinterpret_cast< float*>(_v) = _t->qml_read_moment_send(); break;
        case 46: *reinterpret_cast< float*>(_v) = _t->qml_read_home_lat(); break;
        case 47: *reinterpret_cast< float*>(_v) = _t->qml_read_home_lng(); break;
        case 53: *reinterpret_cast< double*>(_v) = _t->qml_read_target_lat_1_mode_2(); break;
        case 54: *reinterpret_cast< double*>(_v) = _t->qml_read_target_lng_1_mode_2(); break;
        case 55: *reinterpret_cast< double*>(_v) = _t->qml_read_target_lat_2_mode_2(); break;
        case 56: *reinterpret_cast< double*>(_v) = _t->qml_read_target_lng_2_mode_2(); break;
        case 57: *reinterpret_cast< double*>(_v) = _t->qml_read_target_lat_3_mode_2(); break;
        case 58: *reinterpret_cast< double*>(_v) = _t->qml_read_target_lng_3_mode_2(); break;
        case 59: *reinterpret_cast< double*>(_v) = _t->qml_read_target_lat_4_mode_2(); break;
        case 60: *reinterpret_cast< double*>(_v) = _t->qml_read_target_lng_4_mode_2(); break;
        case 62: *reinterpret_cast< double*>(_v) = _t->qml_read_target_lat_1_mode_3(); break;
        case 63: *reinterpret_cast< double*>(_v) = _t->qml_read_target_lng_1_mode_3(); break;
        case 64: *reinterpret_cast< double*>(_v) = _t->qml_read_target_lat_2_mode_3(); break;
        case 65: *reinterpret_cast< double*>(_v) = _t->qml_read_target_lng_2_mode_3(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        auto *_t = static_cast<udp *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 35: _t->qml_write_a_send(*reinterpret_cast< float*>(_v)); break;
        case 36: _t->qml_write_b_send(*reinterpret_cast< float*>(_v)); break;
        case 37: _t->qml_write_k_moment_send(*reinterpret_cast< float*>(_v)); break;
        case 38: _t->qml_write_cruise_send(*reinterpret_cast< float*>(_v)); break;
        case 39: _t->qml_write_arrival_radius_send(*reinterpret_cast< float*>(_v)); break;
        case 40: _t->qml_write_zigzag_step_send(*reinterpret_cast< float*>(_v)); break;
        case 41: _t->qml_write_look_ahead_send(*reinterpret_cast< float*>(_v)); break;
        case 42: _t->send_parameters(*reinterpret_cast< bool*>(_v)); break;
        case 43: _t->qml_write_thrust_send(*reinterpret_cast< float*>(_v)); break;
        case 44: _t->qml_write_moment_send(*reinterpret_cast< float*>(_v)); break;
        case 45: _t->send_manual(*reinterpret_cast< bool*>(_v)); break;
        case 48: _t->qml_get_home(*reinterpret_cast< bool*>(_v)); break;
        case 49: _t->send_home(*reinterpret_cast< bool*>(_v)); break;
        case 50: _t->qml_write_target_lat_mode_1(*reinterpret_cast< float*>(_v)); break;
        case 51: _t->qml_write_target_lng_mode_1(*reinterpret_cast< float*>(_v)); break;
        case 52: _t->send_mode_1(*reinterpret_cast< bool*>(_v)); break;
        case 53: _t->qml_write_target_lat_1_mode_2(*reinterpret_cast< double*>(_v)); break;
        case 54: _t->qml_write_target_lng_1_mode_2(*reinterpret_cast< double*>(_v)); break;
        case 55: _t->qml_write_target_lat_2_mode_2(*reinterpret_cast< double*>(_v)); break;
        case 56: _t->qml_write_target_lng_2_mode_2(*reinterpret_cast< double*>(_v)); break;
        case 57: _t->qml_write_target_lat_3_mode_2(*reinterpret_cast< double*>(_v)); break;
        case 58: _t->qml_write_target_lng_3_mode_2(*reinterpret_cast< double*>(_v)); break;
        case 59: _t->qml_write_target_lat_4_mode_2(*reinterpret_cast< double*>(_v)); break;
        case 60: _t->qml_write_target_lng_4_mode_2(*reinterpret_cast< double*>(_v)); break;
        case 61: _t->send_mode_2(*reinterpret_cast< bool*>(_v)); break;
        case 62: _t->qml_write_target_lat_1_mode_3(*reinterpret_cast< double*>(_v)); break;
        case 63: _t->qml_write_target_lng_1_mode_3(*reinterpret_cast< double*>(_v)); break;
        case 64: _t->qml_write_target_lat_2_mode_3(*reinterpret_cast< double*>(_v)); break;
        case 65: _t->qml_write_target_lng_2_mode_3(*reinterpret_cast< double*>(_v)); break;
        case 66: _t->send_mode_3(*reinterpret_cast< bool*>(_v)); break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
}

QT_INIT_METAOBJECT const QMetaObject udp::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_udp.data,
    qt_meta_data_udp,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *udp::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *udp::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_udp.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int udp::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 25)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 25;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 25)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 25;
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 67;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 67;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 67;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 67;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 67;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 67;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void udp::onReceivedPacket()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void udp::onASendChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void udp::onBSendChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 2, nullptr);
}

// SIGNAL 3
void udp::onKMomentSendChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 3, nullptr);
}

// SIGNAL 4
void udp::onCruiseSendChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 4, nullptr);
}

// SIGNAL 5
void udp::onArrivalRadiusSendChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 5, nullptr);
}

// SIGNAL 6
void udp::onZigzagStepSendChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 6, nullptr);
}

// SIGNAL 7
void udp::onLookAheadSendChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 7, nullptr);
}

// SIGNAL 8
void udp::onThrustSendChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 8, nullptr);
}

// SIGNAL 9
void udp::onMomentSendChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 9, nullptr);
}

// SIGNAL 10
void udp::gotHome()
{
    QMetaObject::activate(this, &staticMetaObject, 10, nullptr);
}

// SIGNAL 11
void udp::onTargetLat1Mode2Changed()
{
    QMetaObject::activate(this, &staticMetaObject, 11, nullptr);
}

// SIGNAL 12
void udp::onTargetLng1Mode2Changed()
{
    QMetaObject::activate(this, &staticMetaObject, 12, nullptr);
}

// SIGNAL 13
void udp::onTargetLat2Mode2Changed()
{
    QMetaObject::activate(this, &staticMetaObject, 13, nullptr);
}

// SIGNAL 14
void udp::onTargetLng2Mode2Changed()
{
    QMetaObject::activate(this, &staticMetaObject, 14, nullptr);
}

// SIGNAL 15
void udp::onTargetLat3Mode2Changed()
{
    QMetaObject::activate(this, &staticMetaObject, 15, nullptr);
}

// SIGNAL 16
void udp::onTargetLng3Mode2Changed()
{
    QMetaObject::activate(this, &staticMetaObject, 16, nullptr);
}

// SIGNAL 17
void udp::onTargetLat4Mode2Changed()
{
    QMetaObject::activate(this, &staticMetaObject, 17, nullptr);
}

// SIGNAL 18
void udp::onTargetLng4Mode2Changed()
{
    QMetaObject::activate(this, &staticMetaObject, 18, nullptr);
}

// SIGNAL 19
void udp::onTargetLat1Mode3Changed()
{
    QMetaObject::activate(this, &staticMetaObject, 19, nullptr);
}

// SIGNAL 20
void udp::onTargetLng1Mode3Changed()
{
    QMetaObject::activate(this, &staticMetaObject, 20, nullptr);
}

// SIGNAL 21
void udp::onTargetLat2Mode3Changed()
{
    QMetaObject::activate(this, &staticMetaObject, 21, nullptr);
}

// SIGNAL 22
void udp::onTargetLng2Mode3Changed()
{
    QMetaObject::activate(this, &staticMetaObject, 22, nullptr);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
