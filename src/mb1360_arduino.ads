--  Source: UM2324 Rev 5, Table 12 ("ARDUINO connector pinout").
--
--  Notes: A4/A5 factory default routes CN8 pins 5/6 to ADC-capable
--  PB11/PB12. Solder bridges SB2-SB5 can reroute them to PB9/PB8
--  (shared with D14/D15) for I2C1 instead.

with STM32.Device; use STM32.Device;
with STM32.GPIO; use STM32.GPIO;

package MB1360_Arduino is

   A0 : GPIO_Point renames PA0;
   A1 : GPIO_Point renames PA1;
   A2 : GPIO_Point renames PA4;
   A3 : GPIO_Point renames PB1;
   A4 : GPIO_Point renames PB11;
   A5 : GPIO_Point renames PB12;

   D0  : GPIO_Point renames PC5;
   D1  : GPIO_Point renames PC4;
   D2  : GPIO_Point renames PA10;
   D3  : GPIO_Point renames PB3;
   D4  : GPIO_Point renames PB5;
   D5  : GPIO_Point renames PB4;
   D6  : GPIO_Point renames PB14;
   D7  : GPIO_Point renames PA8;
   D8  : GPIO_Point renames PA9;
   D9  : GPIO_Point renames PC7;
   D10 : GPIO_Point renames PB0;
   D11 : GPIO_Point renames PA7;
   D12 : GPIO_Point renames PA6;
   D13 : GPIO_Point renames PA5;
   D14 : GPIO_Point renames PB9;
   D15 : GPIO_Point renames PB8;

end MB1360_Arduino;