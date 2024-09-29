"Basics"

The Room of Bewilderment is a room. The initial appearance is "You're bewildered." The appearance is "You're still bewildered." In the Room of Bewilderment is a panel of 57 brass buttons, a trap door, a lever marked DO NOT PULL, a brightly-gleaming sawblade, and a sheet of instructions in Mandarin. 

The other room is a room. 

The other room is north of Bewilderment.

The third room is a room. The appearance is "It looks the same, only different." The third room is west of Bewilderment.

A room has some text called initial appearance. The initial appearance is usually "".

A room has some text called appearance. The appearance is usually "".

A room can be previously-described or never-described. A room is usually never-described.

To say tell appearance of (R - a room):
	If R is never-described and the initial appearance of R is not "":
		say the initial appearance of R;
		now R is previously-described;
	otherwise:
		say the appearance of R;
		
definition: a direction (called di) is viable:
	if the room di of the location of the player is nothing, decide no;
	decide yes; 

To say exits:
	let L be a list of text;
	repeat with the way running through directions:
		if the way is viable:
			let R be the the room way of the location of the player;
			if R is unvisited:
				add "[way]" to L;
			otherwise:
				add "[way] to [the R]" to L;
	if the number of entries in L is 1:
		say "The only exit [one of]leads[or]is[or]goes[purely at random] [L].";			
	otherwise:
		say "Exits [one of]lead[or]go[or]are[purely at random] [L]."


The description of a room (called R) is usually "[tell appearance of the location of the player][line break][exits]"

When play begins: say "You step into the Room of Bewilderment with the words of the host ringing in your ears: you can always ask for HELP."

Include Basic Help Menu by Emily Short.

Table of Basic Help Options (continued)
title	subtable	description
"Contacting the author"	--	"If you have any difficulties with [story title], please contact me at..."
"Hints"	Table of Hints	--
"Settings"	Table of Setting Options	--

Table of Hints
title	subtable	description	toggle
"What do I do with the string?"	Table of String Hints	""	hint toggle rule

Table of String Hints
hint	used
"Remember that you know how to macrame."	a number
"Oh, come now, isn't it obvious?"

