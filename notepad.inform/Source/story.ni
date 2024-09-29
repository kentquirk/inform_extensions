"notepad" by Kent Quirk

The office is a room. 
The hallway is a room. The hallway is north of the office.

The desk is a supporter in the office.

On the desk is a pencil.
On the desk is a stack of paper.

Part 1 - Jotter

A jotter is a kind of thing. 
A jotter has an external file called the text file. 
A jotter can be fresh or used. 
A jotter is usually fresh. 
A jotter has a text called the heading.
A jotter has a text called last written.

The currently erased jotter is an object that varies. 

To erase (pad - a jotter): 
    now the currently erased jotter is the pad; 
    write "[heading of the currently erased jotter][paragraph break]" to the text file of the pad; 
    now the pad is fresh.

To write in (pad - a jotter): 
	let T be the topic understood;
	let Msg be "";
	let Num be "";	
	[a number, optional punctuation, and the rest of the line]
	if T matches the regular expression "(\d+)< :)->*(.*)$":
		let Num be the text matching subexpression 1;
		let Msg be the text matching subexpression 2;
		now last written of the pad is "[Num]: [Msg]";
	otherwise:
		now last written of the pad is "Note:  [T]";
	append "[last written of the pad][line break]" to the text file of the pad;
	now the pad is used.

To read (pad - a jotter): 
    say "You read: [paragraph break][text of the text file of the pad]".


Instead of examining a used jotter (called the pad): 
    read the pad.

Instead of examining a fresh jotter (called the pad): 
    say "There is nothing of note in [the pad]."

Understand "write [text] in [something preferably held]" as writing it in. 
Understand "write down [text]" as writing it in. 
Understand "write [text]" as writing it in. 

Writing it in is an action applying to a topic and one thing. 

Rule for supplying a missing second noun while writing: if a jotter (called the pad) is carried, now the second noun is the pad; otherwise say "You will have to specify what to write that in."

Check writing it in: 
    if the second noun is not a jotter, say "It would be better to write in a notebook." instead.

Carry out writing it in: 
    write in the second noun.

Report writing it in: 
    say "You write '[last written of the second noun]' into [the second noun]."

Understand "erase [something preferably held]" as erasing. Erasing is an action applying to one carried thing.

Check erasing: 
    if the noun is not a jotter, say "It's hard to see how." instead.

Carry out erasing: 
    erase the noun.

Report erasing: 
    say "You scrub out all the entries in [the noun]."

Understand "remember [text]" as a mistake ("(you should probably write it down.)").


When play begins: 
	repeat with pad running through jotters: 
		erase the pad.

The player is holding a jotter called your notebook. The file of Player's Observations is called "notebook". The text file of your notebook is the file of Player's Observations. The heading of your notebook is "Things I Wish I Didn't Have To Know".
