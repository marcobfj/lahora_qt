#include "myTime.h"

void MyTime::setTime(){
	time_t now = time(0);
	tm *time = localtime(&now);

	printf("%d : %d : %d \n", time->tm_hour, time->tm_min, time->tm_sec );
}

//Agregamos algo y hacemos commit