#include "logfile.h"
#include <QDebug>
#include <QString>
#include <QtMath>


LogFile::LogFile(QObject *parent)
    : QObject{parent}
{

}

LogFile::LogTextFile(QString path, QString data)
{
    QFile file(path);
    if (!file.open(QIODevice::WriteOnly | QIODevice::Text | QIODevice::Append))
        return -1;

    QTextStream out(&file);
    out << data << endl;
//    out << udp.usv_lat + "," + udp.usv_lng + "," + udp.depth + "," + udp.depth_confidence << endl;
    file.close();
    return 0;
}

void LogFile::read_raw_data(bool _trig)
{
    if (_trig==1)
    {
        QFile file(path);
        if(!file.open(QIODevice::ReadOnly)) {
            return;
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


        // SHRINK RAW DATA SIZE
        int j = 0;
        if (lst.size()>process_limit)
        {
            shrink_factor = ceil(lst.size()/process_limit);
            for (int i=0; i<=lst.size();i++)
            {
                if (i%shrink_factor)
                {

                }
                else
                {
                    lstLat.removeAt(j);
                    lstLng.removeAt(j);
                    j--;
                }
                j++;
            }
        }


        double distance1 = ceil(lat_lng_to_distance(minLat, maxLng, maxLat, maxLng));
        double distance2 = ceil(lat_lng_to_distance(minLat, maxLng, minLat, minLng));
        interpolate_lat_num = distance1/step;
        interpolate_lng_num = distance2/step;
        total_interpolate_num = interpolate_lat_num * interpolate_lng_num;
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

        // START INTERPOLATION
        resume_interpolate();

    //        qDebug()<< lstDepthInterpolated.length();
    //        qDebug()<< QString::number(lstLatInterpolated[1430], 'f', 9) + "," + QString::number(lstLngInterpolated[1430], 'f', 9) + "," + QString::number(lstDepthInterpolated[1430], 'f', 4) + "-";
    //        qDebug()<< lstDepthInterpolated[0];
    //        qDebug()<< lstLatInterpolated.length();
    //        qDebug()<< lstLat.length();

        file.close();
    }
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

void LogFile::resume_interpolate()
{
    for (int i = current_interpolate_index; i < total_interpolate_num; i++)
    {
        if (current_processs_index > process_limit)
        {
            current_processs_index = 0;
            emit onInterpolatePaused();
            break;
        }

        for(int j = 0; j < lstLat.length() - 1; j ++){
            temp = lat_lng_to_distance(lstLatInterpolated[current_interpolate_index], lstLngInterpolated[current_interpolate_index], lstLat[j], lstLng[j]);
            if(temp > lat_lng_to_distance(lstLatInterpolated[current_interpolate_index], lstLngInterpolated[current_interpolate_index], lstLat[j+1], lstLng[j+1]))
                lstDepthInterpolated[i] = lstDepth[j+1];
        }

        current_processs_index ++;
    }
    emit onInterpolateStopped();
}
void LogFile::onInterpolatePaused()
{
    resume_interpolate();
    emit onInterpolateResumed();
}
void LogFile::onInterpolateStopped()
{
    for(int i = 0; i < lstDepthInterpolated.length(); i++){
        data_From_File += QString::number(lstLatInterpolated[1], 'f', 9) + "," + QString::number(lstLngInterpolated[1], 'f', 9) + "," + QString::number(lstDepthInterpolated[1], 'f', 4) + "\r\n";
    }
}
QString LogFile::ReadTextFile()
{
    return data_From_File;
}


