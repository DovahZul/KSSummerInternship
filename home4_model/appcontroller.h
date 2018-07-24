#ifndef APPCONTROLLER_H
#define APPCONTROLLER_H

#include <QObject>
#include <pathviewmodel.h>

class AppController : public QObject
{
    Q_OBJECT
    PathViewModel* m_myModel;

    QStringList m_list;


public:

    Q_PROPERTY(QStringList list READ list WRITE setList NOTIFY listChanged)

    Q_PROPERTY(PathViewModel* myModel READ myModel WRITE setMyModel NOTIFY myModelChanged)


    Q_INVOKABLE void addElement(QString value);

    Q_INVOKABLE void moveElement(int from, int to);

    Q_INVOKABLE void deleteElement(int index);


    AppController(QObject *parent = Q_NULLPTR);
    ~AppController();
    PathViewModel* myModel() const;
    QStringList list() const;

public slots:
    void setMyModel(PathViewModel* myModel);
    void setList(QStringList list);
    bool setDirectory(QString path);

signals:
    void myModelChanged(PathViewModel* myModel);
    void listChanged(QStringList list);
};

#endif // APPCONTROLLER_H