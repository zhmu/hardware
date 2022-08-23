# Energy measurement

_Note: I have an energy meter with P1 support now, rendering this project obsolete_

Since I pretty much prefer to monitor things, I was wondering how I could monitor my energy usage without having to disassembly my energy meter (which isn't really legal) or without resorting to the so-called 'smart energy meter' which I don't trust due to privacy concerns. As my energy meter has a LED on it which flashes 1000x per kW/h it should be relatively straightforward to hook something up to take advantge of this.

As it turned out, monitoring is one thing, but how to inform my server (which isn't near my energy meter) that the LED has flashed? After some experimentation, RS-232 was quite cumbersome so a new idea was born: use a CAN transceiver (PCA82C250) to convert the UART TTL signal to something robust, transmit it over RJ-11 and have the other side use the same transceiver to obtain UART TTL signalling.

This is also my first PCB layout ever, which was never properly finished due to the advent of energy meters with P1 support.

# Schematics

 * [Schematics](images/energy-measurement-schematics.pdf)
