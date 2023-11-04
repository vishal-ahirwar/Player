#include "imagemanager.h"
#include<QString>
cv::Mat ImageManager::getRawFrame() const
{
    return rawFrame;
}

void ImageManager::setRawFrame(const cv::Mat &newRawFrame)
{
    rawFrame = newRawFrame;
    Convert2Image();
}

void ImageManager::setWidthHeight(const int &width, const int &height)
{
    this->width=width;
    this->height=height;
    emit FrameChanged();
}

QImage ImageManager::getFrame() const
{
    return frame;
}

void ImageManager::setFrame(const QImage &newFrame)
{
    frame = newFrame;
    ImageManager::update();
}

void ImageManager::OpenImage(QString url)
{
    url.remove("file:///");
    rawFrame=cv::imread(url.toStdString());
    Convert2Image();
}

void ImageManager::Convert2Image()
{
    cv::Mat tempMat;
    cv::cvtColor(rawFrame,tempMat,cv::COLOR_RGB2BGR);
    QImage tempImage((uchar*)tempMat.data,tempMat.cols,tempMat.rows,tempMat.step,QImage::Format_RGB888);
    frame=tempImage;
    frame.detach();
    ImageManager::update();
    emit FrameChanged();

}

ImageManager::ImageManager(QQuickItem*parent):QQuickPaintedItem(parent)
{

}

void ImageManager::paint(QPainter*painter)
{
    frame=frame.scaled(width,height,Qt::KeepAspectRatioByExpanding,Qt::SmoothTransformation);
    painter->drawImage(0,0,frame,0,0,-1,-1,Qt::AutoColor);
};
