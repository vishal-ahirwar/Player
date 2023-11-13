#ifndef THREADMANAGER_H
#define THREADMANAGER_H

#include <QObject>
#include<QThread>
#include"../VideoManager/videomanager.h"

class ThreadManager : public QObject
{
    Q_OBJECT
    QThread thread;
    VideoManager videoManager{};
public:
    explicit ThreadManager(QObject *parent = nullptr);
    Q_INVOKABLE void RunCapture( QString url);
signals:
    void updateFrame(cv::Mat frame);
public slots:
    void RecieveFrame(cv::Mat frame);
};

#endif // THREADMANAGER_H
