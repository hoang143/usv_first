import QtQuick 2.1

Item {
    property alias model: dataModel

    //! [0]
    ListModel {
        id: dataModel
    }
}
