#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include<QStringListModel>
#include <QFileDialog>
#include <QMessageBox>

#include <mainviewmodel.h>
#include <aboutbox.h>

QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

private slots:
    void on_ConnectDbPushButton_clicked();
    void on_UploadFilePushButton_clicked();
    void on_TableComboBox_currentIndexChanged(int index);
    void on_TablerowComboBox_currentIndexChanged(const QString &arg1);
    void on_BrowsePushButton_clicked();


    void on_actionAbout_triggered();

private:
    Ui::MainWindow *ui;
    DbManager* m_DbMan; //to be removed from mainwindow

    Mainviewmodel* m_MainViewModel;

    QStringListModel* m_TableNamesModel;
    QString m_TableName;
    QString m_FileName;
    QString m_ItemName;    
};
#endif // MAINWINDOW_H
