/****************************************************************************
** Meta object code from reading C++ file 'udp.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../udp.h"
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
    QByteArrayData data[10];
    char stringdata0[63];
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
QT_MOC_LITERAL(3, 21, 6), // "callMe"
QT_MOC_LITERAL(4, 28, 0), // ""
QT_MOC_LITERAL(5, 29, 1), // "x"
QT_MOC_LITERAL(6, 31, 8), // "sendData"
QT_MOC_LITERAL(7, 40, 4), // "show"
QT_MOC_LITERAL(8, 45, 5), // "start"
QT_MOC_LITERAL(9, 51, 11) // "qmlReadData"

    },
    "udp\0QML.Element\0auto\0callMe\0\0x\0sendData\0"
    "show\0start\0qmlReadData"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_udp[] = {

 // content:
       8,       // revision
       0,       // classname
       1,   14, // classinfo
       4,   16, // methods
       1,   42, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // classinfo: key, value
       1,    2,

 // slots: name, argc, parameters, tag, flags
       3,    1,   36,    4, 0x0a /* Public */,
       6,    0,   39,    4, 0x0a /* Public */,
       7,    0,   40,    4, 0x0a /* Public */,

 // methods: name, argc, parameters, tag, flags
       8,    0,   41,    4, 0x02 /* Public */,

 // slots: parameters
    QMetaType::Void, QMetaType::Double,    5,
    QMetaType::Void,
    QMetaType::QVariant,

 // methods: parameters
    QMetaType::Void,

 // properties: name, type, flags
       9, QMetaType::Float, 0x00095003,

       0        // eod
};

void udp::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<udp *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->callMe((*reinterpret_cast< double(*)>(_a[1]))); break;
        case 1: _t->sendData(); break;
        case 2: { QVariant _r = _t->show();
            if (_a[0]) *reinterpret_cast< QVariant*>(_a[0]) = std::move(_r); }  break;
        case 3: _t->start(); break;
        default: ;
        }
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        auto *_t = static_cast<udp *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< float*>(_v) = _t->qmlReadData(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        auto *_t = static_cast<udp *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->qmlWriteData(*reinterpret_cast< float*>(_v)); break;
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
        if (_id < 4)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 4;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 4)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 4;
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 1;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
