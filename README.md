# Jumbo 7-Segment Clock and Programable Countdown Timer
A clock/timer using a set of large 7-segment two-color digit displays (18 pin, common anode).
Written for MicroPython, but may also work with CircuitPython (untested).

For the circuit, use two-color 12v 7-segment digits with 18 pins and in Common Anode configuration. Adjust circuit resistance as needed/desired/is safe for your hardware. I hold no responsibility for any circuits you create or possess that may or may not be derived from any of my projects. Just keep the magic smoke from escaping, and everything will be fine.

The digits I used have green and red LED's, and lighting them both simultaneously creates a third "amber" color (or more orange-ish or more yellow-ish depending on the brightness of each color). 

The code in this project was written with MicroPython for the Wemos/Lolin D1 Mini. In theory, any ESP8266 board could work fine with the code as-is. Any other MicroPython-compatible board that has an SPI port (i.e. ESP32) could also work if you change the pin names/numbers appropriately. But if you're just wanting to build this quickly without changing much (if anything), use the Lolin D1 Mini, preferably v4, but any revision should work.

The countdown timers can be easily configured by adding/removing/editing strings in the `TIMER_STRINGS` list at the top of `visual_timer.py`. (Note: Time should always be input as 24-hour time, and will always be displayed as such.)

# Getting Started
1. Input your WiFi name and password in the `Clock` class in `clock.py`.
2. Update the `TIMER_STRINGS` list in `visual_timer.py` as needed, in the format `HH:mm:ss:<color>:<True|False>`. Currently only 'red', 'amber', and 'green' are acceptable colors, and the True/False at the end tells the module whether to start a timer at that time (e.g. input 'False' for when a timer ends or to change the color of the clock, input 'True' for all timers that run consecutively.)
3. Flash your microcontroller with the appropriate firmware. I will not cover this since there are lots of tutorials out there.
4. Copy the files to the microcontroller. For MicroPython, use `ampy`. (enter `ampy --help` to get more info on those commands)
   1. You should only need these files: `clock.py`, `main.py`, `visual_timer.py`, and `TPIC6B595_ShiftRegister.py`
5. Connect all the digits in serial with the controller attached to the left-most digit (when looking at the digits' fronts).
   1. It may be possible to orient the digits opposite from this, but you may end up having to write all of your strings and times backwards.

# Code
## Timer
When a timer phase starts, it will illuminate three horizontal lines in each of the lower 5 digits, each line in each digit represents one minute. When the timer has 10 seconds left, it will blink all the segments in (up to) 10 digits in the first second, then flashes one digit less each second until zero. The digits will remain off for a second or two to signify the end of the timer, before either starting the next countdown/timer or displaying the time again.

I chose to run the timer in increments of 15 minutes (or less) because it was fairly easy to write the code for, and it seemed the most flexible while being easy to maintain. It also would've taken way too long to code a dynamic timer that could use up-to all of the digits+segments for the countdown. My setup only has 6 digits and with 7 or 8 segments in each didn't add up to any useful number of minutes. I may address this later.

The timer configuration strings were designed to be string to reduce memory usage instead of having a list of tuples or using a dict. I'm not sure exactly how much memory it saves, but there isn't a lot to work with in the ESP8266.

## Clock
Except while running a timer phase, the clock will display the time in 24-hour time, and will display green from 0:00 to 11:59, and will display red from 12:00 to 23:59.

Since the internal clock in the ESP8266 is really bad at staying accurate, the `clock.py` module will update the time every hour by calling out to worldtimeapi.org.

## main.py
Since there is so little memory to work with in the ESP8266, I had to slim down the modules as much as I could. To help with this, I added some useful `print`'s to show how much memory was being used before/after each import so that I could guage how much memory I had available or had to free up.

## Shift Register
This module I wrote myself based on the documentation/whitepaper for the TPIC6B595 chip. There are a few basic functions to send raw data to the registers and such, and there are a few functions that wrap those to make it easier to use the shift registers as a display. The goal was to make it as easy to use as the MAX7219 chip.
There may be an easier and possibly cleaner way to do this, but I was able to get this working after a lot of troubleshooting and more than a few frustrating read-through's of the document.

There are objects and functions in this module that help to translate the user's string input into something usable by the shift registers and the 7-segment display, while still being at least mostly recognizable as English characters on the display.

The order of the segments and everything had to be designed and built by hand, so there are ascii-art diagrams and lots of comments to keep track of it all.

# Circuit Design
The circuit/s was/were designed in KiCad. I chose the TPCI6B595 shift register because I needed something that could handle the 12v LED's in the displays. I attempted to use a level shifter as well as a logic inverter to boost the logic pins up to 5v, but later found that the TPIC6B595 accepted 3v logic, so it worked out in my favor. The circuit for the controller board might still have a spot to hold the shifter or inverter, but I've bypassed this in my current working setup and will probably fix it in the design if I need to order more circuit boards for it.

The controller board was one of my first circuit board designs and took a few iterations to get it right. The digit boards were mostly done other than I overlooked one through-hole when spacing them out. The resistors you use depend on the LED's that come in the digits you get. Some might have them built into the LED circuit. I had to test out different resistors to get one that didn't make the lights too dim and didn't allow the LED's to get too hot. I also had to use a different resistor for the dot on each digit to balance out the brightness between the dot and the other segments. I assume the difference was because it had only one LED where the other segments have multiple.

The digit boards are designed to be connected in serial, potentially as many as you can power with a single 12v power supply with a barrell jack. It would have been much easier and cleaner to use flat 2x4-pin cables to connect between the boards, but I didn't think of that at the time. It will most likely be included in the next revision.

# Future Plans and Ideas
## Code
1. Make the code easier to get started with/use. i.e. combining all of the configuration objects into a single place (a json file, or just inside `main.py`).
## Circuit
1. Change the connector pins on the digit boards to be compatible with 2x4-pin connectors/headers.
2. Revise the digit boards so that they can either have the microcontroller attached, or have the Serial port/pins attached.
## Bigger Scope (or separate project?)
1. Update hardware (or design a new project) that uses RGB-based 7- or 14-segment displays.
   1. Rip out LED's from single-color displays, replace with RGB LED's and configure them in a similar way.