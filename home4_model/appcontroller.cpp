#include "appcontroller.h"

void AppController::addElement(QString value) {
    m_myModel->addElement(value);
}

void AppController::moveElement(int from, int to)
{
    m_myModel->moveElement(from, to);
}

void AppController::deleteElement(int index) {
    m_myModel->deleteElement(index);
}
bool AppController::setDirectory(QString path)
{
    m_myModel->setFolder(path);
    return true;
}
AppController::AppController(QObject *parent) : QObject(parent), m_myModel(new PathViewModel())
{
  //  m_list.append("test 1 gfdgdfg");
   // m_list.append("test 2 sdfsdgdfg");
   // m_list.append("/home/mike/testmg1.jpg");
    m_list=m_myModel->list();
  //  fsmodel->setRootPath(QDir::currentPath());
   // m_myModel->addElement("/home/mike/testmg1.jpg");
}

QString AppController::itemAt(int index)
{
    return m_list.at(index);

}

AppController::~AppController()
{
    delete m_myModel;
}

PathViewModel *AppController::myModel() const
{
    return m_myModel;
}

QStringList AppController::list() const
{
    return m_list;
}

int AppController::getCount()
{
    return m_list.count();
}

void AppController::setMyModel(PathViewModel *myModel)
{
    if (m_myModel == myModel)
        return;

    m_myModel = myModel;
    emit myModelChanged(m_myModel);
}

void AppController::setList(QStringList list)
{
    if (m_list == list)
        return;

    m_list = list;
    emit listChanged(m_list);
}
