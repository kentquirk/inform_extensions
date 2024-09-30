Version 1/210318 of Fire by Kent Quirk begins here.

"An extension for flammable items, matches, and burning things."

Chapter 1 - Flammable Item

A flammable item is a kind of thing.
A flammable item can be ignited. It is usually not ignited.  [means actively aflame]
A flammable item can be burnt or unburnt. It is usually unburnt. [it is now charcoal and can no longer be burned]
A flammable item has a number called burn time. The burn time is usually 20. [how many turns it remains alight]
A flammable item has a number called ignition time. The ignition time is usually 0. [how many turns it takes to become ignited]
A flammable item has a number called heating time. The heating time is usually -1. [this becomes ignition time once it's first exposed to flame]

Chapter 2 - Kinds of flammable items

A slow-start item is a kind of flammable item. The ignition time of a slow-start item is usually 4.

A kindling is a kind of flammable item. The ignition time of a kindling is usually 0. The burn time of a kindling is usually 5.

[Consumable items are for things that we want to be able to burn but not use as kindling or logs.]
A consumable item is a kind of flammable item. The ignition time of a consumable item is usually 1. The burn time of a consumable item is usually 2.

A match is a kind of flammable item. The plural of match is matches. The burn time of a match is 3. A match can be strikeable or unstrikeable. It is usually strikeable.

Chapter 3 - Containers for flammable items

A firebox is a kind of container.  [only items in the same firebox will ignite each other]
A firebox can be rough or smooth. It is usually rough. [for striking matches on]

[ We're going to say we have those universal matches that strike on "rough" surfaces. We can strike on box-of-matches and fire ring. ]
A box-of-matches is a kind of firebox. It is portable, closed and openable.
A fire ring is a kind of firebox. It is open and not openable. It is fixed in place.

check inserting something into a firebox:
	if the noun is not burnable:
		say "That won't make very good fuel." instead.

Chapter 4 - Definitions to make things easier to read

Definition: A thing is burnable if it is a flammable item.
Definition: A thing is burning if it is ignited.
Definition: A thing is charred if it is ignited or it is burnt.
Definition: A thing is ignitable if it is not ignited and it is unburnt.
Definition: A thing is nearly out if it is ignited and its burn time is less than 2.
Definition: A thing is heating up if it is ignitable and its heating time is not -1.
Definition: A thing is matchable if it is ignitable and its ignition time is 0.

Chapter 5 - Printing things

Name-printing something is an activity.

Rule for name-printing a flammable item (called the burner) (this is the flammable name generation rule):
	say The printed name of burner;
	if the burner is heating up:
		say " (heating up)";
	otherwise if the burner is nearly out:
		say " (nearly out)";
	otherwise if the burner is burning:
		say " (burning)";
	otherwise if the burner is burnt:
		say " (burnt out)";


Rule for printing the name of a flammable item (called the burner) while taking inventory:
	carry out the name-printing activity with burner.

Rule for printing the name of a flammable item (called the burner) while looking:
	carry out the name-printing activity with burner.

Rule for printing the name of a flammable item (called the burner) while listing contents:
	carry out the name-printing activity with burner.

Rule for writing a paragraph about a fire ring (called the box):
	If the box is not mentioned:
		now the box is mentioned;
		say "[the initial appearance of the box]";
	otherwise:
		say the printed name of the box;
		if the box contains nothing:
			say " is empty.";
		otherwise:
			list the contents of the box;
	say paragraph break;

Chapter 6 - Striking it on

Understand the command "light" as something new.

Understand "light [something] on [something]" as striking it on.
Understand "strike [something] on [something]" as striking it on.

Striking it on is an action applying to one carried thing and one thing.

Rule for supplying a missing second noun when striking something on:
	If a firebox (called the held surface) is carried:
		now the second noun is the held surface;
	otherwise if a firebox (called the unheld surface) is touchable:
		now the second noun is the unheld surface.

Check an actor taking a flammable item (called the fuel):
	if the fuel is ignited:
		say "It's a bad idea to do that while it's burning." instead;
	if the fuel is burnt:
		now the fuel is nowhere;
		say "It crumbles to ashes as you touch it." instead;

Instead of examining a flammable item (called the fuel):
	if the fuel is burnt:
		say "What had been [the fuel] is mostly charcoal and ashes now.";
		now the fuel is nowhere;
	otherwise:
		abide by the standard examining rule;

Check an actor taking a match:
	if the actor carries a match (called the held match):
		if the held match is burnt:
			now the held match is nowhere;
		otherwise:
			say "You already have one." instead;
	if the noun is ignited:
		say "It's a bad idea to do that while it's burning." instead;
	if the noun is burnt:
		now the noun is nowhere;
		say "It crumbles to ashes as you touch it." instead;

Check an actor striking something on something:
	if the noun is not strikeable:
		say "[The noun] is not something you can ignite that way." instead;
	if the noun is ignited:
		say "[The noun] is already burning!" instead;
	if the second noun is not rough:
		say "[The second noun] is not rough enough to strike on." instead;
	if the second noun is portable:
		if the second noun is not carried:
			say "It's impossible to strike on [the second noun] without holding it." instead;
		if the second noun is openable and the second noun is open:
			say "Safety first! Don't strike on an open [second noun]!" instead;

Carry out striking something (called the thing struck) on something (called the surface):
	now the thing struck is ignited;
	now the thing struck is not strikeable;
	say "You carefully strike [the thing struck] on [the surface] and it sparks to life."

Chapter 7 - Lighting up

Understand "strike [something]"  and "light [something]" as lighting up.

Lighting up is an action applying to one visible thing.

Check an actor lighting up something:
	if an ignited thing (called the igniter) is carried:
		try lighting the noun with the igniter instead;
	if the noun is strikeable:
		If a firebox (called the held surface) is carried:
			try striking the noun on the held surface instead;
		otherwise if a firebox (called the unheld surface) is touchable:
			try striking the noun on the unheld surface instead;
	say "It's not clear what that means."

Chapter 8 - Setting fire to

Setting fire to is an action applying to one visible thing.

Check setting fire to something:
	if the noun is not burnable:
		say "That doesn't burn." instead;
	if the noun is burnt:
		say "[The noun] has already been burned." instead;
	if the noun is ignited:
		say "[The noun] is already burning!" instead;

Carry out setting fire to something:
	now the noun is ignited;
	say "[The noun] ignites.";


Chapter 9 - Lighting it with

Lighting it with is an action applying to one visible thing and one visible thing.

Understand "ignite [something] with [something]" as lighting it with.
Understand "light [something] with [something]" as lighting it with.

Check lighting something with something:
	if the second noun is not burnable:
		say "You can't start a fire with [the second noun]." instead;
	if the second noun is not burning:
		say "You need a flame to start a fire." instead;
	if the noun is not contained by a firebox:
		say "You should find a safe place to build a fire first." instead;
	If the noun is not matchable:
		say "One match isn't enough to light [the noun]. You'll need kindling." instead;

Carry out lighting it with:
	try setting fire to the noun.

Chapter 9 - Putting out the fire of

Putting out the fire of is an action applying to one thing.

Understand "blow out [something]" as putting out the fire of.
Understand "extinguish [something]" as putting out the fire of.
Understand "put out [something]" as putting out the fire of.
Understand the command "snuff" as "extinguish".

Carry out putting out the fire of something:
	now the noun is not ignited;
	now the noun is burnt;
	say "[The noun] has stopped burning.";

Chapter 10 - Accelerating

Understand "blow on [something]" as accelerating.
Accelerating is an action applying to one thing.

Check accelerating something:
	if the noun is not a flammable item, say "That's not likely to help." instead;

Carry out accelerating something:
	if the noun is burning:
		decrement the burn time of the noun;
		say "You blow gently, and [the noun] burns a little hotter.";
	if the noun is heating up:
		increment the heating time of the noun;
		say "A long slow breath causes [the noun] to glow a little brighter."

Chapter 11 - Fire is contagious in a firebox

Every turn when a burning thing is visible:
	repeat with the burner running through all burning things:
		if the burner is enclosed by a firebox (called the box):
			repeat with item running through ignitable things enclosed by the box:
				increment the heating time of the item;
				unless the item is burnt:
					if the heating time of the item is at least the ignition time of the item:
						try setting fire to the item;
		decrement the burn time of the burner;
		if the burn time of the burner is less than 1:
			try putting out the fire of the burner;



Fire ends here.

---- DOCUMENTATION ----

Chapter: Fire

Section: The Basics

This extension provides flammable items, along with a firebox to contain them and matches to start them burning. Flammable items can be easy or hard to get burning, and they can light each other on fire when they're in the same firebox. They go out after a defined number of turns. They disintegrate after being burned, and both burning and ignition can be accelerated by blowing on the objects in question.


Section: To Do

Add lighter, better descriptions / more variety, make sure other kinds of objects can burn on a fire, maybe sounds and smells?


Example: *** The Chilly Beach - build a fire on the beach.

	*: "The Chilly Beach"

	Include Fire by Kent Quirk

	The Chilly Beach is a room.

	The matchbox is a box-of-matches in the chilly beach. In the matchbox are 3 matches.
	Understand "box" as the matchbox.

	Check an actor opening a matchbox while the actor does not carry a matchbox:
		say "(taking [the noun] first)";
		try taking the matchbox.

	A driftwood log is a slow-start item in the chilly beach. The initial appearance is "There is a driftwood log sitting high on the beach. It looks like it's been here a while."

	A weathered plank is a slow-start item in the chilly beach. The initial appearance is "There is a weathered wooden plank here."

	Some dried kelp is a kindling in the chilly beach. The initial appearance is "You see a bunch of seaweed, dried out by the sun.". Understand "seaweed" as the kelp.

	The ring of rocks is a fire ring in the chilly beach. The initial appearance is "There is a ring of rocks that makes an excellent firepit."
	Understand "firepit" as the ring of rocks.

	Test me with "get matchbox / open matchbox / strike match / get match / close matchbox / strike match / light log / get log / put log in ring / open matchbox / get match / close matchbox / strike match / light log / put kelp in ring / open matchbox / get match / close matchbox / strike match / light kelp / blow on log / g / g".