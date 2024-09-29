"My cubicle" by Kent Quirk

Include Room Description Control by Emily Short.
Include Tailored Room Description by Emily Short.

Part 1 - Basics

A thing can be truckable, toteable, burnable, or unneeded. A thing is usually unneeded.

Chapter 1 - Baseball Cap (haunted)

[Rob has thoughts about things when you examine them. The hat controls whether you hear those things. So we push the player to wear the hat. The content of what is shown is controlle by the memory system.]

The baseball cap is a wearable object. The description of the cap is "It is a tattered baseball cap with a funny saying. It was a favorite of Rob's, and it's pretty beat up.[if player is not wearing the cap][paragraph break][one of]You feel a strange compulsion to wear it.[or]You wonder what it would look like on you.[or]It might feel good to wear it.[at random][end if]". The cap is wearable. The caption of the baseball cap is "Old sailors never die -- they just get a little dinghy.". Understand "hat" as the baseball cap. 

The baseball cap is burnable.

Understand the command "toss" as "throw". ["toss hat" is too tempting, especially since we have a ring]

The cap can be quiet or chatty. The cap is quiet.

Before going to a room (called R):
	if the player is not wearing the baseball cap and the hatspot of R is not nothing:
		now the cap is on the hatspot of R.

Every turn when player is not wearing the baseball cap:
	if the baseball cap is quiet:
		now the baseball cap is chatty;
	otherwise:
		if the baseball cap is visible and a random chance of 1 in 2 succeeds:
			say "[one of]That baseball cap looks pretty comfy[or]Your head feels a bit chilly[or]You feel a strange urge to put on a hat[or]Rob would probably be happy for you to be wearing his hat[at random]."

After taking off the baseball cap:
	now the cap is quiet;
	say "[one of]It feels weird without a hat on[or]You feel uncomfortable not wearing the cap[or]The sun is too bright today to go for long without eyeshade[or]Somehow it doesn't seem right to take it off[at random]."

After examining the baseball cap:
	now the cap is quiet.

After wearing the baseball cap for the first time:
	say "[first time]Maybe the funeral got to you a little bit. [only]It almost feels like Rob is [one of]here[or]with you[or]in the room[at random].";
	continue the action.


Chapter 2 - Room extras

A room has some text called initial appearance. The initial appearance is usually "".

A room has some text called appearance. The appearance is usually "".

A room has a text called tourKey. The tourKey of a room is usually "".

A room has an object called the hatspot. The hatspot of a room is usually nothing.

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


Part 2 - Reading captions

A thing has some text called caption. The caption of a thing is usually "".

To decide whether (item - a thing) is readable:
 	if the caption of the item is not "":
	 	decide yes;
	decide no.

Understand the command "read" as something new.
Understand "read [something]" as reading.

Reading is an action applying to one thing, requiring light.

Check reading: unless the noun is readable, say "Nothing is written on [the noun]." instead.

Carry out reading: 
	say "[The noun] says [italic type][caption of the noun][roman type][line break]".


Report reading: do nothing.

Chapter 3 - rooms

The Yard is a room. The appearance is "This is the yard's appearance." The initial appearance is "This is the yard's initial appearance." The description is "this is the description."

The baseball cap is in the yard. 
The ball is in the yard. The ball is toteable.

The Yard is north of the Garden.

The Garden is a room. The appearance is "You see a low granite bench beside a sparse circle of white stones, with a scraggly azalea bush opposite." The initial appearance is "This is a restful garden area, although it's been designed to be low-maintenance. There's a circle of white stones around the flagpole, and an azalea bush that has seen better days."

The bench is a supporter in the Garden.

The hatspot of the Garden is the bench.

 The hermit crab is a neuter animal. The description of the hermit crab is "It's a small hermit crab wearing a shell. It looks bored. But maybe that's just the way crabs look.". 

The hermit crab is on the bench.

Check taking the crab:
	say "[one of]He doesn't like that.[or]Nah.[stopping]" instead.
	

Chapter 4 - List

A Checkable list is a kind of portable thing.
A Checkable list has a text called the caption. The caption is usually "ToDo List". 
A Checkable list has a text called temporary storage.
A Checkable list has a list of texts called the item-list. 
A Checkable list has a list of texts called the checked-item-list. 
The description of a Checkable list is usually "a list labeled '[caption]'".

Adding it to is an action applying to one topic and one thing.
Adding is an action applying to one topic.

Understand "add [text] to [something]" as adding it to.
Understand "add [text]" as adding when the player carries a list.

Check adding it to:
	unless the second noun is a Checkable list, say "You should probably add that to a list instead." instead;
	otherwise:
		let input be "[the topic understood]";
		if input is listed in the item-list of the second noun:
			say "[input] is already listed!" instead.

Carry out adding it to:
	let input be "[the topic understood]";
	add "[input]" to the item-list of the second noun;
	
Report adding it to:
	let input be "[the topic understood]";
	say "You [one of]scrawl[or]scribble[or]write[or]add[at random] '[input]' into the list.".

Check adding:
	unless a Checkable list (called target) is carried:
		say "You don't seem to be carrying a list." instead.

Carry out adding:
	if a Checkable list (called target) is carried:
		try adding the topic understood to the target. 	

Ticking it off is an action applying to one topic and one thing.
Ticking is an action applying to one topic.

Understand "check [text] off [something]" or "tick [text] off [something]" as ticking it off.
Understand "check [text]" or "tick [text]" as ticking when the player carries a list.
 
Check ticking it off:
	unless the second noun is a Checkable list, say "That doesn't seem possible." instead;
	otherwise:
		let input be "[the topic understood]";
		unless input is listed in the item-list of the second noun:
			say "There's little point in checking off something ([input]) that's not on the list." instead;
		if input is listed in the checked-item-list of the second noun:
			say "[input] was already checked, but you check it again for good measure." instead;

Carry out ticking it off:
	let input be "[the topic understood]";
	add "[input]" to the checked-item-list of the second noun;

Report ticking it off:
	let input be "[the topic understood]";
	say "You get a little dose of endorphins by checking off [input].";

Check ticking:
	unless a Checkable list (called target) is carried:
		say "You don't seem to have a list on you." instead.

Carry out ticking:
	if a Checkable list (called target) is carried:
		let input be "[the topic understood]";
		try ticking the topic understood off the target. 	

To say print list of (L - a Checkable list):
	say "[bold type][the caption of L]:[roman type][line break]";
	repeat with I running through the item-list of L:
		if I is listed in the checked-item-list of L:
			say "[fixed letter spacing]  (X) [I][line break]";
		otherwise:
			say "[fixed letter spacing]  ( ) [I][line break]";
		say "[roman type]".

Instead of reading a Checkable list:
	say "[print list of the noun]" instead.

InstantAdding is an action applying to one thing.
Understand "InstantAdd [something]" as InstantAdding.

Carry out InstantAdding:
	let input be the temporary storage of the noun;
	try adding input to the noun.


A ToDo List is a Checkable list on the bench.
The caption of the ToDo List is "Things I gotta do".

Understand "glorp [text]" as glorping.

Glorping is an action applying to one topic.

Carry out glorping:
	now the temporary storage of the todo list is the topic understood.
	try InstantAdding the todo list.
[	try adding the topic understood to the todo list.]