/****************************************************************************
** Meta object code from reading C++ file 'logfile.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../logfile.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'logfile.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_LogFile_t {
    QByteArrayData data[13];
    char stringdata0[169];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_LogFile_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_LogFile_t qt_meta_stringdata_LogFile = {
    {
QT_MOC_LITERAL(0, 0, 7), // "LogFile"
QT_MOC_LITERAL(1, 8, 13), // "onPathChanged"
QT_MOC_LITERAL(2, 22, 0), // ""
QT_MOC_LITERAL(3, 23, 13), // "onDataChanged"
QT_MOC_LITERAL(4, 37, 21), // "onDataFromFileChanged"
QT_MOC_LITERAL(5, 59, 20), // "onInterpolateStopped"
QT_MOC_LITERAL(6, 80, 20), // "onInterpolateResumed"
QT_MOC_LITERAL(7, 101, 19), // "onInterpolatePaused"
QT_MOC_LITERAL(8, 121, 12), // "DataFromFile"
QT_MOC_LITERAL(9, 134, 4), // "path"
QT_MOC_LITERAL(10, 139, 4), // "data"
QT_MOC_LITERAL(11, 144, 12), // "dataFromFile"
QT_MOC_LITERAL(12, 157, 11) // "interpolate"

    },
    "LogFile\0onPathChanged\0\0onDataChanged\0"
    "onDataFromFileChanged\0onInterpolateStopped\0"
    "onInterpolateResumed\0onInterpolatePaused\0"
    "DataFromFile\0path\0data\0dataFromFile\0"
    "interpolate"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_LogFile[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       7,   14, // methods
       4,   56, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       6,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    0,   49,    2, 0x06 /* Public */,
       3,    0,   50,    2, 0x06 /* Public */,
       4,    0,   51,    2, 0x06 /* Public */,
       5,    0,   52,    2, 0x06 /* Public */,
       6,    0,   53,    2, 0x06 /* Public */,
       7,    0,   54,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
       8,    0,   55,    2, 0x0a /* Public */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

 // slots: parameters
    QMetaType::QString,

 // properties: name, type, flags
       9, QMetaType::QString, 0x00095102,
      10, QMetaType::QString, 0x00095102,
      11, QMetaType::QString, 0x00495001,
      12, QMetaType::Bool, 0x00095002,

 // properties: notify_signal_id
       0,
       0,
       2,
       0,

       0        // eod
};

void LogFile::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<LogFile *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->onPathChanged(); break;
        case 1: _t->onDataChanged(); break;
        case 2: _t->onDataFromFileChanged(); break;
        case 3: _t->onInterpolateStopped(); break;
        case 4: _t->onInterpolateResumed(); break;
        case 5: _t->onInterpolatePaused(); break;
        case 6: { QString _r = _t->DataFromFile();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (LogFile::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&LogFile::onPathChanged)) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (LogFile::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&LogFile::onDataChanged)) {
                *result = 1;
                return;
            }
        }
        {
            using _t = void (LogFile::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&LogFile::onDataFromFileChanged)) {
                *result = 2;
                return;
            }
        }
        {
            using _t = void (LogFile::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&LogFile::onInterpolateStopped)) {
                *result = 3;
                return;
            }
        }
        {
            using _t = void (LogFile::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&LogFile::onInterpolateResumed)) {
                *result = 4;
                return;
            }
        }
        {
            using _t = void (LogFile::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&LogFile::onInterpolatePaused)) {
                *result = 5;
                return;
            }
        }
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        auto *_t = static_cast<LogFile *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 2: *reinterpret_cast< QString*>(_v) = _t->getDataFromFile(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        auto *_t = static_cast<LogFile *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setPath(*reinterpret_cast< QString*>(_v)); break;
        case 1: _t->setData(*reinterpret_cast< QString*>(_v)); break;
        case 3: _t->read_raw_data(*reinterpret_cast< bool*>(_v)); break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
}

QT_INIT_METAOBJECT const QMetaObject LogFile::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_LogFile.data,
    qt_meta_data_LogFile,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *LogFile::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *LogFile::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_LogFile.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int LogFile::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 7)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 7;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 7)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 7;
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 4;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 4;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 4;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 4;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 4;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 4;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void LogFile::onPathChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void LogFile::onDataChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void LogFile::onDataFromFileChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 2, nullptr);
}

// SIGNAL 3
void LogFile::onInterpolateStopped()
{
    QMetaObject::activate(this, &staticMetaObject, 3, nullptr);
}

// SIGNAL 4
void LogFile::onInterpolateResumed()
{
    QMetaObject::activate(this, &staticMetaObject, 4, nullptr);
}

// SIGNAL 5
void LogFile::onInterpolatePaused()
{
    QMetaObject::activate(this, &staticMetaObject, 5, nullptr);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE