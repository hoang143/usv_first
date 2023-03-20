/****************************************************************************
** Meta object code from reading C++ file 'liveimageprovider.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../liveimageprovider.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'liveimageprovider.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_LiveImageProvider_t {
    QByteArrayData data[7];
    char stringdata0[77];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_LiveImageProvider_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_LiveImageProvider_t qt_meta_stringdata_LiveImageProvider = {
    {
QT_MOC_LITERAL(0, 0, 17), // "LiveImageProvider"
QT_MOC_LITERAL(1, 18, 12), // "imageChanged"
QT_MOC_LITERAL(2, 31, 0), // ""
QT_MOC_LITERAL(3, 32, 11), // "updateImage"
QT_MOC_LITERAL(4, 44, 5), // "image"
QT_MOC_LITERAL(5, 50, 12), // "checkTheSame"
QT_MOC_LITERAL(6, 63, 13) // "readDatagrams"

    },
    "LiveImageProvider\0imageChanged\0\0"
    "updateImage\0image\0checkTheSame\0"
    "readDatagrams"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_LiveImageProvider[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       4,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       1,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    0,   34,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
       3,    2,   35,    2, 0x0a /* Public */,
       3,    1,   40,    2, 0x2a /* Public | MethodCloned */,
       6,    0,   43,    2, 0x0a /* Public */,

 // signals: parameters
    QMetaType::Void,

 // slots: parameters
    QMetaType::Void, QMetaType::QImage, QMetaType::Bool,    4,    5,
    QMetaType::Void, QMetaType::QImage,    4,
    QMetaType::Void,

       0        // eod
};

void LiveImageProvider::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<LiveImageProvider *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->imageChanged(); break;
        case 1: _t->updateImage((*reinterpret_cast< const QImage(*)>(_a[1])),(*reinterpret_cast< bool(*)>(_a[2]))); break;
        case 2: _t->updateImage((*reinterpret_cast< const QImage(*)>(_a[1]))); break;
        case 3: _t->readDatagrams(); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (LiveImageProvider::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&LiveImageProvider::imageChanged)) {
                *result = 0;
                return;
            }
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject LiveImageProvider::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_LiveImageProvider.data,
    qt_meta_data_LiveImageProvider,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *LiveImageProvider::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *LiveImageProvider::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_LiveImageProvider.stringdata0))
        return static_cast<void*>(this);
    if (!strcmp(_clname, "QQuickImageProvider"))
        return static_cast< QQuickImageProvider*>(this);
    return QObject::qt_metacast(_clname);
}

int LiveImageProvider::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
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
    return _id;
}

// SIGNAL 0
void LiveImageProvider::imageChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
