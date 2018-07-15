#ifndef ASYNCIMAGEPROVIDER_H
#define ASYNCIMAGEPROVIDER_H

#endif // ASYNCIMAGEPROVIDER_H

#include <qqmlextensionplugin.h>
#include <qqmlengine.h>
#include <qquickimageprovider.h>
#include <QDebug>
#include <QImage>
#include <QThreadPool>

enum Location{LocalPath, RemoteAddr};

class AsyncImageResponse : public QQuickImageResponse, public QRunnable
{
    public:
        AsyncImageResponse(const QString &id, const QSize &requestedSize/*, Location value, QString &url*/)
         : m_id(id), m_requestedSize(requestedSize)
        {
            setAutoDelete(false);
        }

        QQuickTextureFactory *textureFactory() const override
        {
            return QQuickTextureFactory::textureFactoryForImage(m_image);
        }

        void run() override
        {
            /*
            if (m_id == "slow")
            {
                m_image.load("/home/mike/testImg1.jpg");
            }else
            {
                m_image.load("/home/mike/testImg2.jpg");
            }
            */
            m_image.load(m_id);
            if (m_requestedSize.isValid())
            {
                m_image = m_image.scaled(m_requestedSize);
            }


            emit finished();
        }

        QString m_id;
        QSize m_requestedSize;
        QImage m_image;
};

class AsyncImageProvider : public QQuickAsyncImageProvider
{
public:
    QQuickImageResponse *requestImageResponse(const QString &id, const QSize &requestedSize) override
    {
        AsyncImageResponse *response = new AsyncImageResponse(id, requestedSize);
        pool.start(response);
        return response;
    }

private:
    QThreadPool pool;
};
