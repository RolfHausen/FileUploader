#ifndef MAINVIEWMODEL_H
#define MAINVIEWMODEL_H

#include <QStringList>
#include <QSqlTableModel>
#include <QStringListModel>
#include <QFileDialog>
#include <QSettings>

#include <QCoreApplication>
#include <dbmanager.h>

class Mainviewmodel
{

public:
    Mainviewmodel();        
    bool openDB(QString servername,QString username, QString password, QString dbname);
    QStringListModel* GetTableNamesModel();
    QStringList LoadTables();
    QStringList LoadTableRows(QString table);
    QSqlQueryModel* GetTableData();
    bool UploadFile(QString itemname, QString tablename, QString filename);

    void setFileNameCol(QString filenamecol);
    void setFileDataCol(QString filedatacol);


    const QStringList &Errors() const;

private:
    DbManager* m_DbMan;
    QStringListModel* m_TableNamesModel;
    QStringList m_Errors;
};

#endif // MAINVIEWMODEL_H
