"actiontest" by Kent Quirk

The computer room is a room. 
The office is a room.
The computer room is north of the office.


A keyboard is a kind of thing.
A keyboard is scenery.
The PC is a keyboard in the computer room.

A calculator is a kind of thing.
A calculator is scenery.
The HP is a calculator in the office. 

Understand "type [text] on [something]" as typing.
Understand "type [text]" as typing.

Typing is an action applying to one topic and one thing.

To key-in (stuff - a text) on (keything - a calculator):
	say "I'm [the verb] typing [stuff] on the calculator".

To key-in (stuff - a text) on (keything - a keyboard):
	say "I'm typing [stuff] on the keyboard".


Check typing:
	if the second noun is not a calculator and the second noun is not a keyboard, say "That doesn't work." instead.
	
Carry out typing the topic understood:
	let input be "[the topic understood]";
	say "i'm typing [input] on [the second noun]...";
	key-in input on the second noun.
	
Rule for supplying a missing second noun while typing:
	if the player can touch a keyboard (called target):
		now the second noun is the target;
	otherwise if the player can touch a calculator (called target):
		now the second noun is the target;
	otherwise:
		say "You need to be near a keyboard to type on it.".
