#ifndef LOGFILE_H
#define LOGFILE_H

#include <QApplication>
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
    Q_PROPERTY(QString interpolatePath WRITE setInterpolatePath NOTIFY onInterpolatePathChanged)
    Q_PROPERTY(QString data WRITE setData NOTIFY onDataChanged)
    Q_PROPERTY(QString dataFromFile  READ getDataFromFile NOTIFY onDataFromFileChanged)
    Q_PROPERTY(QString interpolatedData READ load_interpolated_data NOTIFY onLoadInterpolatedDataChanged)

    Q_PROPERTY(bool startInterpolate WRITE start_interpolate)
    Q_PROPERTY(bool resumeInterpolate WRITE resume_interpolate)
    Q_PROPERTY(int getInterpolateProgress READ get_interpolate_progress NOTIFY onInterpolatePaused)
    Q_PROPERTY(int getPauseCount READ get_pause_count NOTIFY onInterpolatePaused)

public:
    explicit LogFile(QObject *parent = Q_NULLPTR);
    int LogTextFile(QString path, QString data);
    QString ReadTextFile();
    float lat_lng_to_distance (double _lat_1, double _lng_1, double _lat_2, double _lng_2);

    void setPath(QString _val);
    void setInterpolatePath (QString _val);
    void setData(QString _val);

    void start_interpolate(bool _trig);
    void resume_interpolate(bool _trig);
    int get_interpolate_progress();
    int get_pause_count();
    QString getDataFromFile();
    QString load_interpolated_data();

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
    double min_distance = 0;
    double minLat = 22;
    double maxLat = 21;
    double minLng = 106;
    double maxLng = 105;
    const float k_fix_lat = 113894;
    const float k_fix_lng = 104225;

    int raw_size = 0;
    int shrink_factor = 1;
    int shrunk_size = 0;

    int step = 1;
    int current_interpolate_index = 0;
    int current_processs_index = 0;
    int current_node = 0;
    int node_increment = 0;

    int total_interpolate_nodes = 1;
    int total_interpolate_iterations = 1;
    int interpolate_lat_num = 0;
    int interpolate_lng_num = 0;
    int process_lat_index = 0;
    int process_lng_index = 0;
    const int process_limit = 1000;

    int pause_count = 0;
    bool interpolate_started = 0;

    QString data_From_File = "";
    QString data = "";
    QString path = "";
    QString interpolate_path = "";
    QString interpolated_data = "";
    QString log_interpolated_path = "";

signals:
    void onPathChanged();
    void onInterpolatePathChanged();
    void onDataChanged();
    void onDataFromFileChanged();
    void onInterpolateResumed();
    void onInterpolatePaused();
    void onInterpolateStopped();
    void onLoadInterpolatedDataChanged();

public slots:
    QString DataFromFile();

private:

};

#endif // LOGFILE_H
