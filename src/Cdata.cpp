/***************************************************************************\
|                                                                           |
|   Author : Adrien-G.                                                      |
|   date   : 11/06/2018                                                     |
|                                                                           |
|   This class connect to internet and grab RATP real-time schedule data    |
|   For more information about the data grabbed please see work from        |
|   pierre Grimaud here : https://github.com/pgrimaud/horaires-ratp-api     |
|                                                                           |
\***************************************************************************/
#include "Cdata.h"

Cdata::Cdata(QObject *parent) : QObject(parent){}
void Cdata::setTitle(QString title,int index){ this->title[index] = title; }
QString Cdata::getTitle(int index){ return title[index]; }

//*** fill information for having the good link ***//
void Cdata::setLinkInformation(QString data, QString newValue){
    if(data == "type")
        this->type = newValue;
    if(data == "code")
        this->code = newValue;
    if(data == "station")
        this->station = newValue;

    //qDebug() << "type : " + this->type;
    //qDebug() << "code : " + this->code;
    //qDebug() << "station : " + this->station;
}

//*** ask for the good url (index specified in parameter) ***//
void Cdata::requestData(int index){
    this->notOk = true;
    this->indexPage = index;
    QNetworkAccessManager *manager = new QNetworkAccessManager(this);
    connect(manager, SIGNAL(finished(QNetworkReply*)),this, SLOT(replyFinished(QNetworkReply*)));
    switch(index){
        case 0:
            this->url = base+"/lines/"+type;
        break;
        case 1:
            this->url = base+"/stations/"+type+"/"+code;
        break;
        case 2:
            this->url = base+"/schedules/"+type+"/"+code+"/"+station+"/A+R";
        break;
        default:
            qWarning() << "erreur d'url !";
        break;
    }
    manager->get(QNetworkRequest(QUrl(this->url)));
}

//*** When the response is complete, fill the result (json) in an array for futur treatment ***//
void Cdata::replyFinished(QNetworkReply * qtr){
    QByteArray response_data = qtr->readAll();
    jsonDoc[this->indexPage] = QJsonDocument::fromJson(response_data);
    notOk = false;
    qtr->deleteLater();
}

//*** grab data from pGrimaud API ***//
QString Cdata::getJsonData(QString dataName,int index,int index2){
    while(notOk){
        qApp->processEvents();
    }
    QString val;
    switch(index){
        case 0: val = this->type;  break;
        case 1: val = "stations";  break;
        case 2: val = "schedules"; break;
        default:
            qWarning() << "erreur d'index !";
        break;
    }
    return this->jsonDoc[index].object().value("result").toObject().value(val).toArray()[index2].toObject().value(dataName).toString();
    //qDebug() << json;
    //qDebug() << res;

}

//*** return Json size (used for ui to showing items) **/
int Cdata::getJsonSize(int index)
{
    while(notOk){
        qApp->processEvents();
    }
    QString val;
    switch(index){
        case 0: val = this->type;  break;
        case 1: val = "stations";  break;
        case 2: val = "schedules"; break;
        default:
            qWarning() << "erreur d'index !";
        break;
    }
    return this->jsonDoc[index].object().value("result").toObject().value(val).toArray().size();
}
