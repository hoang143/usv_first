cmake_minimum_required(VERSION 3.18)

project(Gcs_qml_1_2App LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)

find_package(Qt6 COMPONENTS Gui Qml Quick)
qt_add_executable(Gcs_qml_1_2App src/main.cpp)

qt_add_resources(Gcs_qml_1_2App "configuration"
    PREFIX "/"
    FILES
        qtquickcontrols2.conf
)

target_link_libraries(Gcs_qml_1_2App PRIVATE
    Qt${QT_VERSION_MAJOR}::Core
    Qt${QT_VERSION_MAJOR}::Gui
    Qt${QT_VERSION_MAJOR}::Quick
    Qt${QT_VERSION_MAJOR}::Qml
)

include(${CMAKE_CURRENT_SOURCE_DIR}/qmlmodules)
