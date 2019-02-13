QT       += core gui
CONFIG   += c++11
greaterThan(QT_MAJOR_VERSION, 4): QT += widgets webenginewidgets

TARGET = QtEchartDemo
TEMPLATE = app

SOURCES += main.cpp\
        widget.cpp

HEADERS  += widget.h

FORMS    += widget.ui

CONFIG(debug, debug|release) {
  #设置debug配置下编译生成文件的路径
  TARGET = $$join(TARGET,,,d)   #为debug版本生成的文件增加d的后缀
  contains(TEMPLATE, "lib") {
    DESTDIR = $$PWD/Bin        #将库放在当前工程的Bin文件夹下
    DLLDESTDIR = $$PWD/Bin    #将动态库放在当前工程的Bin文件夹下
  } else {
    DESTDIR = $$PWD/Bin        #将应用程序放在当前工程的Bin文件夹下
  }
  OBJECTS_DIR = ./debug/obj     #将生成的对象文件放在专门的obj文件夹下
  MOC_DIR = ./debug/moc         #将QT自动生成的对象放在moc文件夹下
} else {
  #设置release配置下编译生成文件的路径
  contains(TEMPLATE, "lib") {
    DESTDIR = $$PWD/Bin        #将库放在当前工程的Bin文件夹下
    DLLDESTDIR = $$PWD/Bin     #将动态库放在当前工程的Bin文件夹下
  } else {
    DESTDIR = $$PWD/Bin        #将应用程序放在当前工程的Bin文件夹下
  }
  OBJECTS_DIR = ./release/obj   #将生成的对象文件放在专门的obj文件夹下
  MOC_DIR = ./release/moc       #将QT自动生成的对象放在moc文件夹下
}
