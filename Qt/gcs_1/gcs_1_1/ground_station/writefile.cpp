#include "writefile.h"

writeFile::write()
{
    public:
    void writeFile::write(QString filename)
    {
        QFile file(filename);
        // Trying to open in WriteOnly and Text mode
        if(!file.open(QFile::WriteOnly |
                      QFile::Text))
        {
            qDebug() << " Could not open file for writing";
            return;
        }

        // To write text, we use operator<<(),
        // which is overloaded to take
        // a QTextStream on the left
        // and data types (including QString) on the right

        QTextStream out(&file;);
        out << "QFile Tutorial";
        file.flush();
        file.close();
    }
}
