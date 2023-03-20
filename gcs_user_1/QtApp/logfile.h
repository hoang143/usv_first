#ifndef LOGFILE_H
#define LOGFILE_H

#include <QObject>
#include <QVariant>
#include <QString>
#include <QtMath>
#include <QFile>
#include <QTextStream>
#include <QDebug>
#include <QList>

class LogFile :public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString path WRITE setPath NOTIFY onPathChanged)
    Q_PROPERTY(QString data WRITE setData NOTIFY onDataChanged)
    Q_PROPERTY(QString dataFromFile  READ getDataFromFile NOTIFY onDataFromFileChanged)

public:
    explicit LogFile(QObject *parent = Q_NULLPTR);
    int LogTextFile(QString path, QString data);
    QString ReadTextFile();
    void Interpolation();
    float lat_lng_to_distance (double _lat_1, double _lng_1, double _lat_2, double _lng_2);
    QString line;
    QList<QString> lst;
    QList<double> lstLat;
    QList<double> lstLng;
    QList<double> lstDepth;
    QList<double> lstLatInterpolated;
    QList<double> lstLngInterpolated;
    QList<double> lstDepthInterpolated;

    QString strTemp = "";
    double temp = 0;
    double minLat = 22;
    double maxLat = 21;
    double minLng = 106;
    double maxLng = 105;
    const float k_fix_lat = 113894;
    const float k_fix_lng = 104225;
    int step = 5;

signals:
    void onPathChanged();
    void onDataChanged();
    void onDataFromFileChanged();

public slots:
    QString DataFromFile();

private:
    void setPath(QString _val);
    void setData(QString _val);
    QString getDataFromFile();
    QString data_From_File = "";
    QString data = "";
    QString path = "";


};

#endif // LOGFILE_H
