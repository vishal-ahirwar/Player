#ifndef VIDEOMANAGER_H
#define VIDEOMANAGER_H

#include <QObject>
#include<opencv2/core.hpp>
#include<opencv2/core/utility.hpp>
#include<opencv2/imgproc.hpp>
#include<opencv2/highgui.hpp>

class VideoManager : public QObject
{
    Q_OBJECT

    cv::VideoCapture*videoCapture{};
    QString url{};
    bool bStopVideo{};
    public:
        void setUrl( QString &newUrl);

public:
    explicit VideoManager(QObject *parent = nullptr);
    ~VideoManager();
signals:
    void NewFrameChanged(cv::Mat rawFrame);
public slots:
    bool OpenVideo();

};

#endif // VIDEOMANAGER_H
