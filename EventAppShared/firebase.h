#ifndef FIREBASE_H
#define FIREBASE_H

#include <QObject>
#include <QtNetwork/QNetworkAccessManager>
#include <QtNetwork/QNetworkReply>
#include <QtNetwork/QNetworkRequest>
#include <QUrl>
#include <QUrlQuery>
#include <QDebug>
#include <QtGlobal>
//#include <datasnapshot.h>
#include <QJsonDocument>

class Firebase : public QObject
{
    Q_OBJECT
public:
    explicit Firebase(QObject *parent = 0);
    Firebase(QString hostName,QString child);
    Firebase(QString hostName);

    void setValue(QString str);
    void setValue(QJsonDocument jsonDoc
                  , const QString& verb = "PATCH"
                  , const QString &endPath = "");
    void getValue();
    void getValue(QUrl url);
    QUrl getPath();
    void deleteValue();
    void setToken(QString);
    //QString getToken(const QString &serviceAccount, const QByteArray &privateKey);
    void listenEvents();
    Firebase* child(QString childName);

signals:
    void eventResponseReady(QByteArray);
    void eventDataChanged(QString);//DataSnapshot*);
public slots:
    void replyFinished(QNetworkReply*);
    void onReadyRead(QNetworkReply*);
    void eventFinished();
    void eventReadyRead();
private:
    void init();

    QByteArray signMessage(QByteArray toSign, QByteArray privateKey);

    QString host;
    QString firebaseToken="";
    QNetworkAccessManager *manager;
    QString currentNode;
    QString latestNode;
    QString buildPath(int, const QString endPath = "");
    QString buildSetPath(const QString endPath = "");
    QString buildGetPath();
    QString createJson(QString);
    void open(const QUrl &url);
    QByteArray trimValue(const QByteArray &line) const;
};

#endif // FIREBASE_H
