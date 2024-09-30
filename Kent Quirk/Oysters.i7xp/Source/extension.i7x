Version 1/210309 of Oysters by Kent Quirk begins here.
"An extension for digging, opening, and eating oysters."

Use authorial modesty.

Section 1 - Oyster

There is an oyster. The oyster is an openable container. The oyster is edible. The oyster is closed. The description of the oyster is "It's a rough, oblong, oyster shell, with a couple of barnacles attached and some specks of mud." 

There is a pearl. The initial appearance of the pearl is "It's a small pearl, not quite spherical, but it will make a nice memento. Maybe Mom will like it.". The description is "A small pearl from an oyster." The pearl is nowhere.

There is meat. The meat is edible. The description of the meat is "The oyster meat glistens wetly. To some people, this is disgusting. To others, it is the nectar of the gods. You're in the latter camp." The meat is nowhere. The indefinite article is "some".

Section 2 - Oysters

several oysters are a thing. Understand "oyster" as the several oysters when the oyster is not visible. The description of the several oysters is "Sometimes oysters are buried in the mud and can be dug up at low tide."

Percentage of muddy oysters is a number that varies. Percentage of muddy oysters is 30.

[only non-muddy oysters can have pearls]
Percentage of pearly oysters is a number that varies. Percentage of pearly oysters is 20.

Oyster Count is a number that varies. Oyster Count is 0.

To decide whether muddy:
	let the mud roll be a random number between 1 and 100;
	if the mud roll is greater than the percentage of muddy oysters:
		decide no;
	decide yes.
	
To decide whether pearly:
	let the pearl roll be a random number between 1 and 100;
	if the pearl roll is greater than the percentage of pearly oysters:
		decide no;
	decide yes.
	
Understand "mud" as the several oysters.

Instead of taking the several oysters (this is the taking oysters from mud rule):
 	If the oyster is off-stage:
		say "You dig in the mud and come up with an oyster.";
		now the oyster is closed;
		move the oyster to the location;
		try taking the oyster;
		increment oyster count;
		let the mud odds be a random number between 1 and 100;
		unless muddy:
			move the meat to the oyster;
			if pearly:
				move the pearl to the oyster;
		rule succeeds;
	otherwise:
		say "You are already holding an oyster. You should probably do something with it first."

Instead of eating the several oysters (this is the eating unheld oysters rule):
	say "You're not holding an oyster."
	
Section 3 - Tool

The funny tool is a thing. The description of the funny tool is "The tool has a rubber handle and a wide, flat, rounded blade." Understand "oyster knife" and "knife" as the funny tool. The funny tool has a truth state called identified.

After examining the funny tool (this is the learn the name of the tool rule):
	If the player is holding an oyster:
		Now the printed name of the funny tool is "oyster knife";
		Now the description of the funny tool is "It's an oyster knife.";
		Now identified of the funny tool is true;
		say "Aha! It's an oyster knife."
		
Section 4 - Verbs

Understand "dig [something]" or "dig for [something]" or "dig up [something]" or "dig in [something]" as taking.

Understand "slurp [something]" as eating.

Section 5 - Actions

Check taking an oyster (this is the take oyster rule):
	If the player is carrying an oyster, say "You already have one!" instead.

Check eating an oyster (this is the check before eating rule):
	If the oyster is closed:
		say "You need to open the oyster first." instead.

Carry out eating an oyster (this is the eat oyster rule):
	now the oyster is nowhere;
	now the meat is nowhere;
	say "You slurp down the contents of the oyster, and toss the shell away."
		
Instead of eating the meat (this is the eat oyster meat rule), try eating the oyster.

Instead of taking the meat (this is the take oyster meat rule), say "That's messy. Just slurp it from the shell."

Instead of unlocking an oyster with the funny tool (this is the open oyster with knife rule):
	try examining the funny tool;
	try opening the oyster;

Instead of opening the oyster (this is the generic open oyster rule):
	If the oyster is open:
		say "It's already open!";
	otherwise if identified of the funny tool is false:
		say "See if you can find something to open it with.";
	otherwise:
		Unless the player is holding the funny tool:
			say "It's closed tightly. You need to find something you can use to to open it.";
		otherwise:
			say "[line break]You work the blade of the oyster knife carefully into the corner of the oyster and twist until it pops open.";
			now the oyster is open;
			if the pearl is in the oyster:
				try taking the pearl;
				say "[line break]To your surprise, there is a pearl glistening on top of the oyster meat. You carefully pick it out. ";
			if the meat is not in the oyster:
				now the oyster is nowhere;
				say "[line break]The oyster shell is full of mud! You toss it away in disgust. [paragraph break]It's probably worth another try.";
			rule succeeds;
		

Oysters ends here.

---- DOCUMENTATION ----

This provides a way to have oysters in the mud on a beach at low tide. It also defines a special oyster knife with which to open oysters. Some oysters contain mud instead of meat. Some oysters can contain pearls in addition to meat. 

Place "several oysters" in the room and the player can dig them up.

The random probability that a given oyster is mud instead of meat is controlled by "percentage of muddy oysters". The default is 20.

The random probability that a given meaty oyster contains a pearl is controlled by "percentage of pearly oysters". The default is 30.

You can also override these behaviors by overriding the adjectives "muddy" and "pearly". For example, to prevent oysters from ever being muddy:

	To decide whether muddy:
		decide no.
		
The system also maintains "oyster count", which is the count of oysters that have been delivered. If you want muddy and pearly to be a sequence instead of random, see below.


Example: *** The Beach - Simple use of the oysters. 

	*: "The Beach"
	
	Include Oysters by Kent Quirk.

	The Beach is a room. "You're on a muddy beach at low tide. There are probably oysters under the mud."  There are several oysters in the Beach. 
		
	There is a funny tool in the Beach. 
	
	Test me with "take tool / x tool / drop tool / take oyster / x oyster / eat oyster / open oyster / take tool / open oyster with tool / x oyster / eat oyster"
	

Example: *** The Beach - deliver a known sequence of oysters. 

	*: "The Beach"
	
	Include Oysters by Kent Quirk.
	
	The Beach is a room. "You're on a muddy beach at low tide. There are probably oysters under the mud."  There are several oysters in the Beach. 
	
	To decide whether muddy:
		if the oyster count is 3:
			decide yes;
		decide no.
		
	To decide whether pearly:
		if the oyster count is 4:
			decide yes;
		decide no.
		
	after taking a pearl:
		say "I'm rich!".
			
	There is a funny tool in the Beach. 
	
	Test me with "take tool / take oyster / x tool / open oyster / eat oyster / take oyster / open oyster / eat oyster / take oyster / open oyster / take oyster / open oyster "