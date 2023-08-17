#include <lpc214x.h>

void delay()
{
	int i;
	for(i=0; i<1000; i++);
}

int main()
{
	IODIR0 = 0x1; 
	while(1) {
		IOSET0 = 0x1;
		delay();
		IOCLR0 = 0x1;
		delay();
	}
}
