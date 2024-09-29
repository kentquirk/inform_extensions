"Light my fire" by Kent Quirk

[Look at implicit actions by eric eve]

[
What we want:
* Some things are flammable
* Flammable things ignite at different rates
* Flammable things in the same container as a burning thing will ignite after sufficient exposure
* Matches can be struck to ignite them, but only on the right surface
* Lighters are devices that become ignited
]


A flammable item is a kind of thing.
A flammable item can be ignited. It is usually not ignited.  [means actively aflame]
A flammable item can be burnt or unburnt. It is usually unburnt. [it is now charcoal and can no longer be burned]
A flammable item has a number called burn time. The burn time is usually 100. [how many turns it remains alight]
A flammable item has a number called ignition time. The ignition time is usually 0. [how many turns it takes to become ignited]
A flammable item has a number called heating time. The heating time is usually -1. [this becomes ignition time once it's first exposed to flame]

A slow-start item is a kind of flammable item. The ignition time of a slow-start item is usually 4.

A kindling is a kind of flammable item. The ignition time of a kindling is usually 1. The burn time of a kindling is usually 5.

A match is a kind of flammable item. The plural of match is matches. The burn time of a match is 3. A match can be strikeable or unstrikeable. It is usually strikeable.

A firebox is a kind of container.  [only items in the same firebox will ignite each other]
A firebox can be rough or smooth. It is usually rough. [for striking matches on]

[ We're going to say we have those universal matches that strike on "rough" surfaces. We can strike on box-of-matches and fire ring. ]
A box-of-matches is a kind of firebox. It is portable, closed and openable.
A fire ring is a kind of firebox. It is open and not openable. It is fixed in place.

Definition: A thing is burnable if it is a flammable item.
Definition: A thing is burning if it is ignited.
Definition: A thing is charred if it is ignited or it is burnt.
Definition: A thing is ignitable if it is not ignited and it is unburnt.
Definition: A thing is nearly out if it is ignited and its burn time is less than 2.
Definition: A thing is heating up if it is ignitable and its heating time is not -1.
Definition: A thing is matchable if it is ignitable and its ignition time is 0.


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


Understand the command "light" as something new.

Understand "light [something] on [something]" as striking it on.
Understand "strike [something] on [something]" as striking it on.
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

Striking it on is an action applying to one carried thing and one thing.

Rule for supplying a missing second noun when striking something on:
	If a firebox (called the held surface) is carried:
		now the second noun is the held surface;
	otherwise if a firebox (called the unheld surface) is touchable:
		now the second noun is the unheld surface.

Check an actor taking a flammable item:
	if the noun is ignited:
		say "It's a bad idea to do that while it's burning." instead;
	if the noun is burnt:
		now the noun is nowhere;
		say "It crumbles to ashes as you touch it." instead;

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

Putting out the fire of is an action applying to one thing.

Understand "blow out [something]" as putting out the fire of.
Understand "extinguish [something]" as putting out the fire of.
Understand "put out [something]" as putting out the fire of.
Understand the command "snuff" as "extinguish".

Carry out putting out the fire of something:
	now the noun is not ignited;
	now the noun is burnt;
	say "[The noun] has stopped burning.";


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


[	if the noun is carried:
		say "[The noun] gets too hot on your fingers and you extinguish it.";
	otherwise:
		say "[The noun] has been reduced to ashes.";
	now the noun is not ignited;
	now the noun is burnt;
	now the noun is nowhere.
]

After examining a flammable item (called the fuel):
	if the fuel is burnt:
		say "What had been [the fuel] is mostly charcoal and ashes now.";
		now the fuel is nowhere;
	otherwise:
		abide by the standard examining rule;


The Chilly Beach is a room.


The matchbox is a box-of-matches in the chilly beach. In the matchbox are 3 matches.
Understand "box" as the matchbox.

Check an actor opening a matchbox while the actor does not carry a matchbox:
	say "(taking [the noun] first)";
	try taking the matchbox.

A driftwood log is a slow-start item in the chilly beach. The initial appearance is "There is a driftwood log sitting high on the beach. It looks like it's been here a while."

Some dried kelp is a kindling in the chilly beach. The initial appearance is "You see a bunch of seaweed, dried out by the sun.". Understand "seaweed" as the kelp.

The ring of rocks is a fire ring in the chilly beach. The initial appearance is "There is a ring of rocks that would make an excellent firepit."
Understand "firepit" as the ring of rocks.

Test me with "get matchbox / open matchbox / strike match / get match / close matchbox / strike match / x match / g / g / g "