"bike" by Kent Quirk

Include Rideable Vehicles by Graham Nelson.

A bicycle is a kind of rideable vehicle. A bicycle can be clean or dirty. 

Check mounting a bicycle (called the ride):
	unless the ride is complete, say "It's not in riding condition yet." instead.

To decide whether (the bike - a bicycle) is complete:
	if the repair status of the bike is "":
		decide yes;
	decide no;


To decide what text is the repair status of (the bike - a bicycle):
	let problems be a list of text;
	if the front wheel is on the bike:
		let stat be the repair status of the front wheel;
		if stat is not "":
			add "the front wheel is [stat]" to problems;
	otherwise:
		add "the front wheel is missing" to problems;
	if the rear wheel is on the bike:
		let stat be the repair status of the rear wheel;
		if stat is not "":
			add "the rear wheel is [stat]" to problems;
	otherwise:
		add "the rear wheel is missing" to problems;
	If a bikechain (called ch) is part of the bike:
		if ch is rusty:
			add "the chain is frozen with rust" to problems;
	otherwise: [no chain]
		add "the chain is missing" to problems;
	If the bike is dirty:
		add "it is very dirty" to problems;
	if the number of entries in problems is not 0:
		decide on "[problems]";
	otherwise:
		decide on "";

[
To decide what text is the repair status of (the bike - a bicycle):
	if the front wheel is on the bike:
		let stat be the repair status of the front wheel;
		if stat is not "":
			decide on "the front wheel is [stat]";
	otherwise:
		decide on "the front wheel is missing";
	if the rear wheel is on the bike:
		let stat be the repair status of the rear wheel;
		if stat is not "":
			decide on "the rear wheel is [stat]";
	otherwise:
		decide on "the rear wheel is missing";
	If a chain (called ch) is on the bike:
		if ch is rusty:
			decide on "the chain is frozen with rust";
	otherwise: [no chain]
		decide on "the chain is missing";
	decide on "";
]
A bikewheel is a kind of portable supporter. 

An oilable item is a kind of thing.
A bikechain is a kind of oilable item. A bikechain can be rusty. 

To decide what text is the repair status of (wheel - a bikewheel):
	if a tire (called t) is on the wheel:
		if t is not inflated:
			decide on "flat";
	otherwise:
		decide on "without a tire";
	decide on "".

[The printed name of a wheel is "[if a tire is held]wheel[else]rim[end if]".]



To decide whether (x - a thing) is unpumpable:
	let txt be the unpumpable reason for x;
	if txt is "":
		decide no;
	decide yes.

To decide what text is the unpumpable reason for (x - a thing):
	If x is not a tire, decide on "not a tire";
	If x is inflated, decide on "already inflated";
	If x is not on a bikewheel, decide on "not on a wheel";
	decide on "".
	
A tire is a kind of thing. A tire can be inflated or flat. A tire is usually inflated. A tire is portable. A tire has a text called color. The color of a tire is usually "black".

The printed name of a tire is "[if inflated]inflated[else]flat[end if] [color] tire".

Understand "flat" as a flat tire.

A pump is a kind of thing. A pump is portable.


Understand "pump [something] with [something]" as pumping it with.
Understand "pump up [something] with [something]" as pumping it with.
Understand "inflate [something] with [something]" as pumping it with.

Understand "pump [something]" as pumping it with.
Understand "pump up [something]" as pumping it with.
Understand "inflate [something]" as pumping it with.

Pumping it with is an action applying to one thing and one thing.

Rule for supplying a missing second noun when pumping something with:
	if a pump (called the pomper) is visible:
		now the second noun is the pomper.

Check pumping it with:
	If the noun is unpumpable:
		if the noun is a bikewheel (called b):
			if a tire (called t) is held by b:
				try pumping t with the second noun instead;
		otherwise:
			say "You can't pump up [the noun] because it [unpumpable reason for the noun]." instead;
	If the second noun is not a pump:
		say "[The second noun] doesn't look much like an air pump." instead;
		
Carry out pumping it with:
	say "You [first time]apply the hose to the tire stem, [only]pump for a bit, and [the noun] inflates.";
	Now the noun is inflated;

