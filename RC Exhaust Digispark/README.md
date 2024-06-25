# RC Exhaust (Digispark)
Working with the RC Light System, I came across a small metal exhaust pipe for 1:10 RCs on AliExpress. Arriving in the mail a couple of months later, I knew I had to install them in something. Careful measuring revealed that they were designed to fit an LED inside it, and later versions that I picked up even came with one included. I did however want something that was a little more dynamic than a static LED could provide and while I could have gone with the 555, I went the full route of the Attiny85. Granted, I did have some Digispark modules that I'd never found a use for. Until now.

The plan was to have the exhaust pipe glow red on heavy throttle, then backfire when easing up on the throttle. It'll throw in some regular sparks here and there to make it come alive a bit more than that, but the code is included here if you want something else.

- [1> Building the device](#1-building-the-device)
- [2> Schematic](#2-schematic)
- [3> BOM](#3-bom)

# 1> Building the device
Building the device should be a straight-forward affair, you just solder the meager selection of components into place. Pay attention to keep the alignment of the parts somewhat straight, then you should be good. This documentation was written with a board that looks like the following in mind, but note that the github-repository may contain changes that have yet to be tested (therefore, it is recommend that PCBs are ordered using PCBWay links listed in the BOM).

The Attiny85 is a 5v chip, and we're connecting it to a 6v source due to it living inside an RC. Normally that would toast it as we're working outside the acceptable ranges, but we're using a diode with a voltage drop that's up to 0.7v - bringing us withing the tolerances of the chip. As for installation, just match the silver stripe on the component to the stripe part on the board and you're good to go.

Resistors should be added, but you can *probably* skip R4 and R5 - those form a voltage divider in case the receiver is sending out a signal that's above 3.3v. I've not encountered any of those, but then again - I don't have RC equipment older than a decade or so. Link the corresponding *NO_VOL_DIV* pads on the back of it if you've skipped them.

The three at the bottom are for the LEDs, here you may need to match the datasheet for your specific LED, per colour, in order to arrive at a suitable resistor value. Consult a [LED Series Resistor Calculator](https://www.digikey.com/en/resources/conversion-calculators/conversion-calculator-led-series-resistor) if you need to (set supply voltage to 5.3v, fill in 10mA current for blue/green and 15mA for red).

The Digispark itself is then soldered on top, with straight pin headers between the two. It doesn't matter if you used the Digispark shaped like a "USB-key", or if it has a Micro-USB socket on it - they fit just the same. Personally I prefer the former as it is easier to wipe off compared to pulling debris out of a socket.

The LED must be attached to the board using a removable lead, which is why I'm using JST XH plugs on mine. When wiring for an RGB LED it must be a common anode variety, but you can use a normal LED as well - just wire it up to the board as *RED*. If you don't care about being able to reprogram the board later, you can just solder the wires directly. When soldering onto the LED legs, I recommend using heat shrink tubing to avoid any accidents. An easier alternative is to use a pre-wired red LED and just connect up those two leads, but won't look as fancy.

The left hand side is where you connect up the wire coming from the ESC, there are two here - mainly so that you could use it as a Y-lead without requiring any additional cables. Solder wires, or install pin headers depending on what you prefer.

# 2> Schematic
The supplied KiCad files should be sufficient as both a schematic and as a  starting point for ordering PCBs (basically you could just zip the contents of the export folder and upload that on a fabrication site), the schematic is also available in [PDF-format](https://github.com/tebl/RC-Light-System/tree/main/documentation/schematic) and this is what you'll need to print and work your way through when things fail to work as expected.

# 3> BOM
Most parts should be easy to get a hold of from your favourite local electronic component shop, but given that I don't have access to such shops where I live so everything was based on whatever I could get cheapest from eBay/AliExpress (free shipping, but plan on waiting 3-4 weeks for delivery). As I expect that most will build this adapter solely for MIDI-output, the values required for the MIDI input have been listed in parenthesis.

| Reference      | Item                                                  | Count | Order  |
| ---------------| ----------------------------------------------------- | ----- | ------ |
| Faceplate PCB  | Fabricate using Gerber files                          |     1 | PCBWay
| A1             | Digispark-module (with pin-headers)                   |     1 |
| D1 *           | 4-pin JST-XH socket                                   |     1 |
|                | 5mm LED, common-anode variety to 4-pin JST-XH plug    |     1 |
| D2             | 1N4001 diode (DO-41)                                  |     1 |
| J5,J6          | Straight pin-headers, alternatively wire a Y-splitter |     1 |
| R1             | 200 ohm resistor                                      |     1 |
| R2,R3          | 270 ohm resistor                                      |     2 |
| R4             | 10k ohm resistor                                      |    (1)|
| R5             | 20k ohm resistor                                      |    (1)|

*) You can come up with something else here, but JST-XH is what I recommend. They're keyed and locking so they won't come off very easily. For the LED, I recommend buying pre-wired 4-pin JST-XH leads with plugs already on it - you'll need to solder it to the individual LED legs though (use heat shrink tubing).
