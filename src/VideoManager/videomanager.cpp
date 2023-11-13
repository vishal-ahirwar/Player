#include "videomanager.h"
#include<opencv2/videoio.hpp>
VideoManager::VideoManager(QObject *parent)
    : QObject{parent}
{
    this->bStopVideo=false;
}

VideoManager::~VideoManager()
{
    delete videoCapture;
}

bool VideoManager::OpenVideo()
{
    cv::Mat rawFrame{};
    videoCapture=new cv::VideoCapture();

    if(!videoCapture)return false;
    videoCapture->open(url.toStdString());
    if(!videoCapture->isOpened())return false;
    while(videoCapture->read(rawFrame) && !bStopVideo)
    {
        emit NewFrameChanged(rawFrame);
    }
    return true;
}

void VideoManager::setUrl( QString &newUrl)
{
    newUrl.remove("file:///");
    url = newUrl;
}
