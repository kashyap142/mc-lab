#include <stdio.h>
#include <NUC1xx.h>
#include <Driver\DrvSYS.h>
#include <Driver\DrvGPIO.h>
#include <Driver\DrvUART.h>

void init()
{
	int i;
	for(i=12; i<15; i++) {
		DrvGPIO_Open(E_GPA, i, E_IO_OUTPUT);
		DrvSetBit(E_GPA, i);
	}
}

int main()
{
	UNLOCKREG();
	DrvSYS_Open(48000000);
	LOCKREG();
	
	init();
	
	while(1) {
		//BLUE
		DrvGPIO_ClrBit(E_GPA, 12);
		DrvSYS_Delay(10000);
		
		// green
		DrvGPIO_SetBit(E_GPA, 12);
		DrvGPIO_ClrBit(E_GPA, 13);
		DrvSYS_Delay(10000);
		
		// red
		DrvGPIO_SetBit(E_GPA, 13);
		DrvGPIO_ClrBit(E_GPA, 14);
		DrvSYS_Delay(10000);
		
		// all off
		DrvGPIO_SetBit(E_GPA, 14);
		DrvSYS_Delay(10000);
	}
}