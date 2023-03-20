#include "logfile.h"
#include <QDebug>
#include <QString>
#include <QtMath>


LogFile::LogFile(QObject *parent)
    : QObject{parent}
{

}

int LogFile::LogTextFile(QString path, QString data)
{
    QFile file(path);
    if (!file.open(QIODevice::WriteOnly | QIODevice::Text | QIODevice::Append))
        return -1;

    QTextStream out(&file);
    out << data << Qt::endl;
//    out << udp.usv_lat + "," + udp.usv_lng + "," + udp.depth + "," + udp.depth_confidence << endl;
    file.close();
    return 0;
}

QString LogFile::ReadTextFile()
{
    QFile file(path);
    if(!file.open(QIODevice::ReadOnly)) {
        return "error";
    }

    QTextStream in(&file);

//    data_From_File = in.readAll();
    while(!in.atEnd()) {
        line = in.readLine();
        lst = line.split(",");

        strTemp = lst[0];
        temp = strTemp.toDouble();
        lstLat.append(temp);
        if(temp <= minLat) minLat = temp;
        if(temp >= maxLat) maxLat = temp;

        strTemp = lst[1];
        temp = strTemp.toDouble();
        lstLng.append(temp);
        if(temp <= minLng) minLng = temp;
        if(temp >= maxLng) maxLng = temp;

        strTemp = lst[2];
        temp = strTemp.toDouble();
        lstDepth.append(temp);
    }


        double distance1 = ceil(lat_lng_to_distance(minLat, maxLng, maxLat, maxLng));
        double distance2 = ceil(lat_lng_to_distance(minLat, maxLng, minLat, minLng));
//        qDebug()<< distance1;
//        qDebug()<< distance2;
//        for(int i; i < lstLat.length(); i++){
//            qDebug()<< lstLat[i];
//        }
//        qDebug()<< minLat;
//        qDebug()<< minLng;
//        qDebug()<< maxLat;
//        qDebug()<< maxLng;

        for(int i = 0; i < distance1/step; i++){
            for(int j = 0; j < distance2/step; j++){
                lstLatInterpolated.append(minLat + (maxLat - minLat)*step*i/distance1);
                lstLngInterpolated.append(minLng + (maxLng - minLng)*step*j/distance2);
            }
        }

                qDebug()<< lstDepthInterpolated.length();
//        for(int i = 0; i < lstLatInterpolated.length(); i++){
//            for(int j = 0; j < lstLat.length() - 1; j ++){
//                temp = lat_lng_to_distance(lstLatInterpolated[i], lstLngInterpolated[i], lstLat[j], lstLng[j]);
//                if(temp > lat_lng_to_distance(lstLatInterpolated[i], lstLngInterpolated[i], lstLat[j+1], lstLng[j+1])) lstDepthInterpolated[i] = lstDepth[j+1];
//            }
//        }
                qDebug()<< lstDepthInterpolated.length();

        for(int i = 0; i < lstDepthInterpolated.length(); i++){
            data_From_File += QString::number(lstLatInterpolated[1], 'f', 9) + "," + QString::number(lstLngInterpolated[1], 'f', 9) + "," + QString::number(lstDepthInterpolated[1], 'f', 4) + "\r\n";
        }
//        qDebug()<< QString::number(lstLatInterpolated[1430], 'f', 9) + "," + QString::number(lstLngInterpolated[1430], 'f', 9) + "," + QString::number(lstDepthInterpolated[1430], 'f', 4) + "-";
        qDebug()<< lstDepthInterpolated[0];
        qDebug()<< lstLatInterpolated.length();
//        qDebug()<< lstLat.length();

        file.close();
        return data_From_File;

}

void LogFile::Interpolation()
{

}

float LogFile::lat_lng_to_distance(double _lat_1, double _lng_1, double _lat_2, double _lng_2)
{
    float _distance;
    _distance = qPow((qPow((_lat_2-_lat_1)*k_fix_lat,2)+qPow((_lng_2-_lng_1)*k_fix_lng,2)),0.5);
    return _distance;
}

QString LogFile::DataFromFile()
{
    emit onDataFromFileChanged();
    return data_From_File;
}

void LogFile::setPath(QString _val)
{
    path = _val;
    path = path.replace("file:///", "");
    path = path.replace("/", "//");
    emit onPathChanged();
    qDebug()<< path;
}

void LogFile::setData(QString _val)
{
    data = _val;
    LogTextFile(path, data);
    emit onDataChanged();
    qDebug()<<data;
}

QString LogFile::getDataFromFile()
{
    data_From_File = ReadTextFile();
    return data_From_File;
}
