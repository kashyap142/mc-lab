#include <lpc214x.h>
unsigned int x = 1;

__irq void Timer0_ISR()
{
	x = x ^ 1;
	if(x)
		IOSET1 = (1 << 20);
	else
		IOCLR1 = (1 << 20);
	T0IR = 1;
	VICVectAddr = 0;
}

int main()
{
	IODIR1 = 0xffffffff;
	T0MR0 = 0x12345;
	T0MCR = 0x3;
	
	
	VICVectAddr4 = (unsigned)Timer0_ISR;
	VICVectCntl4 = 0x24;
	VICIntEnable = 0x10;
	
	T0TCR = 1;
	for(;;);
}
