#include "mainviewmodel.h"

Mainviewmodel::Mainviewmodel()
{
    m_DbMan = new DbManager();
    QCoreApplication::setOrganizationName("RolfHausen");
    QCoreApplication::setApplicationName("FileUploader");
}


bool Mainviewmodel::openDB(QString servername,QString username, QString password, QString dbname)
{
    m_DbMan->setDBServer(servername);
    m_DbMan->setDBUser(username);
    m_DbMan->setDBpwd(password);
    m_DbMan->setDBName(dbname);

    if(servername.isEmpty() || username.isEmpty() || password.isEmpty())
    {

        m_Errors.append("missing Serverdata to connect to Database!");
        return false;
    }

    //store settings
    QSettings settings; //to declare it needs a companyname and a projectname in mycase its a developername
    settings.setValue("server",servername);
    settings.setValue("user",username);
    settings.setValue("password",password);
    settings.setValue("dbname",dbname);

    if(m_DbMan->openDB())
    {
        QStringList TablesNames=m_DbMan->LoadTables();
        m_TableNamesModel = new QStringListModel();
        m_TableNamesModel->setStringList(TablesNames);
    }
    else
    {
        m_Errors.append(m_DbMan->LastError());
        return false;
    }

    return true;
}

QStringListModel *Mainviewmodel::GetTableNamesModel()
{
    return m_TableNamesModel;
}

QStringList Mainviewmodel::LoadTables()
{
    return m_DbMan->LoadTables();
}

QStringList Mainviewmodel::LoadTableRows(QString table)
{
    return m_DbMan->LoadTableRows(table);
}

QSqlQueryModel *Mainviewmodel::GetTableData()
{
    return m_DbMan->GetTableData();
}

bool Mainviewmodel::UploadFile(QString itemname, QString tablename, QString filename)
{
    if(filename.isEmpty())
    {
        m_Errors.append("no file specified!");
        return false;
    }

    QFile file(filename);
    if(!file.open(QIODevice::ReadOnly)) return false;
    QByteArray filedata = file.readAll();

    if(m_DbMan->StoreFile(itemname ,tablename,filename,filedata))
    {
        m_DbMan->LoadTableRows(tablename); // to refresh the Data after the update
    }
    else
    {
        m_Errors.append(m_DbMan->LastError());
        return false;
    }
    return true;
}

void Mainviewmodel::setFileNameCol(QString filenamecol)
{
    m_DbMan->setFileNameCol(filenamecol);
    QSettings settings;
    settings.setValue("filenamecol",filenamecol);
}

void Mainviewmodel::setFileDataCol(QString filedatacol)
{
    m_DbMan->setFileDataCol(filedatacol);
    QSettings settings;
    settings.setValue("filedatacol",filedatacol);
}

const QStringList &Mainviewmodel::Errors() const
{
    return m_Errors;
}
