#ifndef PATHVIEWMODEL_H
#define PATHVIEWMODEL_H

#include<QAbstractListModel>
class PathViewModel: public QAbstractListModel
{
    Q_OBJECT

public:
    enum Roles {
        TextRole = Qt::UserRole + 1,
        IconRole
    };

    PathViewModel(QObject *parent = Q_NULLPTR);

    Q_INVOKABLE virtual int rowCount(const QModelIndex &parent = QModelIndex()) const;
    virtual QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const;
    virtual QModelIndex index(int row, int column, const QModelIndex &parent) const;
    virtual int columnCount(const QModelIndex &parent) const;
    QHash<int, QByteArray> roleNames() const;

    void addElement(QString value);
    void deleteElement(int index);
    void moveElement(int from, int to);
    QString elementAt(int index);
    QStringList list();
    void setFolderPath(QString path);
    QString getFolderPath();

private:
   QList<QString> m_data;
   QString folderPath;
};

#endif // PATHVIEWMODEL_H
