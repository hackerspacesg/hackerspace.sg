## Using the Makerbot Cupcake CNC at HackerspaceSG

### About the Printer

It is a [Makerbot](http://makerbot.com/) [batch 12 Cupcake CNC](http://en.wikipedia.org/wiki/MakerBot_Industries#Cupcake_CNC), serial #887. It includes a Plastruder MK3 and a non-heated acrylic build platform.

### Preparing Your Computer

- Install Java and then ReplicatorG for [Linux](http://replicatorg.googlecode.com/files/replicatorg-0025-linux.tgz), [Mac](http://replicatorg.googlecode.com/files/replicatorg-0025-mac.dmg) or [Windows](http://replicatorg.googlecode.com/files/replicatorg-0025-windows.zip). Note that version 25 is recommended. Later versions might work, but some - notably the latest version (version 40) - are not able to control the Cupcake CNC.
- Connect the printer's black USB cable to your machine. If your operating system requires drivers to be installed to talk to the serial port built into the cable then do that now.

### Connecting to the printer

- Set up the printer on a table, plug it in, turn on the power switch on the motherboard (large red board on one side, power switch is at the bottom left). You should be able to hear the power supply fan and there should be a LED or two on or flashing on various of the ciruit boards.

![](/cupcake/power-switch.png)
- If it's not already connected, connect the USB cable to your computer.
- Run ReplicatorG, use Machine > Serial Port to find and select your serial port. You may need to
	- Unplug and replug the USB cable
	- Machine > Serial Port > Rescan serial ports
	- Machine > Serial Port > {whatever}
- Set Machine > Driver to Cupcake Basic.
- Click the Connect icon.
- The bar below the icons should turn green and display "Machine test ready" and the text console at the bottom of the window should display something like the following. Note in particular firmware version 2.4 on **both** the motherboard and the toolhead. If you don't see firmware versions for both boards, or if you see later versions because someone has thoughtfully upgraded to an unsupported version then stop and [get help](http://rolandturner.com/contact).

    [17:21:05] Loading simulator.

    [17:21:05] Loading driver: replicatorg.drivers.gen3.Sanguino3GDriver

    [17:21:05] Connecting to machine using serial port: /dev/ttyUSB1

    [17:21:05] Motherboard firmware v2.4 (Cupcake)

    [17:21:05] Toolhead 0: Extruder controller firmware v2.4 ()

- If you see a suggestion that you upgrade the firmware **please don't do it**. Newer firmware versions don't work correctly with the Cupcake CNC.
- Click on Machine -> Control Panel.
- The control panel should appear. The current temperature (both numerically and the red line on the graph) should be room temperature.

### Controlling X/Y/Z Axes
- Set the Jog Mode to 10mm
- Click on the Z+ arrow. The print head should move up 10mm.
- Clicking on X+/X-/Y+/Y- should move the orange build platform around.
- Clicking on Z- should move the print head down. **Please don't move it down further than the build platform**. If the head does come in contact with the platform then back it off again and ensure that the four corners of the clear acrylic tool platform are sitting squarely on their respective nuts.

### Loading Filament

If the supply of filament is still connected to the plastruder then you can skip to [Preparing the Printer to Print](#PreparingThePrinterToPrint).

This is the most delicate part of the Makerbot. **Any time you're going to run the filament motor, double check that the Current Temperature is at least 220C first.** If you run the motor with the filament at a lower temperature then you are likely to do physical damage to the plastruder that will require new parts and an overhaul to resolve.

The printer is often stored with a leftover piece of filament still in the plastruder but cut with wire cutters to separate it from the supply to allow the printer and filament supply to be handled separately.

![](/cupcake/leftover-filament.png)

To remove the leftover filament and reload the supply:
- Set the Target Temperature to 230C. Notice that the blue line (Target Temperature) on the graph has moved from 0 to 230 and that the red line (Current Temperature) has started climbing.

![](/cupcake/temperature-starts-climbing.png)
- Wait until the temperature stabilises at 230C.

![](/cupcake/temperature-stabilises.png)
- Use a knife or similar (not your fingers!) to remove any filament at the print nozzle.

![](/cupcake/remove-filament-at-nozzle.png)
- **Double check that the Current Temperature is still 230C**. Set Motor Speed (PWM) to 255 and set Motor Control to reverse

![](/cupcake/run-motor-in-reverse.png)
- If you touch the filament poking out of the top of the plastruder you should feel it moving **very** slowly out.
- Wait until it stops moving (a minute or two).
- Gently pull the leftover filament out.

![](/cupcake/gently-pull-the-leftover-filament-out.png)
- Set Motor Control to stop. The plastruder should go quiet.
- Place the end of the supply of filament back into the same hole.
- **Double check that the Current Temperature is still 230C**. Set Motor Control to forward and gently press the filament into the plastruder until the motor begins to take it from you.
- Wait until narrower filament starts coming out of the print nozzle (a minute or two).

![](/cupcake/filament-comes-out.png)
- Set Motor Control to stop.
- Once again, use a knife or similar to remove the filament at the nozzle.

![](/cupcake/remove-filament-at-nozzle.png)
- Set the Target Temperature to 0. Check that the blue line has switched to 0 and that the red line has started to fall.

<a name="PreparingThePrinterToPrint"> </a>
### Preparing the Printer to Print

- Wait until the Current Temperature has dropped below 100C, otherwise you'll be placing the hot nozzle in contact with the build platform which will do [more] damage to it.
- Use the Z+/- controls to place the nozzle a few mm above the build platform.
- Use the X+/- and Y+/- controls to position the build platform's centre mark under the nozzle.
- Use the Z+/- controls to place the nozzle about half a mm above the build platform (you can just slide a sheet of paper between the nozzle and the platform).
- Click "Make current position zero".

### Preparing a File to Print

The standard file format for describing an object for 3D printing is a .stl file which describes the object as a series of layers that can be printed. You'll can use a CAD program or similar to generate such a file of what you want to print. Alternatively, you can simply download completed models from [Thingiverse](https://www.thingiverse.com/) like this [pawn](https://www.thingiverse.com/thing:13804).

You then need to convert to g-code which is the series of low-level instructions to the printer (move motor A, turn heater on, etc.).

- File > Open > {your .stl file}
- Admire the model in the viewing window in ReplicatorG. Click and hold your left mouse button and then move your mouse around to see it from different angles, etc.
- Click Generate Gcode.
- Select SF35-cupcake-HBP. This is not strictly the correct profile as we don't have a heated build platform, but it's near enough.
- Turn on Use Raft. This adds a "base" to the model that you'll separate after you remove your print. It smoothes over various potential alignment problems.
- Set "Use support material" to None. The Cupcake CNC can only print with one material at a time.
- Turn off "Use Print-O-Matic (stepper extruders only)". We don't have these options.
- Click Generate Gcode.
- Watch the fascinating progress bar. Once it's finished, hopefully you can see:

	[18:39:09] Toolpath generation complete!

### Starting a print

- Verify that the bar below the icons on ReplicatorG is green and showing "Machine test ready".
- Verify that the filament supply is connected.
- Verify that the print nozzle is ~0.5mm above the centre mark on the build platform.
- GCode > Build
- Notice the print head being raised above the build platform.
- Notice that the bar below the icons is now yellow, says "Building..." and shows a Temp: field towards the right which is gradually climbing to 220C
- Wait a minute or two.
- The filament motor will run for a few seconds and emit a little narrow filament out of the nozzle.

![](/cupcake/filament-comes-out.png)
- A dialog box saying "The heater is warming up and will do a test extrusion. Click yes after you have cleared the nozzle of the extrusion."
- Once again, remove the extrusion with a knife or similar.
- Click Yes.
- The nozzle should return to the build platform and begin printing the raft, and then the object that you chose to print on top of it. This could take a while.

### Removing a print
- When the print finishes the print head will be raised some distance above the printed object and a "Build finished" dialog will appear. The Target Temperature will be set to 0 and the print head will begin to cool down.
- Remove the build platform by lifting one corner.

![](/cupcake/lift-one-corner.png)
- Pull the object off the platform by hand, or use a knife or trowel to work it off.
- Place the build platform back in position. Three screwheads line up with three holes and magnets hold it in place.
- Peel the raft off.

![](/cupcake/peel-the-raft-off.png)
