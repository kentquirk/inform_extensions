Version 1/210313 of Measured Liquid by Kent Quirk begins here.

"Measured Liquid provides a concept of volume, together with the ability to fill containers, pour liquid, and drink from containers."

"Based on original Measured Liquid code by Emily Short."

[The mixable portion of Emily Short's version was causing problems (due to a bug, apparently) and I didn't need it anyway, but I did want to include a couple of other features -- larger containers (fish tanks), difficulty in carrying large containers full of liquid, and submersible objects. ]

To hold is a verb. To contain is a verb. To clean is a verb. To fill is a verb. To dump is a verb. To must is a verb. To remain is a verb. To offer is a verb. To pour is a verb. To lead is a verb. To fit is a verb. To unplug is a verb. To plug is a verb.

Part 1 - Volumes and Capacities

Chapter 1 - The fluid container

Section 1 - The container

A fluid container is a kind of container. 

Check inserting something into a fluid container (this is the can't put solids into a fluid container rule):
	if the noun is unsubmersible:
		say "[The noun] doesn't go into liquids." (A) instead. 
	
Understand the liquid property as describing a fluid container. Understand "of" as a fluid container.

Understand "empty" as a fluid container when the item described is patently empty.
Understand "closed" as a container when the item described is closed.

Definition: a fluid container is patently empty:
	if it is not empty:
		no;
	if it is closed and it is not transparent:
		no;
	yes.

Check an actor inserting a non-empty open fluid container into something (this is the can't stash full cups rule):
	if the second noun is fixed in place or the second noun is scenery:
		make no decision; [if we don't carry it around, it's probably not a liability.]
	if the second noun is part of something which is fixed in place:
		make no decision;
	if the second noun is part of something which is scenery:
		make no decision;
	if the actor is the player:
		say "That [would lead] to spills." (A);
	stop the action.

Section 2 - Considerate holdall behavior (for use with Considerate Holdall by Jon Ingold)

A holdall rule for a non-empty open fluid container (this is the don't try to stash full cups rule):
	disallow stashing.

Chapter 2 - Volume (for Glulx only)

Section 1 - Definition

A volume is a kind of value. 1oz specifies a volume.
1 gallon (singular) specifies a volume scaled up by 128.
2 gallons specifies a volume scaled up by 128.

A fluid container has a volume called a fluid capacity. A fluid container has a volume called fluid content. The fluid capacity of a fluid container is usually 12oz. The fluid content of a fluid container is usually 0oz.

The sip size is a volume that varies. The sip size is usually 1oz.

The max volume is a volume that varies. The max volume is 2147483647oz.

Chapter 3 - Emptiness 

The null volume is a volume that varies. [This will automatically be 0 in whichever units we happen to be using this time around, which is convenient for doing comparisons and setting values elsewhere in the code without having to refer to oz or gallons explicitly.]

Definition: a fluid container is empty if the fluid content of it is the null volume. 
Definition: a fluid container is non-empty if it is not empty.
Definition: a fluid container is full if the fluid content of it is the fluid capacity of it.

Chapter 4 - Pourable

An uncarriable weight is a volume that varies. Uncarriable weight is 4 gallons.

Definition: a fluid container is pourable:
	if the fluid content of it is less than an uncarriable weight:
		yes;
	no.

Chapter 5 - Submersible

A thing can be submersible or unsubmersible. Things are usually unsubmersible.

Chapter 6 - Prefixes and Suffixes

Before printing the name of a fluid container (called the target) while not drinking or pouring (this is the prefix empties rule):
	if the current action is the action of opening the target:
		make no decision;
	if the person asked is the player and the target is patently empty:
		say "empty " (A);
	otherwise:
		make no decision;

Before printing the plural name of a fluid container (called the target) while not drinking or pouring (this is the plural prefix empties rule):
	if the current action is the action of opening the target:
		make no decision;
	if the person asked is the player and the target is patently empty:
		say "empty " (A);
	otherwise:
		make no decision;

Before printing the name of a closed transparent fluid container (called the target) while taking inventory (this is the prefix closedness rule):
	say "closed " (A).

Rule for printing room description details of an empty fluid container (this is the don't append emptiness rule):
	stop.

After printing the name of a fluid container (called the target) while not examining or searching or pouring (this is the suffix with contents rule):
	if the current action is the action of opening the target:
		do nothing;
	if the target is a liquid source:
		do nothing instead;
	if the target is closed and the target is not transparent:
		do nothing instead; 
	if the person asked is not the player:
		do nothing instead;
	unless the target is empty:
		say " of [liquid of the target]" (A);
		omit contents in listing.

After printing the plural name of a fluid container (called the target) while not examining or searching or pouring (this is the plural suffix with contents rule):
	if the current action is the action of opening the target:
		do nothing;
	if the target is a liquid source:
		do nothing instead;
	if the target is closed and the target is not transparent:
		do nothing instead; 
	if the person asked is not the player:
		do nothing instead;
	unless the target is empty:
		say " of [liquid of the target]" (A);
		omit contents in listing.

Report opening a fluid container when the noun is not transparent (this is the report fluid container contents on opening rule):
	say "[We] [open] [the noun], which [fill description of the noun][paragraph break]" instead.

Chapter 7 - Room Description Details

Rule for printing room description details of a fluid container:
	do nothing instead.

Part 2 - Liquids

Liquid is a kind of value.  A fluid container has a liquid.  

Some liquids are defined by the Table of Liquids.

Table of Liquids
liquid	potable	flavor	description (text)
nonliquid	false	--	--
water	true	"Refreshing!"	--

To decide what text is the flavor of (beverage - a liquid):
	decide on flavor corresponding to a liquid of beverage in the Table of Liquids.

To decide whether (beverage - a liquid) can be drunk:
	decide on potable corresponding to a liquid of beverage in the Table of Liquids.

Use no trace amounts translates as (- Constant TRACES_OFF; -). 

Instead of an actor rubbing a fluid container (this is the clean away traces rule):
	if the no trace amounts option is active:
		make no decision;
	if the noun is not empty:
		say "[It's] hard to clean [the noun] while [they] still [contain] so much." (A);
		rule fails;
	if the liquid of the noun is not nonliquid:
		say "[The actor] [clean] away all traces of [the liquid of the noun]." (B);
		now the liquid of the noun is nonliquid;
		rule succeeds;
	otherwise:
		say "[The noun] [are] already clean." (C);
		rule succeeds.
 
Part 3 - Liquid Sources

Chapter 1 - The Liquid Source

[And now we add our liquid source kind, which will represent streams of tap water, saltwater lakes, absinthe fountains, and any other infinite supplies of liquid we might need. The volume of a liquid source is always set to be the largest possible number of fluid ounces available to us, but this varies for the Z-machine and Glulx, so they are separately defined.]

A liquid source is a kind of fluid container. A liquid source has a liquid. A liquid source is usually scenery.

When play begins (this is the initialize liquid sources rule):
	repeat with item running through liquid sources:
		now the fluid capacity of the item is max volume;
		now the fluid content of the item is max volume.

Carry out pouring a liquid source into something (this is the liquid sources stay full rule): 
	now the fluid content of the noun is the max volume. 
	
Chapter 2 - Pouring from Liquid Sources

[We want filling things from liquid sources to work the same way as usual, with the distinction that a) the liquid source never depletes in quantity (hence the carry-out rule resetting its fullness); and b) we should report the results a bit differently as well:]

Report pouring a liquid source into a fluid container (this is the report filling from a liquid source rule):
	say "[We] [fill] [the second noun] up with [liquid of the noun] from [the noun]." (A) instead.

Report someone pouring a liquid source into a fluid container (this is the report someone filling from a liquid source rule):
	say "[The actor] [fill] [the second noun] up with [liquid of the noun] from [the noun]." (A) instead.


Part 4 - Lakes and streams

Chapter 1 - Defining Lakes

[A liquid lake is a large and potentially swimmable body of liquid in which objects could be lost. This doesn't cover every possible sort of liquid source, obviously: one might also have a fountain or tap that produced lots of liquid but was not suitable to swim in..]

[Pouring liquids into a liquid lake needs to work completely differently from pouring liquids into anything else. Let's say we're going to allow any liquid at all to be dumped into rivers and streams (environmental protections evidently are not very well-enforced in this scenario):]

A liquid lake is a kind of liquid source.

Instead of an actor pouring a fluid container into a liquid lake (this is the dumping fluids rule):
	if the noun is empty:
		if the actor is not the player:
			stop the action;
		say "[The noun] already [contain] nothing." (A) instead;
	now the fluid content of the noun is null volume;
	if the actor is the player:
		say "[We] [dump] out [the noun] into [the second noun]." (B);
		rule succeeds;
	otherwise if the actor is visible:
		say "[The actor] [dump] out [the noun] into [the second noun]." (C);
		rule succeeds;

Before an actor inserting something into a liquid lake (this is the can't throw objects in a liquid source rule):
	if the player is the actor: 
		say "[The noun] would get lost and never be seen again." (A) instead;
	stop the action.

Chapter 2 - Defining Sinks

[A sink is a kind of fluid container that has a switchable drain, and when the sink is plugged it has a normal capacity, but when the sink is unplugged its contents are emptied and it has infinite capacity.]

A sink is a kind of fluid container. 

A sink can be plugged or unplugged. A sink is usually unplugged. A sink is always open. The liquid of the sink is water.

Instead of an actor pouring a fluid container into an unplugged sink (this is the down the drain rule):
	if the noun is empty:
		if the actor is not the player:
			stop the action;
		say "[The noun] already [contain] nothing." (A) instead;
	now the fluid content of the noun is null volume;
	if the actor is the player:
		say "[We] [dump] out [the noun] into [the second noun][if the second noun is unplugged] and [the liquid of the noun] goes down the drain[end if]." (B);
		rule succeeds;
	otherwise if the actor is visible:
		say "[The actor] [dump] out [the noun] into [the second noun][if the second noun is unplugged] and [the liquid of the noun] goes down the drain[end if]." (C);
		rule succeeds;
		
Plugging is an action applying to one thing.

Understand "plug [something]" as plugging.
Understand "plug the drain" and "plug drain" as plugging.

Rule for supplying a missing noun while plugging:
	if a sink (called the target) is visible:
		now the noun is the target;
	otherwise:
		say "There's nothing here to plug!".
		
check plugging something:
	if the noun is plugged:
		say "[the noun] is already plugged."
		
carry out plugging something:
	now the noun is plugged;
	say "[the noun] is plugged."

Unplugging is an action applying to one thing.

Understand "unplug [something]" as unplugging.
Understand "unplug the drain" and "unplug drain" as unplugging.

Rule for supplying a missing noun while unplugging:
	if a sink (called the target) is visible:
		now the noun is the target;
	otherwise:
		say "There's nothing here to unplug!".
		
check unplugging something:
	if the noun is unplugged:
		say "[the noun] is already unplugged."
		
carry out unplugging something:
	now the noun is unplugged;
	if the noun is not empty:
		now the fluid content of the noun is null volume;
		say "[We] [unplug] it and it empties swiftly.";
	otherwise:
		say "[We] [unplug] [the noun].";

 
Chapter 3 - Swimming

Swimming in is an action applying to one thing. Understand "swim in [something]" or "dive in/into [something]" as swimming in. Understand "swim" or "dive" as swimming in.

Rule for supplying a missing noun while an actor swimming in (this is the try to swim in visible lakes rule):
	if a liquid lake is visible:
		now the noun is a random visible liquid lake; 
	otherwise:
		say "[There's] nothing sensible to swim in." (A);
		rule fails.

Check an actor swimming in a liquid lake (this is the block swimming in liquid lakes rule):
	if the player is the actor:
		say "[We] [don't] feel like a dip in [the noun] just [if story tense is present tense]now[otherwise]then[end if]." (A) instead;
	stop the action.

Check an actor swimming in a fluid container (this is the block swimming in small vessels rule):
	if the noun is a liquid lake:
		make no decision;
	if the player is the actor:
		say "[We] [wouldn't fit] in [the noun]." (A) instead;
	stop the action.

Check an actor swimming in something (this is the block swimming in random objects rule):
	if the noun is a liquid lake:
		make no decision;
	if the player is the actor:
		say "[The noun] [aren't] [if the noun is plural-named]things[else]something[end if] [we] [can] swim in." (A) instead;
	stop the action.

Chapter 4 - Liquid Stream

A liquid stream is a kind of liquid source.

Instead of an actor pouring a fluid container into a liquid stream (this is the no dumping in streams rule):
	if the noun is empty:
		if the player is the actor:
			say "[The noun] already [contain] nothing." (A) instead;
		stop the action;
	now the fluid content of the noun is null volume;
	if the player is the actor:
		say "[We] [dump] out [the noun] into [the second noun], where [they] [are] quickly washed away." (B);
		rule succeeds;
	otherwise if the actor is visible:
		say "[The actor] [dump] out [the noun] into [the second noun], where [they] [are] quickly washed away." (C);
		rule succeeds.

Instead of an actor inserting something into a liquid stream (this is the no inserting things into flowing water rule):
	if the player is the actor:
		say "[The second noun] [cannot contain] things." (A) instead;
	stop the action.

Instead of an actor inserting a fluid container into a liquid stream:
	try the actor filling the noun with the second noun.

Report an actor pouring a liquid stream into a fluid container (this is the report filling from a liquid stream rule):
	if the player is the actor:
		say "[We] [fill] [the second noun] up from [the noun]." (A) instead;
	stop the action.

Part 5 - Output

Chapter 1 - Examining

Definition: a fluid container is emptyable if it is not a liquid source.

The examining fluid containers rule is listed before the examine containers rule in the carry out examining rules.

This is the examining fluid containers rule:
	if the noun is not a fluid container:
		make no decision;
	if the noun is closed and the noun is not transparent:
		make no decision;
	say "[The noun] [fill description of the noun]" (A);
	if the description of the liquid of the noun is not "":
		say " [description of the liquid of the noun]" (B);
	say "[paragraph break]" (C);
	now examine text printed is true.

Chapter 2 - Searching

Report searching a fluid container (this is the just examine fluid containers rule):
	say "[The noun] [fill description of the noun][paragraph break]"  (A) instead.

Chapter 3 - Describing the Fullness of Activity

Section 1 - Fullness in general

Describing the fullness of something is an activity.

To say fill description of (sample cup - a fluid container):
	carry out the describing the fullness activity with the sample cup.
	
Rule for describing the fullness of a sink (called the sample sink) (this is the describe sink sources rule): 
	if the sample sink is plugged:
		say "is plugged and [no line break]";
		if the sample sink is empty:
			say "empty.[no line break]";
		otherwise:
			say "has some [liquid of the sample sink] in it.[no line break]";
	otherwise:
		say "[regarding the sample sink] is empty, but [offer] a ready supply of [liquid of the sample sink].[no line break]" (A)

Rule for describing the fullness of a liquid source (called the sample lake) (this is the describe sources rule):
	say "[regarding the sample lake][offer] a ready supply of [liquid of the sample lake].[no line break]" (A)

Rule for describing the fullness of an empty fluid container (called the sample cup) (this is the describe empty containers rule):
	if the no trace amounts option is active:
		say "[regarding the sample cup][contain] nothing.[no line break]" (A);
	otherwise if the liquid of the sample cup is nonliquid:
		say "[regarding the sample cup][don't] contain even a trace of liquid.[no line break]" (B);
	otherwise: 
		say "[regarding the sample cup][contain] only a trace of [the liquid of the sample cup] at the bottom.[no line break]" (C).

Section 2 - Fullness

Rule for describing the fullness of a non-empty emptyable fluid container (called the sample cup) (this is the describe containers rule):
	let percent be the fluid content of the sample cup times 100 divided by the fluid capacity of the sample cup;
	say "[are]" (A);
	if sample cup is full:
		say " full" (B);
	otherwise if percent is less than 20:
		say " nearly empty" (C); 
	otherwise if percent is less than 40:
		say " less than half full" (D); 
	otherwise if percent is less than 60:
		say " about half full" (E);
	otherwise if percent is less than 80:
		say " more than half full" (F);
	otherwise:
		say " nearly full" (G);
	say " of [the liquid of the sample cup].[no line break]" (H).  


Part 6 - Drinking

The block drinking rule is not listed in any rulebook.

The drinking action has a liquid called the liquid drunk.

Setting action variables for an actor drinking something (this is the setting liquid drunk rule):
	if the noun is a fluid container:
		now the liquid drunk is the liquid of the noun;

A fluid container can be preferred for drinking. A fluid container is usually not preferred for drinking.

Does the player mean drinking a preferred for drinking fluid container (this is the preferential drinking rule):
	it is very likely.

Does the player mean asking someone to try drinking a preferred for drinking fluid container (this is the preferential asking to drink rule):
	it is very likely.

Understand "drink from [fluid container]" as drinking.

Check an actor drinking a closed fluid container (this is the can't drink from closed sources rule):
	if the player is the actor:
		say "(first opening [the noun])[command clarification break]" (A);
	silently try opening the noun;
	if the noun is closed:
		stop the action.

Check an actor drinking something which is not carried by the actor (this is the prefer to carry drink sources rule):
	if the noun is fixed in place or the noun is scenery or the noun is part of something:
		make no decision;
	otherwise:
		if the player is the actor:
			say "(first taking [the noun])[command clarification break]" (A);
		silently try the actor taking the noun.

Check an actor drinking something which is not a fluid container (this is the can't drink things that aren't fluids rule):
	if the player is the actor:
		say "[The noun] [aren't] suitable to drink." (A) instead;
	stop the action.

Check an actor drinking an empty fluid container (this is the can't drink from empty containers rule):
	if the player is the actor:
		if the liquid of the noun is nonliquid:
			say "[The noun] [are] completely empty." (A) instead;
		otherwise:
			say "[regarding the noun][There's] no more [liquid drunk] in [the noun]." (B) instead;
	stop the action.

Definition: a fluid container is undrinkable:
	if the liquid of it can be drunk:
		no;
	yes.

Check an actor drinking an undrinkable fluid container (this is the can't drink noxious containers rule): 
	if the actor is the player:
		say "The [liquid drunk] [aren't] something [we] [can] drink." (A) instead;
	stop the action.

Use variable sip size translates as (- Constant VARIABLE_SIP; -). 

Carry out an actor drinking a fluid container (this is the standard drinking fluids rule):
	let swallowed amount be the sip size;
	if the variable sip size option is active:
		let max variation be ( sip size * 2) / 3;
		let variation be a random volume between null volume and max variation;
		if a random chance of 1 in 2 succeeds:
			increase swallowed amount by variation;
		otherwise:
			decrease swallowed amount by variation;   
	if the noun is emptyable:
		decrease the fluid content of the noun by the swallowed amount; 
		if the fluid content of the noun is less than null volume:
			now the fluid content of the noun is null volume;
	if the noun is empty and the no trace amounts option is active:
		now the liquid of the noun is nonliquid.
	
Report drinking a fluid container (this is the standard report drinking rule):
	say "[We] [take] a sip of [the liquid drunk][if the noun is empty], leaving [the noun] empty[end if]" (A);
	if the flavor of the liquid of the noun is not "":
		say ". [flavor of the liquid drunk][paragraph break]" (B);
	otherwise:
		say "." (C)

Report someone drinking a fluid container (this is the standard report someone drinking rule):
	say "[The actor] [take] a sip of [the liquid drunk][if the noun is empty], leaving [the noun] empty[end if]." (A)

Check an actor tasting an undrinkable fluid container (this is the can't taste noxious containers rule):
	if the actor is the player:
		say "The [liquid drunk] [aren't] something [we] [can] drink." (A) instead;
	stop the action.
	
Check tasting a closed fluid container (this is the can't drink from shut containers rule):
	if the actor is the player:
		say "(first opening [the noun])[command clarification break]" (A);
	silently try opening the noun;
	if the noun is closed:
		stop the action.

Check tasting a fluid container (this is the report flavors of drinks rule):
	if the flavor of the liquid of the noun is not "":
		say "[flavor of the liquid of the noun][paragraph break]" (A) instead;

[And to deal with the case where there might be multiple empty containers lying around: ]

Does the player mean drinking an empty fluid container (this is the discourage pointless drinks rule): 
	it is very unlikely.

Part 7 - Filling and Pouring

Chapter 1 - Filling

Understand the command "fill" as something new.

[Here we want Inform to prefer full liquid sources to other containers when it chooses an end to a player's unfinished or ambiguous command. And so:]

Understand "fill [fluid container] with/from [full liquid source]" as filling it with. 
Understand "fill [fluid container] with/from [non-empty fluid container]" as filling it with.
Understand "fill [fluid container] with/from [fluid container]" as filling it with.

[Both grammar lines point to the same ultimate outcome; the purpose of specifying both is to tell Inform to check thoroughly for full liquid sources before falling back on other fluid containers when making its decisions.]

Understand "fill [something] with/from [something]" as filling it with.

Understand "fill [something]" as filling it with.

Filling it with is an action applying to two things. 

Carry out an actor filling something with something (this is the convert filling to pouring rule): 
	try the actor pouring the second noun into the noun instead.

Rule for supplying a missing second noun while an actor filling (this is the assume matching source rule):
	repeat with possible source running through visible non-empty fluid containers:
		if the liquid of the possible source is the liquid of the noun and the possible source is not the noun:
			now the second noun is the possible source;
			rule succeeds;
	if the person asked can touch a liquid source (called the target source):
		now the second noun is the target source;
	otherwise:
		if the player is the person asked:
			say "[We] [have] to fill [the noun] with something specific." (A) instead;
		otherwise:
			say "You'll need to specify what to fill [the noun] with." (B)

Chapter 2 - Pouring

Understand "mix [non-empty fluid container] in/into/with [fluid container]" as pouring it into. 
Understand "pour [non-empty fluid container] in/into/on/onto [fluid container]" as pouring it into. 
Understand "empty [non-empty fluid container] in/into [fluid container]" as pouring it into.
Understand "dump [non-empty fluid container] in/into [fluid container]" as pouring it into. 

Understand "mix [fluid container] in/into/with [fluid container]" as pouring it into. 
Understand "pour [fluid container] in/into/on/onto [fluid container]" as pouring it into. 
Understand "empty [fluid container] in/into [fluid container]" as pouring it into.
Understand "dump [fluid container] in/into [fluid container]" as pouring it into.

Understand "mix [something] in/into/with [something]" as pouring it into. 
Understand "pour [something] in/into/on/onto [something]" as pouring it into. 
Understand "empty [something] in/into [something]" as pouring it into.
Understand "dump [something] in/into [something]" as pouring it into.

Does the player mean pouring something into a liquid source (this is the discourage mixing with liquid source rule):
	it is unlikely.
Does the player mean pouring something into a fluid container which is not a liquid source (this is the encourage mixing in glasses rule):
	it is likely.

Pouring it into is an action applying to two things.
The pouring it into action has a liquid called the liquid poured.
The pouring it into action has a liquid called the liquid receiving.
The pouring it into action has a volume called the amount poured.

Setting action variables for pouring something into something (this is the setting liquid poured rule):
	if the noun is a fluid container:
		now the liquid poured is the liquid of the noun.

Setting action variables for pouring something into something (this is the setting liquid receiving rule):
	if the second noun is a fluid container:
		now the liquid receiving is the liquid of the second noun.

Setting action variables for pouring something into something (this is the setting amount poured rule):
	if the noun is a fluid container and the second noun is a fluid container:
		now the amount poured is the fluid capacity of the second noun minus the fluid content of the second noun;
		if the amount poured is greater than the fluid content of the noun:
			now the amount poured is the fluid content of the noun;

Check an actor pouring a closed fluid container into something (this is the can't pour from a closed noun rule): 
	if the player is the actor:
		say "(first opening [the noun])[command clarification break]" (A);
	silently try the actor opening the noun;
	if the noun is not open:
		rule fails.

Check an actor pouring something into a closed fluid container (this is the can't pour into a closed noun rule):
	if the player is the actor:
		say "(first opening [the second noun])[command clarification break]" (A);
	silently try the actor opening the second noun;
	if the second noun is not open:
		rule fails.
		
[Check an actor pouring something which is carried by the actor into something which is not carried by the actor (this is the maybe it's a scoop rule):
	if the fluid content of the noun is null
]		
Check an actor pouring something which is not carried by the actor into something which is not carried by the actor (this is the can't pour two untouched things rule):
	if the noun is not fixed in place and the noun is not scenery and the noun is not part of something and the noun is pourable:
		if the player is the actor:
			say "(first taking [the noun])[command clarification break]" (A);
		silently try the actor taking the noun;
		if the actor carries the noun:
			rule fails;
		otherwise:
			make no decision;
	if the second noun is not fixed in place and the second noun is not scenery and the second noun is not part of something and the second noun is pourable:
		if the player is the actor:
			say "(first taking [the second noun])[command clarification break]" (B);
		silently try the actor taking the second noun;
		if the actor does not carry the second noun:
			rule fails;
		otherwise:
			make no decision;
	if the player is the actor:
		say "[We] [need] to be holding at least one of [the noun] or [the second noun]." (C) instead;
	stop the action.

Check an actor pouring something into something (this is the can't pour without fluid containers rule):
	if the noun is not a fluid container:
		if the player is the actor:
			say "[We] [can't] pour [the noun]." (A) instead;
		stop the action;
	if the second noun is not a fluid container:
		if the player is the actor:
			say "[We] [can't] pour liquids into [the second noun]." (B) instead;
		stop the action.

Check an actor pouring something into the noun (this is the no pouring something into itself rule):
	if the player is the actor:
		say "[We] [can] hardly pour [the noun] into itself." (A) instead;
	stop the action.

Check an actor pouring an empty thing into something (this is the can't pour empties rule):
	if the noun is empty:
		if the actor is the player:
			if the liquid of the noun is not nonliquid:
				say "No more [liquid poured] [remain] in [the noun]."  (A) instead;
			otherwise:
				say "[The noun] [are] completely empty." (B) instead;
		stop the action.

Check an actor pouring something into a full fluid container (this is the can't overfill rule):
	if the second noun is full:
		if the actor is the player:
			say "[The second noun] [cannot] contain any more than it already holds." (A) instead;
		stop the action.

Carry out an actor pouring something into something (this is the standard carry out pouring rule):
	increase the fluid content of the second noun by amount poured;
	decrease the fluid content of the noun by amount poured;
	if the noun is empty and the no trace amounts option is active:
		now the liquid of the noun is nonliquid.

Report pouring it into (this is the standard report pouring rule):
	if the noun is scenery or the noun is fixed in place or the noun is part of something or the player holds the second noun:
		say "[We] [fill] [the second noun] with [the liquid poured] from [the noun]" (A);
	otherwise:
		say "[We] [pour] [the liquid poured] into [the second noun]" (B);
	say "[if the noun is empty], leaving [the noun] empty[end if]" (C); 
	if the second noun is not full or the liquid of the second noun is not the liquid of the noun:
		say ". [run paragraph on]" (D);
		say "[regarding the second noun][They] [fill description of the second noun][paragraph break]" (E); 
	otherwise:
		say "." (F)

Report someone pouring something into something (this is the standard report someone pouring rule):
	if the noun is scenery or the noun is fixed in place or the noun is part of something:
		say "[The actor] [fill] [the second noun] with [the liquid poured]" (A);
	otherwise:
		say "[The actor] [pour] [the liquid poured] into [the second noun]" (B);
	say "[if the noun is empty], leaving [the noun] empty[end if]" (C); 
	if the second noun is not full or the liquid of the second noun is not the liquid of the noun:
		say ". [run paragraph on]" (D);
		try examining the second noun;
	otherwise:
		say "." (E)

Chapter 3 - Basic Mixtures

Section 1 - Allowing for Mixtures to Exist

Use mixed liquids translates as (- Constant MIXED_LIQUIDS; -). 

The liquid-mixture refusal is some text that varies. The liquid-mixture refusal is "[We] [don't] want to mix [the liquid of the noun] with [the liquid of the second noun]."

Check an actor pouring something into something (this is the might mix substances rule):
	if the liquid of the noun is not the liquid of the second noun:
		if the second noun is empty:
			now the liquid of the second noun is the liquid of the noun;
		otherwise unless the mixed liquids option is active:
			if the player is the actor:
				say "[The liquid-mixture refusal][paragraph break]" instead;
			stop the action.

[Carry out an actor pouring something into something when the mixed liquids option is active (this is the carry out mixing substances rule):
	if the liquid poured is not the liquid of the second noun and the second noun is non-empty:
		now the liquid of the second noun is the resulting liquid.

Section 2 - New Pouring Rules

The pouring it into action has a liquid called the resulting liquid.

Last setting action variables for pouring something into something when the mixed liquids option is active (this is the establish mixture rule):
	if the noun is not a fluid container:
		make no decision;
	if the second noun is not a fluid container:
		make no decision;
	if the liquid poured is not the liquid of the second noun: 
		if amount poured is greater than null volume and the second noun is non-empty:
			let L be the value produced by the liquid-mixing rules for the amount poured;
			now the resulting liquid is L.

Section 3 - Liquid-mixing Rulebook

The liquid-mixing rules are a volume based rulebook producing a liquid.
The liquid-mixing rulebook has a fluid container called the destination container.
The liquid-mixing rulebook has a list of liquids called the recipe contents. 
 
First liquid-mixing rule for a volume (called the poured volume) (this is the assign quantities while mixing rule): 
	now the destination container is the second noun;
	add the liquid of the noun to the recipe contents;
	add the liquid of the second noun to the recipe contents;
	sort the recipe contents;  

A liquid-mixing rule (this is the keep the same recipe as before rule):
	[If we add more of an existing component to the mix, there is no change]
	repeat through the Table of Liquid Mixtures:
		if the liquid of the second noun is the result entry:
			let L be the mix-list entry;
			repeat with item running through L:
				if the liquid of the noun is the item:
					rule succeeds with result the liquid of the noun.

A liquid-mixing rule (this is the create mixtures rule):
	[otherwise, we must look up the combination in our recipe book] 
	repeat through the Table of Liquid Mixtures:
		sort the mix-list entry;
		if mix-list entry is the recipe contents:
			rule succeeds with result the result entry.

Last liquid-mixing rule (this is the default conversion of liquids rule):
	[If we can't locate a valid mixture of liquids, set the second noun to use the same liquid as the first]
	rule succeeds with result the liquid of the noun.

]

[Section 4 - Initial Table of Liquid Mixtures

Table of Liquid Mixtures
mix-list (a list of liquids)	result (a liquid)
--	--
 
]

Chapter 4 - Unsuccessful Attempts 

Unsuccessful attempt by someone pouring something into something (this is the explain unsuccessful pouring rule):
	if the reason the action failed is:
		-- the can't pour from a closed noun rule:
			say "[The actor] [can't] pour from [the noun] when [they] [are] closed." (A);
			rule succeeds;
		-- the can't pour two untouched things rule:
			say "[The actor] [can't] quite get [the noun] and [the second noun] into the right configuration for pouring." (B);
			rule succeeds;
		-- the can't pour without fluid containers rule:
			if the noun is not a fluid container:
				say "[The noun] [aren't] something that can be poured." (C);
				rule succeeds;
			if the second noun is not a fluid container:
				say "[The second noun] [aren't] something that can be poured." (E);
				rule succeeds;
		-- the no pouring something into itself rule:
			say "[The actor] [can] hardly pour [the noun] into [if the noun is plural-named]themselves[otherwise]itself[end if]." (F);
			rule succeeds;
		-- the can't pour empties rule:
			say "No more [liquid of the noun] [remain] in [the noun]." (G);
			rule succeeds;
		-- the can't overfill rule:
			say "[The second noun] [cannot] contain any more than [they] already [hold]." (H);
			rule succeeds;
		-- the might mix substances rule:
			say "[The liquid-mixture refusal][paragraph break]" (I);
			rule succeeds;
	make no decision.

Unsuccessful attempt by someone drinking something (this is the explain unsuccessful drinking rule):
	if the reason the action failed is:
		-- the can't drink things that aren't fluids rule:
			say "[The noun] [aren't] suitable to drink." (A);
			rule succeeds;
		-- the can't drink from empty containers rule:
			say "[The noun] [contain] nothing." (B) instead;
			rule succeeds;
		-- the can't drink noxious containers rule:
			say "The [liquid of the noun] [aren't] something [the actor] [can] drink." (C);
			rule succeeds.


Measured Liquid ends here.

---- Documentation ----

Measured Liquid provides a concept of volume, kinds for fluid containers and liquid sources, and actions for pouring, drinking, and swimming. It handles mixture recipes and allows players to combine liquids to produce new ones. It also provides full support for non-player characters to use the same actions.

Chapter: New Units 

Section: Volumes

Volumes are by default measured in oz, ounces, but gallons are also supported.

Chapter: New Kinds

Section: Liquids

Liquids are a kind of value in the present system. By default, only water and a null value, "nonliquid", are defined, but we may revise the list by adding entries to the Table of Liquids, like this:

	Table of Liquids (continued)
	liquid	potable	flavor
	absinthe	true	"It tastes bitter."
	motor oil	false	--

The potable entry indicates whether the liquid can be drunk.

The flavor sentence is optional, but is used to construct more interesting results for tasting and drinking, as demonstrated below. Providing a flavor sentence for a non-potable liquid will never have any interesting effect.

Liquids also have an optional description column, that will be added after naming the liquid. 

Section: Fluid containers and their descriptions

A fluid container is assigned a liquid and two volumes. 

The liquid is whatever the container contained last (or perhaps still contains). 

The volumes are the fluid capacity (how much it could possibly contain at maximum) and the fluid content (how much it does contain at the moment).

Like regular containers, fluid containers respond to examination by adding a line of text about their contents, as in:

	>EXAMINE TUMBLER
	A heavy tumbler with gold flecks in the glass.

	The tumbler is about half full of scotch.

Containers are generally approximate, and will only declare proportional information about the amount they contain, as in 

	The pitcher is full of absinthe.
	The pitcher is mostly full of absinthe.
	The pitcher is about half full of absinthe.
	The pitcher is mostly empty of absinthe.

If we want to make more substantial changes to the way a fluid container is described with respect to its contents, we may do this with the describing the fullness activity. This activity should print only the text that comes after the name of the object, and should end with no line break.

For instance, one of the describing fullness rules currently is

	Rule for describing the fullness of a non-empty graduated emptyable fluid container (called the sample cup) (this is the describe graduated containers rule):
		say "contain[s] [the fluid content of the sample cup] of [the liquid of the sample cup].[no line break]"; 

This produces the text that is shown on examining a fluid container, and sometimes after pouring.

We can also remove the entire rule that prints this content, as in

	*: The examining fluid containers rule is not listed in any rulebook.

...but this approach should be handled with caution. If we take this rule out and also do not define any description text for the fluid container, the Standard Rules' "examining containers" rule will run and print something like "The pitcher is empty" because the pitcher contains no solid objects, even if the pitcher is in fact brimming with Belgian ale at the time.

Section: Fluid containers and solid objects

By default the player is prevented from putting solid objects into any fluid container. This prevents many complicated situations where part of the volume of a glass might be displaced by a a metal cube, where a cork might float on the surface of some wine, where a handwritten note might be put into a coffee cup and rendered illegible, where a scrap of cloth might be discolored by its contact with red fruit punch, and so on.

If we want to remove this constraint, we can unlist it by writing
	
	*: The can't put solids into a fluid container rule is not listed in any rulebook.

However, a thing may be marked as submersible, in which case it may be added to any liquid.

Section: Inserting fluid containers

By default, we are not allowed to put an open, non-empty fluid container into another portable container, because it's likely to spill. (Fixed in place or scenery containers are exempt, to allow for refrigerators, cabinets, and similar installations.) This gets around the nonsensical situation of stowing a vase full of water into a backpack and then coming back later to find that the water all stayed in. 

If we do want to allow this after all, we can unlist the relevant rule thus:

	*: The can't stash full cups rule is not listed in any rulebook.

If Measured Liquid is used alongside Jon Ingold's Considerate Holdall extension, it will provide holdall a rule so that the game does not even attempt to stash an open non-empty container. The rule in question is the don't try to stash full cups rule.

Section: Cleaning fluid containers

By default, when we drink from something, even an empty cup retains a trace amount of the liquid it used to contain. This information is used in descriptions of the cup, and is also used to determine reactions if we try to DRINK JUICE after the juice cup is already emptied. Further, the game will assume we want to fill the container with more of whatever it previously contained, if that option is available.

Only an explicit command to RUB (or CLEAN, which is the same action) the cup will remove this trace; if we do that, however, its liquid is changed back to the null value, nonliquid.

To remove this behavior, add:
	
	*: Use no trace amounts.

whereupon drinking or pouring will always leave vessels empty and the behavior of RUB will not be interfered with.

Section: Liquid Sources

Fluid containers have a sub-kind called a liquid source. Liquid sources are supplies of water that flow eternally and never run out; it doesn't matter how much we take from this source.

Yet further sub-kinds are the liquid lake and the liquid stream.

The liquid lake represents a body of water large enough to swim in, and into which we can safely empty smaller containers without significantly diluting the content. Lakes are also relevant to the swim verb (see below).

The liquid stream is better used for fountains, faucets, and other flows of liquid that provide a constant supply but no standing body of liquid.

Chapter: New Actions

Section: Drinking 

The player is allowed to drink liquids from a fluid container, assuming those liquids have not been defined to be not potable.

By default, the output is one of the following, depending on whether the supply is depleted as a result:

	You take a sip of (the liquid).
	You take a sip of (the liquid), leaving (the container) empty.

If we have defined a flavor sentence for that liquid, that is added as the next sentence, as in:

	You take a sip of fruit punch, leaving the glass empty. The flavor is exceptionally cloying.

The amount of liquid swallowed by a sip is determined by the sip size. By default the sip size is 2 oz. 

Sometimes liquid measurement may be used as part of a puzzle in which we want the player to be compelled to measure things precisely. In this case, it might be desirable to make sips non-uniform in size so that the player cannot safely quantify liquids by sipping them. To do this, we have the option to
	
	Use variable sip size.

When using variable sip size, the sip is subject to a variation of up to 2/3 the standard size of a sip. 

It will not be possible to have a sip size of 0 as a result of random variation.

Finally, a fluid container can be "preferred for drinking". We can set this with, for instance:

	The cocktail glass is preferred for drinking.

This indicates that, in any ambiguous case, the game should try to drink from that vessel rather than from something else. This makes it easier to implement polite player characters who prefer to drink from glasses rather than from the carton, even though both may contain the same kind of liquid.

The drinking action has a liquid that varies, called "the liquid drunk".

Section: Pouring and Filling

This extension supports a wide range of pouring and filling grammar, including

	fill something with/from something
	pour something in/into/on/onto something
	mix something in/with something
	empty something into something

By default, if the player types only

	FILL CUP

the game will attempt to find a source that provides the same kind of liquid already in the cup in order to fill it back up; then it will default to some other liquid source, if no matching liquid source is available.

The player is prohibited from pouring a container into itself, overfilling a container that is already full, or filling from an empty container.

The pouring action has a liquid that varies, called "the liquid poured", and a volume that varies, called "the amount poured". These values can be used in constructing our own report rules to describe the action differently; for instance, we might write

Containers have a definition called "pourable" which means that they cannot be poured from if they contain more than 5 gallons of liquid. Containers that are not pourable will still function as a source of liquid, but the other object must be held by the player or takeable.

Section: Simple Mixing

By default, the player is not allowed to mix liquids of different types, since such mixtures make extra work for the author and may not always be desirable. Moreover, there is a text that varies which contains the refusal the player will receive, defined as follows:

	The liquid-mixture refusal is some text that varies. The liquid-mixture refusal is "That would mix [the liquid of the noun] with [the liquid of the second noun]."

If we want to keep the default behavior but change the message, we should alter the liquid-mixture refusal, as in 

	When play begins:
		now the liquid-mixture refusal is "[The person asked] dare not mix liquids!"

...or some similar message, bearing in mind that if characters other than the player can be persuaded to pour liquids, their responses as well as the player's will be handled by the liquid-mixture refusal.

Section: Swimming

By default, the player is not allowed to swim, but the verb is implemented in order to provide sensible responses in a range of situations. The command to swim will produce the message

	There's nothing sensible to swim in.

unless the player can see a liquid lake, in which case he'll be told

	You don't feel like a dip in (the liquid lake) just now.

SWIM IN (some specific item) will also be understood, though again there will be a default refusal in all cases. 

If we want to allow swimming in liquid lakes, we should begin by unlisting the block swimming rule, as in

	The block swimming in liquid lakes rule is not listed in any rulebook.

...and then supplying some carry out rules for swimming.

Example: * Lakeshore - A lakeshore with a lake as a liquid source, an openable graduated flask that can be used to drink from it, and examples of attempted swimming.

	*: "Lakeshore"

	Include Measured Liquid by Emily Short.

	Lakeside is a room. Inside from Lakeside is a Shack.

	The lake is a liquid lake in Lakeside. The liquid of the lake is water.

	The player carries a graduated closed openable fluid container called a flask. The fluid capacity of the flask is 10oz.

	Test me with "swim / swim in flask / fill flask / x flask / close flask / drink from flask / x flask / in / swim / drink from flask / x flask / swim in the water".

Example: * Lakeshore Swim - A lakeshore where the player can swim successfully.

	*: "Lakeshore Swim"

	Include Measured Liquid by Emily Short.

	Lakeside is a room. Inside from Lakeside is a Shack.

	The lake is a liquid lake in Lakeside. The liquid of the lake is water.

	The player carries a graduated closed openable fluid container called a flask. The fluid capacity of the flask is 10oz.

	The block swimming in liquid lakes rule is not listed in any rulebook. 

	Report swimming in the lake:
		say "You go for a swim in the lake and come out much refreshed."

	Test me with "swim".

Example: * Poisons - A drink that has a strong effect on the drinker.

The main thing to note about this is that we want to make the poison count as potable, so that the player will be able to drink it -- and then intervene after the foolish swallow, to make something interesting happen next.

	*: "Poisons"
	
	Include Measured Liquid by Emily Short.

	Room of Doom is a room.

	The vial is a fluid container. The fluid capacity of the vial is 1oz. The fluid content of the vial is 1oz. The liquid of the vial is poison. The vial is carried by the player.

	Table of Liquids (continued)
	liquid	potable	flavor
	poison	true	"It makes you ill."

	After drinking something:
		if the liquid drunk is poison:
			end the story saying "You have died in agony";
		otherwise:
			make no decision.

	Test me with "drink vial".

Example: * Guzzle and Gulp - Adding GULP and GUZZLE verbs alongside DRINK to allow the player to take different sizes of sip at will. GULP drinks a very large sip, while GUZZLE consumes all the liquid in a container in a single move. Demonstrates the use of sip size.

	*: "Guzzle and Gulp"

	Include Measured Liquid by Emily Short.
	
	Lakeside is a room. The lake is a liquid lake in Lakeside. The liquid of the lake is water.
	
	The player carries a closed openable fluid container called a flask. 
	 
	Understand "gulp [something]" as gulping. Understand "gulp [a fluid container]" as gulping.
	Gulping is an action applying to one thing.
	
	Carry out gulping:
		let old sip size be the sip size;
		now the sip size is 5oz;
		try drinking the noun;
		now the sip size is the old sip size.
	
	Report drinking something when the sip size is greater than 2oz:
		say "[We] [take] a long drink of [the liquid of the noun]." instead.
	
	Understand "guzzle [something]" as guzzling. Understand "guzzle [a fluid container]" as guzzling. Guzzling is an action applying to one thing.
	
	Carry out guzzling:
		let old sip size be the sip size;
		now the sip size is the fluid content of the noun;
		try drinking the noun;
		now the sip size is the old sip size.
		
	To toss is a verb. To finish is a verb.
	
	Report drinking something when the sip size is greater than 5oz and the noun is empty:
		say "[We] [toss] back all the [liquid of the noun] at once." instead.
	
	Report drinking something when the sip size is greater than 2oz and the noun is empty:
		say "[We] [finish] off the [liquid of the noun] in one long swig." instead.
	
	Test me with "fill flask / sip flask / g / g / g / g / g / fill flask / gulp flask / g / g / fill flask / guzzle flask / g".

