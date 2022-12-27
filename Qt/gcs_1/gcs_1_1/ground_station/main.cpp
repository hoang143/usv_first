#include "udp.h"

#include <QApplication>


int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    udp w;
    w.show();
    return a.exec();
}
