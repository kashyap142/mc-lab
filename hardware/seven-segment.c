#include <stdio.h>
#include <NUC1xx.h>
#include <DrvSYS.h>
#include <Seven_Segment.h>

void display(int16_t value)
{
	int8_t digit;
	digit = value / 1000;
	close_seven_segment();
	show_seven_segment(3, digit);
	DrvSYS_Delay(10000);
	
	value = value - digit * 1000;
	digit = value / 100;
	close_seven_segment();
	show_seven_segment(2, digit);
	DrvSYS_Delay(10000);
	
	value = value - digit * 100;
	digit = value / 10;
	close_seven_segment();
	show_seven_segment(1, digit);
	DrvSYS_Delay(10000);
	
	value = value - digit * 10;
	digit = value;
	close_seven_segment();
	show_seven_segment(0, digit);
	DrvSYS_Delay(10000);
}

int main()
{
	int16_t i = 1;
	UNLOCKREG();
	DrvSYS_Open(48000000);
	LOCKREG();
	
	while(i < 10000) {
		display(i);
		i++;
		DrvSYS_Delay(10000);
	}	
}
