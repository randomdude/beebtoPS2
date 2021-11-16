Here's a project to enable you to use a modern (ish) PS/2 keyboard on your BBC Micro.

It is built around a Xilinx XC95144XL CPLD. Originally it was in a XC9572, which I love because they are 5v tolerant and also available in PLCC package. However, the design outgrew that chip, and so the TQFP XC95144XL is now required.

The board itself is pretty simple. There's a comparator and a couple octal buffers to sequence power, since otherwise the IO lines may go higher than vcc during power-up, by enough that the CPLD can be damaged. Then there's just the PS/2 socket for your keyboard, 8 debug LEDs, and some DIP switches (which map to the BBC micro's configuration bits). 

Please let me know if you build one, or find this interesting!