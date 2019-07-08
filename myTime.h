#ifndef _myTime_H
#define _myTime_H

#include <QObject>
#include <ctime>

class MyTime : public QObject
{
    Q_OBJECT

public:
    MyTime(QObject *parent = nullptr){};
	~MyTime(){};

public slots:
    void setTime();
};

#endif