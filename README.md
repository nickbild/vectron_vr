<p align="center">
<img src="https://raw.githubusercontent.com/nickbild/vectron_vr/master/img/vectron_vr.png">
</p>

# Vectron VR

Vectron VR is a virtual reality peripheral for the [Vectron 64](https://github.com/nickbild/vectron_64) 6502 CPU-based breadboard computer.  It delivers independent 320x240 pixel images to each eye, thereby producing a stereoscopic 3D visual effect.

To demonstrate the abilities of the system, the 3D game [Asteroids VR](https://github.com/nickbild/vectron_vr/blob/master/asteroids_vr.asm) has been developed.

![Vectron VR angle](https://raw.githubusercontent.com/nickbild/vectron_vr/master/img/20190611_205845_sm.jpg)

![Vectron VR top](https://raw.githubusercontent.com/nickbild/vectron_vr/master/img/20190611_205627_sm.jpg)

![Vectron VR lens](https://raw.githubusercontent.com/nickbild/vectron_vr/master/img/20190611_205725_sm.jpg)

## Circuit Diagram

Coming soon.

## Hardware Optimizations

### Co-processing

One of the more notable optimizations that allow this to run at a rapid frame rate on a 6502 could be thought of as a primitive form of co-processing.

The TFT LCD screens operate via SPI.  This means that each bit needs to be individually clocked to the screen.  There are 76,800 addressable pixels, each of which requires 2 bytes of color data (16 bits!) to place a single pixel (plus some additional setup to choose the coordinates).  The low clock speed of the 6502 makes clocking in each bit via processor instructions too slow for the rapid refresh rate needed for something like a video game.

I sped this up greatly by adding hardware that will send exactly 7 square wave pulses at a rate of 7MHz after a signal is given at a specific address.  So, I am able to issue the 1st clock for each byte programmatically, then the next 7 happen for free without the need for any control from the CPU (a shift register is storing the byte data before the 1st clock).  Since this clocking happens at 7MHz, all 7 pulses will occur in 1 microsecond.  The fastest instruction for a 6502 takes 2 clocks to execute (system clock speed 1.75MHz).  As such, it is impossible for another instruction to interrupt the automatic clocking after it begins.  I can start it, forget it, and continue with normal program execution.  No need for any delay cycles!

### Clock Speed Increase

The second optimization is a little bump up in the system clock speed.  The Vectron 64 normally runs at 1MHz.  I've increased that to 1.75MHz for a free 75% speed boost.  This is well within the boundaries of what the 6502s of old could be clocked at, so the Vectron 64 is still staying true to its retrocomputing roots.

### Parallel Screen Updates

A third optimization is the sharing of data and clock lines between the LCD screens.  Only the CS (chip select) pins are uniquely addressable.  This setup allows common elements to be drawn simultaneously on both screens by enabling the CS on both screens at the same time.  This cuts the time required to draw background elements in half.

## How Does It Work?

An identical background image is drawn for both eyes.  Any element that should be in 3D (asteroid, cockpit control, etc.) is drawn in slightly different positions for each eye.  When our eyes recognize a difference between the two images, we perceive that difference as depth.  The result is that we perceive that we are seeing a single image, and certain elements appear to be floating at different depths, depending on the distance between them in the pair of screens.  See [Wikipedia - Stereopsis](https://en.wikipedia.org/wiki/Stereopsis) for more information.

## Asteroids VR

[Asteroids VR](https://github.com/nickbild/vectron_vr/blob/master/asteroids_vr.asm) is a 3D first person reimagining of the classic [Asteroids](https://en.wikipedia.org/wiki/Asteroids_(video_game)) game, written in 6502 assembly.  You sit in the cockpit of your spaceship (with 3D controls), looking out at the black void of space, while you blast away at asteroids that appear to be coming towards you.

### Controls

| Key | Function |
| --- | -------- |
| A | Fly Left |
| S | Fly Right |
| Q | Nose Down |
| Z | Nose Up |
| L | Fire Laser Cannon |

## About the Author

[Nick A. Bild, MS](https://nickbild79.firebaseapp.com/#!/)
