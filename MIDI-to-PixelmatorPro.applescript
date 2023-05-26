-- Keyboard Maestro Setup
-- 1. Use a Midi trigger and move the knob in learning mode to  learn the desired controller knob's value. Set it to trigger on 'changes'
-- 2. Set variable 'triggerGroup' to '%TriggerValue%' [this is a truple of integers captured from the movement of the midi controller]
-- 3. Set variable 'midiValueX' to 'Variable%triggerGroup[3]%'  [Use 'X' as the number value of your Midi controller's knob, if it is labeled. This captures the third value fo the tuple, which is the value of the knob, so we can pass it to Pixelmator. This should be a value between 0 and 127]
-- 4. Add Semaphore Lock to chain and give it any name. [This reduces noisy data from the midi controller and makes the data transfer from the knob to Pixelmator Pro nearly real time]
-- 5. Add the AppleScript to the end of the chain. Incriment 'midiValueX' with a digit theat corresponds to the number of the knob on the controller. I ordered the color adjustments for Pixelmator Pro from the top down to make it easier to map the numbered knobs to the color adjustment.

-- Get the Midi value from Keyboard Maestro
tell application "Keyboard Maestro Engine"
	set midiValue3 to getvariable "midiValue3"
end tell

-- Pass the normalized value from Midi to Pixelmator to change Highlights values
on adjustHighlights(midiValue3)
	-- Scale MIDI value (0-127) to Pixelmator Pro's range (-200 to 200)
	set pixelmatorValue to (midiValue3 - 64) * 200 / 127
	tell application "Pixelmator Pro"
		tell the color adjustments of the first layer of the front document
			set its highlights to pixelmatorValue
		end tell
	end tell
end adjustHighlights

-- Call adjustHighlights with the MIDI value from Keyboard Maestro
adjustHighlights(midiValue3)
