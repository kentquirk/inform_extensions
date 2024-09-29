"Nonmechanical Garden" by Kent Quirk

A hangableFlag is a kind of thing.

Instead of waving a hangableFlag, say "It really needs a pole to wave from."

A flagpole is a kind of supporter. 

The initial appearance of a flagpole is "A white flagpole, which has rusted and been repainted many times, stands nearby.". The indefinite article is "the". The description is "It's an old white flagpole. [flagHeight of the noun].".

Instead of climbing a flagpole:
	say "It doesn't look strong enough for that.".

Before taking a hangableFlag when the noun is on a flagpole (called fp):
	 if fp is not fully-lowered:
		 instead say "The flag is too high to reach.".
		
Rule for implicitly taking a hangableFlag:
	rule fails;

Flag-hanging is an action applying to two things.

Understand "hang [something] on [something]" as flag-hanging.
Understand "put [something] on [something]" as flag-hanging when the player can touch a flagpole.
Understand "hang [something]" as flag-hanging.

Rule for supplying a missing second noun while flag-hanging:
	if the player can touch a flagpole (called target):
		now the second noun is the target;
	otherwise:
		say "You need to be near a flagpole.".

A flagpole can be fully-lowered, or half-mast, or fully-raised.
A flagpole is usually fully-lowered.

Check flag-hanging:
	If the player is not holding a hangableFlag, say "You aren't holding a flag!" instead;
	If the second noun is not a flagpole, say "[The second noun] won't be a good place to hang [the noun]." instead;
	If the noun is not a hangableFlag, say "It would be too disrespectful to hang that." instead;
	If a hangableFlag is on the second noun, say "You can only put one flag on it." instead.

Carry out flag-hanging (this is the flag-hanging rule):
	let flg be the noun;
	let fp be the second noun;
	now flg is on fp;
	now fp is fully-lowered;
	say "[The flg] is on [the fp].".
	
To say flagHeight of (fp - a flagpole):
	unless a hangableFlag (called flg) is on fp:
		say "But there's no flag on it.";
	otherwise:
		if fp is fully-lowered: 
			say "[A flg] is hanging limply near the bottom";
		otherwise if fp is half-mast: 
			say "[A flg] is fluttering proudly at half-mast";
		otherwise if fp is fully-raised: 
			say "[A flg] is waving in the breeze at the top";

Understand "raise [hangableFlag]" as flag-raising.
Understand "lower [hangableFlag]" as flag-lowering.

Flag-raising is an action applying to one thing.
Flag-lowering is an action applying to one thing.

Check flag-raising:
	unless the player can touch a flagpole (called target):
		say "You need to be near a flagpole." instead;
	if the target is fully-raised:
		say "The flag is as high as it can go." instead;
	unless the target is holding a hangableFlag:
		say "There is no flag on [the target] to raise!" instead;
		
Carry out flag-raising:
	if the player can touch a flagpole (called target):
		now target is fully-raised;
		say "You raise the flag to the top of the pole.";


Check flag-lowering:
	unless the player can touch a flagpole (called target):
		say "You need to be near a flagpole." instead;
	if the target is fully-lowered:
		say "The flag is as low as it can go." instead;
	unless the target is holding a hangableFlag:
		say "There is no flag on [the target] to lower!" instead;
		
Carry out flag-lowering:
	if the player can touch a flagpole (called target):
		if target is fully-raised:
			now target is half-mast;
		otherwise if target is half-mast: 
			now target is fully-lowered;
		say "You lower the flag a bit. [flagHeight of the target].";


The Garden is a room. East of the garden is The Backyard.

The Garden contains a flagpole called the white flagpole.
The Garden contains a hangableFlag called an American flag.

The player is holding a banana.


Test me with "put flag on flagpole / get flag / put flag on flagpole / lower flag / raise flag / take flag / lower flag / x flagpole / take flag / lower flag / x flagpole / take flag / raise flag / hang flag / raise flag".