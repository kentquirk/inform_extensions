"keyboard" by Kent Quirk

The office is a room. 


Part 1 - 12 Words

Table of Twelve Words
word	sequence	found	message
"fish"	1	0	"That smells correct"
"tank"	2	0	"That lands with a splash"
"kitchen"	3	0	"Now we're cooking"
"knife"	4	0	"That's on point"
"sand"	5	0	"True grit"
"wood"	6	0	"That wood seem to be correct"
"fire"	7	0	"Blazingly accurate"
"flag"	8	0	"You're being waved on"
"bird"	9	0	"Bird is the word"
"bicycle"	10	0	"As easy as..."
"cube"	11	0	"The solution is nigh"
"ghost"	12	0	"The spirit is willing"

Part 2 - Keyboard

A keyboard is a kind of thing. 
A keyboard is scenery.
A keyboard has some text called the code. 

Understand "texttype [text] on [something]" as keyboard-typing.
Understand "texttype [text]" as keyboard-typing.

keyboard-typing is an action applying to one topic and one thing.

Check keyboard-typing:
	if the second noun is not a keyboard, say "[The second noun] is unlikely to be much use in that respect." instead.

Carry out keyboard-typing the topic understood:
	let input be "[the topic understood]";
	let KB be the second noun;
	repeat through The Table of Twelve Words:
		if input is the word entry:
			if the found entry is 1:
				say "You've already entered '[input]'; you don't need to enter it again.";
				rule succeeds;
			otherwise:
				now the found entry is 1;
				say "The zorter chirps, and '[input]' is added to the list in position [the sequence entry].[paragraph break][The message entry].";
				rule succeeds;
	say "The zorter beeps annoyingly. '[Input]' doesn't seem to be one of the 12 words.";
	rule fails;


Rule for supplying a missing second noun while keyboard-typing:
	if the player can touch a keyboard (called target):
		now the second noun is the target;
	otherwise:
		say "You need to be near a keyboard to type on it.".

A zorter is a keyboard in the office.

To say entered words:
	let items be a list of text;
	let blankcount be 0;
	repeat through The Table of Twelve Words:
		if the found entry is 1:
			add "'[word entry]'" to items;
		otherwise:
			increment blankcount;
	if blankcount is 0:
		say "which are all filled. The words are [items]";
	otherwise if blankcount is 12:
		say "all of which are empty";
	otherwise:
		say "containing [items], with [blankcount] of them still empty.";
			
The description of the zorter is "It's a cryptocurrency wallet device, with the brand name 'Zorter'. It's got a tiny alphabetic keyboard on it, and its small screen shows 12 spaces, [entered words]."


Part 3 - Keypad

A keypad is a kind of thing.
A keypad is scenery.
A keypad has some text called the code.

Understand "type [text] on [something]" as keypad-typing.
Understand "type [text]" as keypad-typing.
Understand "enter code [text] on [something]" and "enter [text] on [something]" as keypad-typing when a keypad is visible.
Understand "enter code [text]" and "enter [text]" as keypad-typing when a keypad is visible.
Understand "disarm [something] with [text]" as keypad-typing (with nouns reversed).
Understand "disarm with [text]" and "disarm [text]" as keypad-typing.

Keypad-typing is an action applying to one topic and one thing.

Check keypad-typing:
	[if the second noun is a keyboard (called target), try texttype the first noun on the target instead;]
	if the second noun is not a keypad, say "[The second noun] is unlikely to be much use in that respect." instead.

Carry out keypad-typing the topic understood:
	let input be "[the topic understood]";
	let length be the number of characters in input;
	let KP be the second noun;
	unless input matches the regular expression "<0-9>+":
		if input is "code" or input is "alarm":
			say "You need to enter a numeric code.";
			rule fails;
		say "It's a purely numeric keypad.";
		rule fails;
	if length < the number of characters in the code of KP:
		say "Nothing happens. It seems like you need more digits.";
	otherwise if length > the number of characters in the code of KP:
		say "The alarm emits a brief chirp after the first [the number of characters in the code of KP] digits but that's all.";
	otherwise:
		if input is the code of KP:
			say "You have re-armed the alarm system!";
		otherwise:
			say "The alarm goes silent and dark.".

Rule for supplying a missing second noun while keypad-typing:
	if the player can touch a keypad (called target):
		now the second noun is the target;
	otherwise if the player can touch a keyboard (called target):
		let input be the topic understood;
		try keyboard-typing input on target;
		say "try texttype [input] on [target]";
	otherwise:
		say "You need to be near something you can type on!".


Test me with "x zorter / texttype cube on zorter / texttype cube on zorter / texttype fish on zorter / texttype foo on zorter / x zorter".
