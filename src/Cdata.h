#ifndef DATA_H
#define DATA_H

#include <QObject>
#include <QtNetwork>
#include <QQuickView>

class Cdata : public QObject
{
    Q_OBJECT
public:
    explicit Cdata(QObject *parent = nullptr);
    Q_INVOKABLE void setTitle(QString, int);
    Q_INVOKABLE QString getTitle(int);
    Q_INVOKABLE void setLinkInformation(QString, QString);
    Q_INVOKABLE void requestData(int);
    Q_INVOKABLE QString getJsonData(QString,int,int);
    Q_INVOKABLE int getJsonSize(int);

private :
    QString title[3];
    QJsonDocument jsonDoc[3];
    QString base="https://api-ratp.pierre-grimaud.fr/v3";
    QString type; //rer, metro, etc...
    QString code; //name like A,B,C,D for rer in exemple
    QString station; // name of the station.. exemple : Nation
    QString url;
    int indexPage;
    bool notOk=true;

signals:

public slots:
    void replyFinished(QNetworkReply*);
};

#endif // DATA_H
