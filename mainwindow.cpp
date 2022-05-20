#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent) , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    m_MainViewModel = new Mainviewmodel();

    // load fielddata from settings
    QSettings settings;
    ui->ServernameLineEdit->setText(settings.value("server").toString());
    ui->UsernameLineEdit->setText(settings.value("user").toString());
    ui->PasswordLineEdit->setText(settings.value("password").toString());
    ui->DatabaseLineEdit->setText(settings.value("dbname").toString());
    ui->DbColFileNameLineEdit->setText(settings.value("filenamecol").toString());
    ui->DbColFileDataLineEdit->setText(settings.value("filedatacol").toString());

}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_ConnectDbPushButton_clicked()
{
    //get Fielddata from Controls
    QString server = ui->ServernameLineEdit->text();
    QString user = ui->UsernameLineEdit->text();
    QString password = ui->PasswordLineEdit->text();
    QString db = ui->DatabaseLineEdit->text();

    if(m_MainViewModel->openDB(server,user,password,db))
    {
        ui->TableComboBox->setEnabled(true);
        ui->TablerowComboBox->setEnabled(true);
        ui->BrowsePushButton->setEnabled(true);
        ui->TableComboBox->setModel(m_MainViewModel->GetTableNamesModel());
        ui->statusbar->showMessage("connected");
    }
    else //if something bad happened
    {
        //show the last error from the ErrorStack
        ui->statusbar->showMessage(m_MainViewModel->Errors().last());
    }
}

void MainWindow::on_UploadFilePushButton_clicked()
{
    m_MainViewModel->setFileNameCol(ui->DbColFileNameLineEdit->text());
    m_MainViewModel->setFileDataCol(ui->DbColFileDataLineEdit->text());

    if(m_MainViewModel->UploadFile(m_ItemName ,m_TableName,m_FileName))
    {
        ui->statusbar->clearMessage();
        ui->statusbar->showMessage("Upload finished");
        m_MainViewModel->LoadTableRows(m_TableName);

        ui->TableView->setModel(m_MainViewModel->GetTableData());
    }
    else
    {
        ui->statusbar->showMessage(m_MainViewModel->Errors().last());
    }
}

void MainWindow::on_TableComboBox_currentIndexChanged(int index)
{
    ui->statusbar->clearMessage();
    m_TableName = ui->TableComboBox->itemText(index);
    QStringList TableRows = m_MainViewModel->LoadTableRows(m_TableName);
    QStringListModel* TableRowsModel = new QStringListModel();
    TableRowsModel->setStringList(TableRows);
    ui->TablerowComboBox->setModel(TableRowsModel);
    ui->TableView->setModel(m_MainViewModel->GetTableData());

}

void MainWindow::on_TablerowComboBox_currentIndexChanged(const QString &arg1)
{
    //mostly to reset the fields
    m_ItemName=arg1;
    ui->FullFileNameLineEdit->clear();
    ui->statusbar->clearMessage();
    ui->UploadFilePushButton->setEnabled(!arg1.isEmpty());    
}

void MainWindow::on_BrowsePushButton_clicked()
{
    m_FileName = QFileDialog::getOpenFileName(this,"Select Image for this Item");
    ui->FullFileNameLineEdit->setText(m_FileName); //to Show it on the view.    
}


void MainWindow::on_actionAbout_triggered()
{
   AboutBox abox;
   abox.exec();
}

