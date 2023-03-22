# TangNano-1K-examples

TangNano-1K is the new ting FPGA board of GW1NZ-1 FPGA.   

Orignal TangNano is based on GW1N-1 FPGA, refer to: https://github.com/sipeed/Tang-Nano-examples

TangNano-1K have independent 27M oscillator for FPGA, and remove the psram chip(but keep the pad), use BL702 for programmer FPGA, refer to https://github.com/sipeed/RV-Debugger-BL702

## Examples

1. RGB led

Blink board led.

Visit `example_led/led_pjt` to see this project. Burn the `led_pjt.fs` into Tang Nano 1K to check your projuct.

[Tang Nano 1K Schematic](https://dl.sipeed.com/shareURL/TANG/Nano%201K/2_Schematic)

2. RGB 5_inch LCD

Drive the 5_inch RGB 40pin lcd screen.

Visit `example_lcd/lcd_pjt` to see this project. Burn the `lcd_pjt.fs` into Tang Nano 1K to check your projuct.

[Screen datasheet](https://dl.sipeed.com/shareURL/TANG/Nano%209K/6_Chip_Manual/EN/LCD_Datasheet)

3. RGB 4.3_inch LCD

Drive the 4.3_inch RGB 40pin lcd screen.

Visit `example_lcd/lcd_43` to see this project. Burn the `lcd_43.fs` into Tang Nano 1K to check your projuct.

[Screen datasheet](https://dl.sipeed.com/shareURL/TANG/Nano%209K/6_Chip_Manual/EN/LCD_Datasheet)

4. RGB 7.0_inch LCD

This screen using the same driver as 5_inch LCD.

## Questions

### Error code:RP2017

When you meet error code `PR2017`, just enable corresponding IO as regular IO.

![rp2017](./.assets/rp2017.png)

Click `Project` in top menu bar and choose `Configuration`, then enable the corresponding Dual Purpose Pin to deal with this error.