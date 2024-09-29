"This door is alarmed!" by Kent Quirk

Chapter 1 - Getting in

[--define a keypad--]
A keypad is a kind of thing. A keypad has some text called the code. A keypad is scenery. 
		
Understand "type [text] on [something]" as keypad-typing. 
Understand "type [text]" as keypad-typing.
Understand "enter code [text] on [something]" and "enter [text] on [something]" as keypad-typing when a keypad is visible. 
Understand "enter code [text]" and "enter [text]" as keypad-typing when a keypad is visible.
Understand "disarm [something] with [text]" as keypad-typing (with nouns reversed). 
Understand "disarm with [text]" and "disarm [text]" as keypad-typing.

Keypad-typing is an action applying to one topic and one thing.

Check keypad-typing:
	if the second noun is not a keypad, say "[The second noun] is unlikely to be much use in that respect." instead.

Carry out keypad-typing the topic understood:
	let input be "[the topic understood]";
	let length be the number of characters in input;
	let KP be the second noun;
	unless input matches the regular expression "<0-9>+":
		if input is "code" or input is "alarm":
			say "You need to enter a numeric code.";
			rule fails;
		say "It's a purely numeric keypad.";
		rule fails;
	if length < the number of characters in the code of KP:
		say "Nothing happens.";
	otherwise if length > the number of characters in the code of KP:
		say "The alarm emits a brief chirp after the first [the number of characters in the code of KP] digits but that's all.";
	otherwise:
		if input is the code of KP:
			if the alarm is disarmed:
				now the alarm is armed;
				now the countdown of the alarm is 5;
				say "You have re-armed the alarm system!";
			otherwise:
				now the alarm is quiet;
				now the alarm is disarmed;
				say "The alarm goes silent and dark.";
		otherwise:
			say "The keypad emits a sad chirp but nothing else happens."

Rule for supplying a missing second noun while keypad-typing:
	if the player can touch a keypad (called target):
		now the second noun is the target;
	otherwise:
		say "You need to be near a keypad to type on it.".

An alarm box is a keypad. 
It has a number called countdown. 
It has a text called countdownMessage. 
It has a text called alarmSound. 
It has a room called alarmRoom.

The alarm box can be armed or disarmed. 
The alarm box can be quiet, triggered, or counting down. 

The description of the alarm box is "It's the control panel for a burglar alarm. It has a small speaker, a numeric keypad, a red LED labeled 'ARMED' which is [if disarmed]not [end if]lit, and a green LED labeled 'ALERT' which is [if quiet]dark[otherwise]flashing[end if]. There is also a display that says 'Enter Code to [if armed]Disarm[otherwise]Arm[end if]'.".

The code of the alarm is usually "9999".
The countdown of the alarm is usually 5.
The alarm is armed.
The alarm is quiet.
The countdownMessage of the alarm is usually "A tinny voice says 'INTRUSION ALERT -- [countdown]'."
The alarmSound of the alarm is usually "Just outside the door, an alarm is wailing."

 
To say tick message:
	If the alarm is counting down:
		Say "[the countdownMessage of the alarm]";
	otherwise:
		say "[the alarmSound of the alarm]".
		
Before going to a room (called the monitored room):
	if the monitored room contains an alarm and the alarm is armed:
		Now the alarm is counting down;
		The alarm ticks in one turn from now;
		Say "[tick message]".

At the time when the alarm ticks:
	if the alarm is armed:
		if the countdown of the alarm is 0:
			now the alarm is triggered;
			say "The alarm triggers with an earsplitting wail.  The neighbors will certainly call the cops.";
		otherwise:
			decrement the countdown of the alarm;
			the alarm ticks in one turn from now;
			say "[tick message]".


The Side Porch is a room. "You're on the side porch. The number is painted on a slate panel next to the door. The door leads west." 
Instead of going inside:
	if the location is the Side Porch:
		try going west;
		rule succeeds;
	
The Mud Room is a room. "This is an entrance hallway with a tiled floor. There is an alarm box on the wall next to the side door. The side door leads out to the east." 
Instead of going outside:
	if the location is the Mud Room:
		try going east;
		rule succeeds;
		
An alarm box is in the Mud Room.
The code of the alarm is "1729".

		
Instead of exiting:
	if the location is the Mud Room:
		try going east;
		rule succeeds;
		

The blue door is a door. "This is a navy blue door that has been faded and peeled by a western exposure." The description of the door is "It's [If the player is in the Side Porch]a blue door with a number next to it, heading in to the west.[otherwise]a door heading east to the outside." It is east from the Mud Room and west from the Side Porch. The blue door is locked. The brass key unlocks the blue door. The slate panel number is part of the blue door. The description of the slate panel number is "It's a bit of rough slate, hanging from a nail, with a painting of an anchor and '1789' in big numbers."


The player is holding the brass key. The player is in the side porch.

Test me with "unlock door / open door / w / look at alarm / type 123 on keyboard / east /look /west/ type 12345 / type 9999 /x key /x alarm / read key / x alarm / type 1789 / x alarm"