"momtour" by Kent Quirk

Include Room Description Control by Emily Short.
Include Tailored Room Description by Emily Short.

Chapter 1 - Room extras

A room has some text called initial appearance. The initial appearance is usually "".

A room has some text called appearance. The appearance is usually "".

A room has a text called tourKey. The tourKey of a room is usually "".

To say tell appearance of (R - a room):
	If R is unvisited and the initial appearance of R is not "":
		say the initial appearance of R;
	otherwise:
		say the appearance of R;

definition: a direction (called thataway) is viable:
	if the room thataway of the location of the player is nothing, decide no;
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


The description of a room (called R) is usually "[tell appearance of the location of the player] [exits]"


A room has a text called tourKey. The tourKey of a room is usually "".

The kitchen is a room.  The tourKey of the kitchen is "kitchen".

The dining room is a room. It is west of the kitchen. The tourKey of the dining room is "dining".

The living room is a room. The initial appearance is "The living room runs from back to front of the house. The entire back wall is a window looking south across the backyard to the harbor. There's a fireplace on the east wall between two doors." The appearance is "It's a happy room, with comfortable chairs and a good view." It is west of the dining room. The tourKey of the living room is "living".

The player is in the kitchen.

Mom is a woman in the kitchen. The description of Mom is "She's Mom. Looking stressed out. She's wearing Mom jeans, a flannel shirt, and running shoes." 

MomTour is a recurring scene. MomTour begins when Mom is in the location of the player. MomTour ends when Mom is not in the location of the player.

Table of MomTour dialog
item	comment	nextroom	dir
"kitchen"	"I hate these countertops."	dining room	west
"dining"	"Clean out the trophy cabinet."	living room	west
"living"	"I want that rug."	kitchen	east

The describe room gone into rule response (C) is "[The actor] [one of]stalks off to the[or]strides[or]moves on to the[or]heads[or]goes[at random] [noun]"

When MomTour begins:
	let the place be the location of the player;
	if the tourKey of the place is an item listed in the table of momtour dialog:
		say "'[comment entry] [one of]I'll be in[or]On to[or]To[or]Meet me in[or]Next is[at random] [the nextroom entry].'";
		if the best route from the location to the nextroom entry is a direction (called thataway): 
			try Mom going thataway;
			now Mom is in the nextroom entry;
			

Fred is a man in the kitchen. Fred is holding a knife.

The player is holding a shield.

Definition: a person is other if it is not the player.

To say greet local person:
	if an other person (called mac) is visible:
		say "[regarding mac]You greet [mac] but [they] [don't] respond.";
	otherwise:
		say "You talk to no one, and no one responds." 
			
Understand "hello" or "hi" as a mistake ("[greet local person]").

Understand "help" as a mistake ("[italic type]The basics:[line break]* You can move by specifying a direction -- compass directions like north, as well as up, down, in, and out.[line break]* You can take or drop various objects.[line break]* You can look at/examine things, or search them.[line break]* You can see what you are carrying with 'inventory'.[line break]* You can talk to other characters by saying 'tell x about y' or 'ask x about y'.[line break]* Typing savers: n for north, etc; i for inventory; x for examine.[line break]In general, the game tries pretty hard to understand you, so if something's not working, try rewording your request.")


The requested actions require persuasion rule response (A) is "[The noun] [don't] want to do that."

The block giving rule is not listed in the check giving it to rules.

A persuasion rule for asking people to try giving:
	say "[The actor] shakes [their] head and says 'I kind of like [the noun].'";
	persuasion fails.

A persuasion rule for asking people to try taking:
	persuasion succeeds.
	
After Fred taking the shield:
	say "Fred takes the shield and says 'I always wanted one of these.'"
	
After the player giving the shield to Fred:
	say "He accepts the shield solemnly and wipes away a small tear."
