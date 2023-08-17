#include<lpc214x.h>

void init()
{
	PINSEL0 = 0x05;
	U0FCR = 0x07;
	U0LCR = 0x83;
	U0DLL = 0x5D;
	U0DLM = 0x00;
	U0LCR = 0x03;
}

void delay()
{
	int i;
	for(i=0; i<=270;i++);
}

int main()
{
	int z;
	unsigned char p[]= "i love ise";

	init();

	for(z=0; z<=10; z++){
		U0THR = p[z];
		while(!(U0LSR & 0x20));
			delay();
	}
	while(1);
}
