"Sunglasses" by Kent Quirk

Include Room Description Control by Emily Short.
Include Tailored Room Description by Emily Short.
[The default contents description rule response (A) is "On [the target] ".]

Chapter 1 - Description help

To say you see:
	say "[one of]There is[or]You see[or]You observe[or]You notice[or]Here is[or]In view is[or]In sight is[at random][no line break]".

Chapter 2 - Sunglasses

The sunglasses is a wearable object. The sunglasses are plural-named. Understand "glasses" as the sunglasses.

The description of the sunglasses is "A pair of dark Wayfarer-style sunglasses with black frames and nearly black lenses." 

Chapter 3 - Horcruxes
[When the player is wearing the glasses, horcruxes have a slightly different appearance in the room description, and a significantly different appearance when described.]

A thing can be a horcrux or mundane. A thing is usually mundane.

A thing has a text called memory. The memory of a thing is usually "".
[An unnoticed horcrux becomes noticeable once it has been seen.]
A thing can be unnoticed or noticeable. A thing is usually noticeable. 

A description-concealing rule:
	now every unnoticed thing that is a horcrux is not marked for listing.

A description-concealing rule during Mystic Vision:
	now every thing is not marked for listing;
	now every visible thing that is a horcrux is marked for listing;
	now every visible thing that is a horcrux is noticeable.
	

Chapter 4 - The memories

This is the do-nothing rule:
	do nothing

Table of Mystic Memories
item	erase	functor	memory	response
"nil"	false	the do-nothing rule	"nothing to say"	"so don't say it"
"mixer"	false	--	"I bought that in 1997. It's still good."	"Probably before they started with the plastic gears."


Chapter 5 - The scene

Mystic Vision is a recurring scene. Mystic Vision begins when the player wears the sunglasses. Mystic Vision ends when the player does not wear the sunglasses.

Before examining a thing during Mystic Vision:
	say "wooooo ".
	
After examining a thing (called target) during Mystic Vision:
	if the target is a horcrux:
		if the memory of the target is an item listed in the Table of Mystic Memories:
			if there is a functor entry:
				follow the functor entry;
			if there is a memory entry:
				say "[italic type][the memory entry][roman type][paragraph break]";
			if there is a response entry:
				say "[response entry]";
			if there is an erase entry and the erase entry is true:
				blank out the whole row.
	
Before looking during Mystic Vision:
	say "aaaaaa ".
	
Instead of going during Mystic Vision:
	say "The glasses make you too queasy to move."
	
To decide whether glasses vision applies:
	if the player is wearing the sunglasses:
		yes;
	no.

Chapter 6 - The rooms

The kitchen is a room. The description of the kitchen is "A small, but functional kitchen." A counter is a scenery in the kitchen. The counter is fixed in place. A sink is a thing in the kitchen. The initial appearance of the sink is "The sink was pure white ceramic once, but as happens to ceramic sinks, it's now faded and chipped." The description of the sink is "It's a small white sink." The sink is fixed in place.

The hallway is a room. The hallway is west of the kitchen.

The sunglasses are in the kitchen.

Every turn while the player has not worn the sunglasses:
	say "Put the glasses on."

The diamond is a horcrux in the hallway. The initial appearance of the diamond is "A large diamond sparkles.". The description of the diamond is "It's huuuuge for a rock.". The diamond is unnoticed.

The KitchenAid mixer is a horcrux on the counter. The initial appearance of the mixer is "[You see] a red KitchenAid stand mixer[if glasses vision applies] with a faint glow[end if]." The description of the mixer is "A red KitchenAid mixer". The flexible appearance of the mixer is "There is a red stand mixer[if glasses vision applies] with a faint glow[end if]." The memory of the mixer is "mixer".

The toaster is a thing on the counter. [The initial appearance of the toaster is "A Cuisinart toaster". ]The description of the toaster is "a toaster".

The outdoor area is a region. In the outdoor area are the kitchen and the hallway.