Understand "deflate [something]" as disinflating it.
Understand "let the air out of [something]" and "flatten [something]" as disinflating it.

disinflating it is an action applying to one thing.

Check disinflating it:
	If the noun is a bikewheel:
		if a tire (called the rubber) is on the noun:
			if the rubber is flat:
				say "[the rubber] is not inflated." instead;
	Otherwise if the noun is not a tire:
		say "That's not inflatable." instead;
	Otherwise if the noun is not inflated:
		say "It's already flat." instead.

Carry out disinflating it:
	say "You press the stem and let the air out.";
	If the noun is a bikewheel:
		let the rubber be a random tire on the noun;
		now the rubber is flat;
	otherwise:
		Now the noun is flat.

Check putting a tire (called the rubber) on a bikewheel (called the wheel):
	if the wheel is on a bicycle (called the bike):
		say "You can't install a tire while the wheel is on the bike!" instead;
	if a tire is on the wheel:
		say "You can't put a second tire on [the wheel]." instead;
		
Carry out putting a tire (called the rubber) on a bikewheel (called the wheel):
	say "You have to wrestle with it, but you manage to get [the rubber] all the way onto the rim of [the wheel].";
	now the rubber is on the wheel;

Instead of removing a tire (called the rubber) from a bikewheel (called the wheel):
	If the rubber is inflated:
		say "You can't get an inflated tire off a wheel.";
		rule fails;
	otherwise:
		say "You struggle to get it started, but eventually persuade [the rubber] to come off the rim of [the wheel].";
		rule succeeds.

Instead of taking a tire which is supported by a bikewheel (called the wheel):
	try removing the noun from the wheel.
	
Check rubbing a bicycle (called the bike):
	if the bike is clean, say "It's looking good already!" instead.

Carry out rubbing a bicycle (called the ride):
	now the ride is clean;
	say "You use quite a few wet wipes to get all the dust, mud, and grease off the frame, seat, and handlebars. [if the ride is complete]It looks amazing now[else]However, [repair status of the ride][end if].";
	stop;
	
The report rubbing rule is not listed in any rulebook.
	
Understand "lubricate [something] with [something]" as lubricating it with.
Understand "lube [something] with [something]" as lubricating it with.
Understand "oil [something] with [something]" as lubricating it with.
Understand "grease [something] with [something]" as lubricating it with.

A lubricator is a kind of thing.

Lubricating it with is an action applying to one thing and one thing.

Rule for supplying a missing second noun when lubricating something with:
	if a lubricator (called the squirter) is visible:
		now the second noun is the squirter.

Check lubricating it with:
	if the noun is not an oilable item, say "[The noun] doesn't need lubrication." instead;
	if the second noun is not a lubricator, say "No matter how hard you squeeze, you won't get oil from that." instead;
	
Carry out lubricating it with:
	now the noun is not rusty;
	say "You carefully apply a drop of oil to each joint. [The noun] is now operating smoothly."


The Garage is a room. 

The old bike is a bicycle in the garage. 

The initial appearance of the bike is "You can't quite believe what you're seeing. This is a Motobecane Super Mirage 10-speed bicycle, and it has to be at least 30 years old. This is the same brand and era as the first bike you ever owned. It probably just needs some tender loving care. And you're just right for the job."

	
Instead of examining a bicycle (called the ride):
	say "You see an old Motobecane Super Mirage bicycle[if the ride is complete] that's been fixed up and is ready to ride[else], but [repair status of the ride][end if].";

A rusty bikechain called the chain is part of the bike. The description of the chain is "A [if rusty]rusty [end if] chain.". On the bike is a bikewheel called the rear wheel. On the rear wheel is an inflated tire called the black tire. 

The front wheel is a bikewheel in the garage. The red tire is a flat tire in the garage. The color of the red tire is "red".

A floor pump is a pump in the garage.

An oil can is a lubricator in the garage.

Instead of taking a bikechain (called ch):
	if ch is on the bike:
		say "That's not removeable, but there are other ways to deal with rust."
