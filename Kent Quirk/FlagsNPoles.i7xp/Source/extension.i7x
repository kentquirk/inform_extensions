Version 1/210309 of Flags and Flagpoles by Kent Quirk begins here.
"An extension for flags and flagpoles."

Use authorial modesty.

Section 1 - Flags

A hangable flag is a kind of thing.

Instead of waving a hangable flag, say "It really needs a pole to wave from."

Section 2 - Poles

A flagpole is a kind of supporter.

Instead of examining a flagpole (called fp):
	say "[flagHeight of fp].".

Instead of climbing a flagpole (this is the no-climbing rule):
	say "It doesn't look strong enough for that.".

Before taking a hangable flag when the noun is on a flagpole (called fp):
	 if fp is not fully-lowered:
		 instead say "The flag is too high to reach.".

Rule for implicitly taking a hangable flag:
	rule fails;

Flag-hanging is an action applying to two things.

Understand "hang [something] on [something]" and  "hang [something] from [something]" as flag-hanging.
Understand "put [hangable flag] on [flagpole]" as flag-hanging.
Understand "hang [something]" as flag-hanging.

Rule for supplying a missing second noun while flag-hanging:
	if the player can touch a flagpole (called target):
		now the second noun is the target;
	otherwise:
		say "You need to be near a flagpole.".

A flagpole can be fully-lowered, or half-mast, or fully-raised.
A flagpole is usually fully-lowered.

Check flag-hanging:
	If the player is not holding a hangable flag, say "You aren't holding a flag!" instead;
	If the second noun is not a flagpole, say "[The second noun] won't be a good place to hang [the noun]." instead;
	If the noun is not a hangable flag, say "It would be too disrespectful to hang that." instead;
	If a hangable flag is on the second noun, say "You can only put one flag on it." instead.

Carry out flag-hanging (this is the flag-hanging rule):
	let flg be the noun;
	let fp be the second noun;
	now flg is on fp;
	now fp is fully-lowered;
	say "[The flg] is hanging at the bottom of [the fp].".

To say flagHeight of (fp - a flagpole):
	unless a hangable flag (called flg) is on fp:
		say "There is [a fp] here, but there's no flag on it.";
	otherwise:
		if fp is fully-lowered:
			say "[A flg] is hanging limply near the bottom of [the fp][no line break]";
		otherwise if fp is half-mast:
			say "[A flg] is fluttering proudly at half-mast on [the fp][no line break]";
		otherwise if fp is fully-raised:
			say "[A flg] is waving in the breeze at the top of [the fp][no line break]";

Understand "raise [hangable flag]" as flag-raising.
Understand "lower [hangable flag]" as flag-lowering.

Flag-raising is an action applying to one thing.
Flag-lowering is an action applying to one thing.

Check flag-raising:
	unless the player can touch a flagpole (called target):
		say "You need to be near a flagpole." instead;
	if the target is fully-raised:
		say "The flag is as high as it can go." instead;
	unless the target is holding a hangable flag:
		say "There is no flag on [the target] to raise!" instead;

Carry out flag-raising:
	if the player can touch a flagpole (called target):
		now target is fully-raised;
		notice flag state(target);
		say "You raise the flag to the top of the pole. [flagHeight of the target].";


Check flag-lowering:
	unless the player can touch a flagpole (called target):
		say "You need to be near a flagpole." instead;
	if the target is fully-lowered:
		say "The flag is as low as it can go." instead;
	unless the target is holding a hangable flag:
		say "There is no flag on [the target] to lower!" instead;


To notice flag state (fp - a flagpole):
	do nothing;

Carry out flag-lowering:
	if the player can touch a flagpole (called target):
		if target is fully-raised:
			now target is half-mast;
			notice flag state(target);
		otherwise if target is half-mast:
			now target is fully-lowered;
			notice flag state(target);
		say "You lower the flag a bit. [flagHeight of the target].";
		rule succeeds;

Flags and Flagpoles ends here.

---- DOCUMENTATION ----

This provides a way to have flags that can be hung on flagpoles (one per pole). The explicit behavior is that "raise" goes all the way to the top, but "lower" stops on the way down at half mast.

We can capture the flagpole state or the actions for scoring.

BEFORE RELEASING THIS, CONSIDER REWRITING TO ALLOW USERS TO SPECIFY ARBITRARY SETS OF POSITIONS.


Example: *** The Garden - basics

	*: "Garden"

	Include Flags and Flagpoles by Kent Quirk

	The Garden is a room.

	The pride flag is a hangable flag in the garden. The description is "A rainbow-colored pride flag."

	The blue pole is a flagpole in the garden. The initial appearance of the flagpole is "There is a shockingly blue flagpole here." The description of the flagpole is "It's a blue flagpole."

	After flag-hanging for the first time, increase the score by 1.

	To notice flag state (fp - a flagpole):
		if fp is half-mast:
			increase the score by 1;

