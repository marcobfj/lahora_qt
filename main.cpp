#include <QCoreApplication>
#include <stdio.h>
#include <QTimer>
#include "myTime.h"


int main(int argv, char  **args)
{
	QCoreApplication app(argv, args);

	MyTime *hora = new MyTime(&app);
	QTimer *timer = new QTimer(&app);

	QObject::connect(timer, &QTimer::timeout, hora, &MyTime::setTime);
	timer->start(1000);

	printf("Hola esto esta en el main, test para gregar en github""\n", );

	return app.exec();
}

