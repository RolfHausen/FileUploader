#include "dbmanager.h"

DbManager::DbManager()
{

}

void DbManager::setDBServer(QString dbserver)
{
    m_DBServer=dbserver;
}

void DbManager::setDBName(QString dbname)
{
    m_DBName=dbname;
}

void DbManager::setDBUser(QString dbuser)
{
    m_DBUser=dbuser;
}

void DbManager::setDBpwd(QString dbpwd)
{
    m_DBPwd=dbpwd;
}

bool DbManager::openDB()
{
    QString connectionTemplate = "DRIVER={SQL SERVER};SERVER=%1;DATABASE=%2;";
    QString connectionString = connectionTemplate.arg(m_DBServer,m_DBName);
    m_DB = QSqlDatabase::addDatabase("QODBC", "default");

    m_DB.setDatabaseName(connectionString);
    m_DB.setUserName(m_DBUser);
    m_DB.setPassword(m_DBPwd);
    try //if invalid Data is passed into the connectionstring, it can crash the application
    {
        if (m_DB.open())
        {
            qDebug() << "Database connection ok";
            return true;
        }
        else
        {
            qDebug() << m_DB.lastError();
            m_Errors.append(m_DB.lastError().text());
            return false;
        }

    }  catch (QException e)
    {
        m_Errors.append(e.what());
    }

    return false; // if this is reached somthing went wrong.
}

QStringList DbManager::LoadTables()
{
    QStringList TableNames;
    QSqlQuery query("SELECT table_name,table_type FROM information_schema.tables ORDER BY table_name ASC;",m_DB);
    while (query.next())
    {
        if(query.value(1)=="BASE TABLE")
        {
            TableNames.append(query.value(0).toString());
        }
    }

    return  TableNames;
}

QStringList DbManager::LoadTableRows(QString table)
{
    QStringList TableRows;
    m_currentColumnNames.clear(); //clean up in case of a switch to another table
    QSqlQuery query(m_DB);    
    query.prepare("SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = (:tableName) ORDER BY 1");
    query.bindValue(":tableName",table);
    if(query.exec())
    {
        while (query.next())
        {
            m_currentColumnNames.append(query.value(0).toString());
        }

        QString columnName;

        for(int i=0;i<m_currentColumnNames.size();i++)
        {
            if(m_currentColumnNames[i].contains("Name"))
            {
                columnName = m_currentColumnNames[i];
            }
        }

        QString queryString ="Select * FROM " + table;

        m_currentTableData.setQuery(queryString,m_DB);
        if(query.exec(queryString))
        {            
            while (query.next())
            {                
                TableRows.append(query.value(columnName).toString());
            }
        }
        else
        {
            m_Errors.append(query.lastError().text());
        }
    }
    else
    {
        m_Errors.append(query.lastError().text());
    }
    return  TableRows;
}

QSqlQueryModel* DbManager::GetTableData()
{
    return &m_currentTableData;
}

bool DbManager::StoreFile(QString itemname,QString tablename, QString filename, QByteArray filedata)
{
    bool success=false;
    //reduce filname to only filename without path for storing the name into the database

    QStringList filenameSplit = filename.split("/");
    filename = filenameSplit.last();
    QString itemnameColumn;
    QString filenameColumnName,dataColumnName;

    if(m_FileDataCol.isEmpty() || m_FileDataCol.isEmpty())
    {
        m_Errors.append("Missing Definition for Database Columns Filedata and or Filename!");
        return false; //if there is no or at least on Definition for the Columns missing it will fail.
    }

    for(int i=0;i<m_currentColumnNames.size();i++)
    {
        //to ensure the columns get selected correct we use if else so that i can not get mixed.
        if(m_currentColumnNames[i].contains(m_FileDataCol)) //find the coloumn for the binary data
        {
            dataColumnName=m_currentColumnNames[i];
        }
        else if(m_currentColumnNames[i].contains(m_FilenameCol)) //find the column for the filename
        {
            filenameColumnName=m_currentColumnNames[i];
        }
        else if(m_currentColumnNames[i].contains("Name")) //find the Name Column to indentify the correct row
        {
           itemnameColumn=m_currentColumnNames[i];
        }
    }    
    QSqlQuery query(m_DB);
    QString querytemplate= "UPDATE %1 SET %2='%3',%4=? where %5='%6'";
    QString querystring=querytemplate.arg(tablename,filenameColumnName,filename,dataColumnName,itemnameColumn,itemname);

    query.prepare(querystring);
    query.addBindValue(filedata);    
    if(query.exec())
    {
        success=true;        
        qDebug() <<"upload done";
    }
    else
    {
        m_Errors.append(query.lastError().text());        

    }
    return success;
}

QString DbManager::LastError()
{
    return m_Errors.last();
}

void DbManager::setFileNameCol(const QString &newFilenameCol)
{
    m_FilenameCol = newFilenameCol;
}

void DbManager::setFileDataCol(const QString &newFileDataCol)
{
    m_FileDataCol = newFileDataCol;
}
