# MIDI-to-PixelmatorPro
Use a MIDI keyboard's knobs to control sliders in Pixelmator Pro.

Commerical products like LoupeDeck do not support Pixelmator Pro, but similar functionality can be achieved by using [Keyboard Maestro](https://www.keyboardmaestro.com/main/) as a bridge to recieve input from a MIDI keyboard and then use Pixelmator Pro's AppleScript support to control various aspects of the app.

# Requirments

1. Keyboard Maestro is required as a bridge to handle incoming MIDI data. It might be possible to use other bridges, but this works well, and KM has a ton of other uses.
2. Standard MIDI compatible keyboard. I tested this script with an Arturia Minilab MKII, but any MIDI compatible device should do. Ideally best to use one that has 8 or more knobs and touch pad buttons.

# Usage

1. Start by connecting the MIDI keyboard and launch Keyboard Maestro. Create a Macro Group and set it to use only the Pixelmator Pro and KM apps.
2. Add a macro and use a Midi trigger. Move the knob in learning mode to learn the desired controller knob's value. Set it to trigger on 'changes'
3. Set variable 'triggerGroup' to '%TriggerValue%' (this is a tuple of integers captured from the movement of the midi knob)
4. Set variable 'midiValueX' to 'Variable%triggerGroup[3]%'  (Use 'X' as the number value of your Midi controller's knob, if it is labeled. This captures the third value fo the tuple, which is the value of the knob, so we can pass it to Pixelmator. This should be a value between 0 and 127])
5.  Add Semaphore Lock to chain and give it any name. (This reduces noisy data from the midi controller and makes the data transfer from the knob to Pixelmator Pro nearly real time)
6.  Copy the AppleScript to the clipboard and add an AppleScript to the end of the chain. Replace 'midiValueX' with a digit that corresponds to the number of the knob on the controller. I ordered the color adjustments for Pixelmator Pro from the top down to make it easier to map the numbered knobs to the color adjustment.
7.  Add new macros for each knob you want to control
8.  MIDI tab pads can also be used to trigger actions in Pixelmator Pro. Study the PixelMator Pro Applescript Dictionary to the functionality you might want to map to these buttons.
9.  Enjoy!

![KM-Config](https://github.com/tonyknight/MIDI-to-PixelmatorPro/blob/main/KeyboardMaestro_Config.jpg)
