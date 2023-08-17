#include <stdio.h>
#include <NUC1xx.h>
#include <DrvSYS.h>
#include <scankey.h>
#include <DrvGPIO.h>
#include <NUC1xx-LB_002/LCD_Driver.h>

int main()
{
	int8_t number;
	char text1[] = "SimpleLcdKeypad";
	char text2[] = "Keypad: ";
	
	UNLOCKREG();
	DrvSYS_Open(48000000);
	LOCKREG();
	
	Initial_panel();
	clr_all_panel();
	
	OpenKeyPad();
	print_lcd(0, text1);
	while(1) {
		number = Scankey();
		sprintf(text2+8, "%d", number);
		print_lcd(1, text2);
		DrvSYS_Delay(10000);
	}
}