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
    Q_PROPERTY(bool interpolate WRITE read_raw_data NOTIFY onDataFromFileChanged)

public:
    explicit LogFile(QObject *parent = Q_NULLPTR);
    LogTextFile(QString path, QString data);
    QString ReadTextFile();
    void Interpolation();
    float lat_lng_to_distance (double _lat_1, double _lng_1, double _lat_2, double _lng_2);

    void read_raw_data(bool _trig);
    void resume_interpolate();

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

    int shrink_factor = 1;

    int step = 5;
    int current_interpolate_index = 0;
    int current_processs_index = 0;
    int total_interpolate_num = 0;
    int interpolate_lat_num = 0;
    int interpolate_lng_num = 0;
    int process_lat_index = 0;
    int process_lng_index = 0;
    const int process_limit = 8000;

signals:
    void onPathChanged();
    void onDataChanged();
    void onDataFromFileChanged();
    void onInterpolateStopped();
    void onInterpolateResumed();
    void onInterpolatePaused();

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
