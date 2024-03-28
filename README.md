# RC Light System
The *Arduino Starter Kit*, the official one with a bunch of parts and a book, was my first real introduction to working with electronics. Sure, I had put a new power plug on various things as a child of a different time that this one. What I hadn't done, was learn how to not blow things up when trying out new things. Arduino is pretty much perfect for that. Not in that you won't blow things up, it's more a case of blowing up really cheap parts and you rarely, if ever, actually set anything on fire. Working through it all, I wanted to create a project of my own - I would make a better light system for RCs.

![RC Dashboard](https://raw.githubusercontent.com/tebl/RC-Light-System/main/gallery/build_dashboard_022.jpg)

Yeah! Turns out that doing exactly that, requires understanding a lot more than simply plugging an LED into a breadboard and turning it on or off - there's logic levels, reading a PWM signal and then figuring out how to design your own PCBs. So I eventually put my parts in the infamous *"someday"* pile. A decade later, I've learned a few things and it was time to take something off that pile and try again! 

As I had a lot of fun doing it, I wanted to build a multitude of slightly different things around the same core theme - RCs, lighting and cool effects. For that reason I found it easier to organize them into their own sub-projects, so follow the links to the ones you are specifically interested in.

- [1> Modules](#1-modules)
  - [1.1> RC Light System](#11-rc-light-system)
  - [1.2> RC Exhaust](#12-rc-exhaust)
  - [1.3> RC Dashboard](#13-rc-dashboard)

# 1> Modules
For the technical details as well as information regarding the modules included by this specific github project, consult the table below and follow along to the things that interest you. As each module will realistically end up being done in several different ways, they will each come with their own set of documentation as well as BOM-listings. Organized separately, you are recommended to check out the [schematics](https://github.com/tebl/RC-Light-System/tree/main/documentation/schematic) for detailed information about how the electronic side of these things work.

| Module                            | Description                                      |
| --------------------------------- | ------------------------------------------------ | 
| [RC Light System](#11-rc-light-system)  | A functional light system for RCs. It's big, bulky and does mostly what I want it to do.
| [RC Exhaust](#12-rc-exhaust) | Controls an RGB LED mounted inside the exhaust pipe of an RC. On heavy throttle it starts glowing red, ease up on the trottle afterwards and you get flashing colours as it backfires.
| [RC Dashboard](#13-rc-dashboard) | Connected to the receiver, it shows a digital throttle gauge on a small OLED-screen.

## 1.1> RC Light System
This is the project I had originally intended to design, almost a decade ago. A lighting system with some kind of intelligence in it, so that it wouldn't turn on the blinkers when turning at any sensible amount of speed. My second requirement was that it should be detachable by cable, mostly so that the electronics mounted on the chassis could be separated from those that are stuck to the body.

I can't physically work with small components, so as for any practical usage you will need a lot of space to install this - possibly a truck of some kind. Other than that, consider it *educational* material.

## 1.2> RC Exhaust
Working with the [RC Light System](#11-rc-light-system), I came across small metal exhaust pipes for 1:10 RCs on AliExpress. Arriving in the mail a couple of months later I knew I had to install them in something, given that they were designed to fit an LED inside it - I wanted something more exciting than a basic effect. I wanted it to glow red on heavy throttle, backfire when easing up on the throttle and so on!

| Module                            | Description                                      |
| --------------------------------- | ------------------------------------------------ | 
| [RC Exhaust Digispark](https://github.com/tebl/RC-Light-System/tree/main/RC%20Exhaust%20Digispark)  | Exhaust-module based around Digispark, with capability for RGB colour LED.

## 1.3> RC Dashboard
Tightly related to the [RC Exhaust](#12-rc-exhaust)-module in terms of implementation, mostly because I initially couldn't get it to work - so in the end I had to put a screen on one, all in order to figure out all the ways it had initially failed to work. That doesn't sound like a fun thing to build, but when doing it I had an idea - why not mount the screen inside the interior of an RC car? Cars generally have those, we call them *"dashboards"*.

[![YouTube image](https://raw.githubusercontent.com/tebl/RC-Light-System/main/gallery/youtube_dashboard_preview.png)](https://youtube.com/shorts/HmBhJOPVMgE)
An electric RC doesn't exactly have a lot of telemetry that's available to plug into, but at least I can put a throttle gauge on it. Nowadays you'd probably want an analog one, but I designed this one to mimic the future that was on display in a limited selection of 80s and 90s.

| Module                            | Description                                      |
| --------------------------------- | ------------------------------------------------ | 
| [RC Dashboard Digispark](https://github.com/tebl/RC-Light-System/tree/main/RC%20Dashboard%20Digispark)  | Dashboard-module based around Digispark.