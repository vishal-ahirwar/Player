#ifndef IMAGEMANAGER_H
#define IMAGEMANAGER_H
#include<QQuickPaintedItem>
#include<QObject>
#include<QQuickItem>
#include<QPainter>
#include<opencv2/core.hpp>
#include<opencv2/core/utility.hpp>
#include<opencv2/imgproc.hpp>
#include<opencv2/highgui.hpp>

class ImageManager:public QQuickPaintedItem
{
    Q_OBJECT
    Q_PROPERTY(QImage frame READ getFrame WRITE setFrame NOTIFY FrameChanged FINAL)
    //    Q_PROPERTY(Q name READ name WRITE setname NOTIFY nameChanged FINAL)
private:
    cv::Mat rawFrame;
    QImage frame;
    int width{512};
    int height{512};
public:
    ImageManager(QQuickItem*parent=0);
    void paint(QPainter*painter)override;

    cv::Mat getRawFrame() const;
    Q_INVOKABLE void setRawFrame(const cv::Mat &newRawFrame);
    Q_INVOKABLE void setWidthHeight(const int&width,const int&height);
    QImage getFrame() const;
    void setFrame(const QImage &newFrame);
    Q_INVOKABLE void OpenImage( QString url);
signals:
    void FrameChanged();
public slots:
    void Convert2Image();
};

#endif // IMAGEMANAGER_H
