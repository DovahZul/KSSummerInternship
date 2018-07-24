#include "pathviewmodel.h"
#include <QUrl>
#include <QDir>
#include <QDebug>

PathViewModel::PathViewModel(QObject *parent)
{
    /*
    m_data.append("file:///home/mike/testImg1.jpg");
    m_data.append("file:///home/mike/testImg2.jpg");
    m_data.append("file:///home/mike/testImg1.jpg");
    m_data.append("file:///home/mike/testImg2.jpg");
    */
    setFolder("/media/mike/Archive/Галерея/Изображение/Art/scr/");
}

int PathViewModel::rowCount(const QModelIndex &parent) const
{
    return m_data.size();
}
QStringList PathViewModel::list()
{
    return (QStringList)m_data;
}

void PathViewModel::setFolder(QString path)
{
    QDir directory(path);
    QStringList images = directory.entryList();
    foreach(QString temp, images)
    {
        m_data.append(path+temp);
        qDebug() << "qwe"+temp;
    }
}
QVariant PathViewModel::data(const QModelIndex &index, int role) const
{
    switch (role) {
    case TextRole:
        return m_data.at(index.row());
        break;
    case IconRole:

        break;
    default:
        break;
    }

    return QVariant();
}

QModelIndex PathViewModel::index(int row, int column, const QModelIndex &parent) const
{
    return createIndex(row, column);
}

int PathViewModel::columnCount(const QModelIndex &parent) const
{
     return 1;
}

QHash<int, QByteArray> PathViewModel::roleNames() const
{
    QHash<int, QByteArray> roles = QAbstractListModel::roleNames();
    roles[IconRole] = "mIcon";
    roles[TextRole] = "mText";

    return roles;
}

QString PathViewModel::elementAt(int index)
{
    return m_data.at(index);
}
void PathViewModel::addElement(QString value)
{
    beginInsertRows(QModelIndex(), m_data.size(), m_data.size());
    m_data.append(value);
    endInsertRows();
}

void PathViewModel::deleteElement(int index)
{
    if(!hasIndex(index,0))
    {
        return;
    }
    beginRemoveRows(QModelIndex(),index, index);
    m_data.removeAt(index);
    endRemoveRows();
}

void PathViewModel::moveElement(int from, int to)
{
    if(!hasIndex(from,0) || !hasIndex(to,0) || (from == to))
    {
        return;
    }
    QModelIndex parent;
    if(beginMoveRows(parent,from, from, parent,to))
    {
        m_data.move(from, to);
        endMoveRows();
    }
}
