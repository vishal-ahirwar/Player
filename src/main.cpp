#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include"ImageManager/imagemanager.h"
#include<QQmlContext>
#include<QQmlComponent>
#include"./ThreadManager/threadmanager.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);
    ThreadManager videoThread;
    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("VideoThread",&videoThread);
    qmlRegisterType<ImageManager>("com.player.im",1,0,"ImageManager");
    qRegisterMetaType<cv::Mat>("Mat");
    const QUrl url(QStringLiteral("qrc:/qml/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
