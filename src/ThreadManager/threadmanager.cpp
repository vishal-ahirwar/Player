#include "threadmanager.h"

ThreadManager::ThreadManager(QObject *parent)
    : QObject{parent}
{

}

void ThreadManager::RunCapture(QString url)
{
    videoManager.setUrl(url);
    connect(&thread,&QThread::started,&videoManager,&VideoManager::OpenVideo);
    connect(&thread,&QThread::finished,&videoManager,&VideoManager::deleteLater);
    connect(&videoManager,&VideoManager::NewFrameChanged,this,&ThreadManager::RecieveFrame);
    videoManager.moveToThread(&thread);
    thread.start();
}

void ThreadManager::RecieveFrame(cv::Mat frame)
{
    emit updateFrame(frame);
}
