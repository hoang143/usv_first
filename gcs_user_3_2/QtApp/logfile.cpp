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
    for(int i = 0; i < lstDepthInterpolated.length(); i++){
        data_From_File += QString::number(lstLatInterpolated[i], 'f', 9) + "," + QString::number(lstLngInterpolated[i], 'f', 9) + "," + QString::number(lstDepthInterpolated[i], 'f', 4) + ";";
    }

//    qDebug()<< data_From_File;

    log_interpolated_path = interpolate_path;
    log_interpolated_path = log_interpolated_path.replace(".txt", "_interpolated.txt") ;
    LogTextFile(log_interpolated_path,data_From_File);

    return data_From_File;
}

void LogFile::start_interpolate(bool _trig)
{
    interpolate_started = 1;
    if (_trig == 1)
    {
        QFile file(interpolate_path);
        if(!file.open(QIODevice::ReadOnly)) {
            return;
        }

        QTextStream in(&file);

        // data_From_File = in.readAll();
        while(!in.atEnd()) {
            line = in.readLine();
            lst = line.split(";");

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
        if (lstLat.size()>process_limit)
        {
            shrink_factor = ceil(lstLat.size()/process_limit);
            raw_size = lstLat.size();
            for (int i=0; i<=raw_size;i++)
            {
                if ((i%shrink_factor) != 0)
                {
                    if (lstLng.size() > (j+shrink_factor))
                    {
//                        qDebug()<< lstLat.size();
//                        qDebug()<< j;
                        lstLat.removeAt(j);
                        lstLng.removeAt(j);
                        lstDepth.removeAt(j);

//                        qDebug()<< lstLat.size();
                    }
                    else
                    {
//                        qDebug()<< "Break !";
                        break;
                    }

                    j--;
                }
                j++;
            }
        }

        shrunk_size = lstLat.size();
//        qDebug()<< "Shrunk size: " << shrunk_size;

        double distance1 = lat_lng_to_distance(minLat, maxLng, maxLat, maxLng);
        double distance2 = lat_lng_to_distance(minLat, maxLng, minLat, minLng);
        interpolate_lat_num = distance1/step;
        interpolate_lng_num = distance2/step;
        total_interpolate_nodes = interpolate_lat_num * interpolate_lng_num;
        total_interpolate_iterations = total_interpolate_nodes*shrunk_size;

        current_interpolate_index = 0;
        current_processs_index = 0;
        pause_count = 0;

//        qDebug()<< "Total iterations: " << total_interpolate_iterations;
//        qDebug()<< "Total nodes: " << total_interpolate_nodes;
//        qDebug()<< "Lat row num: " << interpolate_lat_num;
//        qDebug()<< "Lng column num: " << interpolate_lng_num;

        for(int i = 0; i < interpolate_lat_num; i++){
            for(int j = 0; j < interpolate_lng_num; j++){
                lstLatInterpolated.append(minLat + (maxLat - minLat)*step*i/distance1);
                lstLngInterpolated.append(minLng + (maxLng - minLng)*step*j/distance2);
                lstDepthInterpolated.append(0);
            }
        }

//        qDebug()<< "LatI list size: " << lstLatInterpolated.size();
//        qDebug()<< "LngI list size: " << lstLngInterpolated.size();
//        qDebug()<< "DepthI list size: " << lstDepthInterpolated.size();

//        qDebug()<< "----------- First interpolation iteration -----------";

        // START INTERPOLATION
        resume_interpolate(1);

        file.close();
        return;

    }
}

void LogFile::resume_interpolate(bool _trig)
{
    if ((_trig == 1)&&( interpolate_started == 1))
    {
        current_processs_index = 0;
        node_increment = 0;

//        qDebug()<< " ";
//        qDebug()<< "------- Interpolation resumed: No." << pause_count <<" -------";
//        qDebug()<< "    Current node: " << current_node;
//        qDebug()<< " ";

        if (current_node >= (total_interpolate_nodes-1))
        {
            emit onInterpolateStopped();
//            qDebug()<< "------- Interpolation STOPPED ! -------";
//            qDebug()<< "    ... End check";
//            qDebug()<< "    Interpolated Depth list: " << lstDepthInterpolated;
//            qDebug()<< "    Interpolation index: " << current_interpolate_index;
            interpolate_started = 0;
        }
        else
        {
            for (int i = current_node; i < total_interpolate_nodes; i++)
            {
//                qDebug()<< "--- Interation No." << (current_node + node_increment) <<" ---";
//                qDebug()<< "    Start check ...";
//                qDebug()<< "    Current node: " << current_node;
//                qDebug()<< "    Node increment: " << node_increment;
//                qDebug()<< " ";

                if (current_processs_index > process_limit)
                {
                    current_processs_index = 0;
//                    qDebug()<< "    END: Interpolation paused ...";
//                    qDebug()<< "    ... End check";
//                    qDebug()<< "    Interpolated depth: " << lstDepthInterpolated[i];
//                    qDebug()<< "    Interpolation index: " << current_interpolate_index;
//                    qDebug()<< "    Node increment: " << node_increment;
//                    qDebug()<< " ";

                    pause_count ++;
                    current_node = current_node + node_increment;
//                    qDebug()<< "    ... End node check";
//                    qDebug()<< "    Current node: " << current_node;

                    emit onInterpolatePaused();
                    return;
                }
                else
                {
                    min_distance = lat_lng_to_distance(lstLatInterpolated[i], lstLngInterpolated[i], lstLat[0], lstLng[0]);
                    lstDepthInterpolated[i] = lstDepth[0];

                    for(int j = 0; j < shrunk_size; j ++){
                        temp = lat_lng_to_distance(lstLatInterpolated[i], lstLngInterpolated[i], lstLat[j], lstLng[j]);
                        if(temp < min_distance)
                        {
                            min_distance = temp;
                            lstDepthInterpolated[i] = lstDepth[j];
                        }
                        current_processs_index ++;
                    }
//                    qDebug()<< "    END: Process loop +1 ...";
//                    qDebug()<< "    ... End check";
//                    qDebug()<< "    Interpolated depth: " << lstDepthInterpolated[i];
//                    qDebug()<< "    Interpolation index: " << current_interpolate_index;
//                    qDebug()<< "    Node increment: " << node_increment;
//                    qDebug()<< " ";
                    current_interpolate_index = current_interpolate_index + current_processs_index;
                    node_increment ++;
                }
            }
        }
    }
}

int LogFile::get_interpolate_progress()
{
    int _val = 0;
    if (total_interpolate_nodes<1)
        total_interpolate_nodes = 1;

    _val = 100 * (current_node+1)/total_interpolate_nodes;
    if (_val<0) _val = 0;

//    qDebug()<< "Interpolate progress: " << _val << "%";
    return _val;
}

int LogFile::get_pause_count()
{
//    qDebug()<< "Pause count: " << pause_count << "iterations";
    return pause_count;
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
    // qDebug()<< path;
}

void LogFile::setInterpolatePath(QString _val)
{
    interpolate_path = _val;
    interpolate_path = interpolate_path.replace("file:///", "");
    interpolate_path = interpolate_path.replace("/", "//");
//    interpolate_path = interpolate_path.replace(".txt", "_interpolated.txt");
    emit onInterpolatePathChanged();
    // qDebug()<< interpolate_path;
}


void LogFile::setData(QString _val)
{
    data = _val;
    LogTextFile(path, data);
    emit onDataChanged();
//    qDebug()<<data;
}

QString LogFile::getDataFromFile()
{
    data_From_File = ReadTextFile();
    return data_From_File;
}

QString LogFile::load_interpolated_data()
{
    QFile file(path);
    if(!file.open(QIODevice::ReadOnly)) {
        return "error";
    }

    QTextStream in(&file);
    interpolated_data = in.readAll();
//    qDebug()<< interpolated_data;

    return interpolated_data;
}

