"memories" by Kent Quirk

Include version 5 of Glulx Text Effects by Emily Short.



Table of User Styles (continued)
style name    	relative size    	color    	indentation  	italic 	font weight
blockquote-style    	--    	"#008800"	15	false  	regular-weight
special-style-1	-1	"#888888"	5	true	regular-weight

A room has a text called memoryKey. The memoryKey is usually "".
A thing has a text called memoryKey. The memoryKey is usually "".

The Bedroom is a room. "Bedroom description. The hallway is west."
The memoryKey of the bedroom is "bedroom".

There is a cap in the Bedroom. The cap is wearable.

The Hallway is west of the bedroom. "A boring hallway. The kitchen is north; the bedroom is to the east."

The Kitchen is north of the hallway. "Kitchen description. South takes you back to the hallway." 

There is a knife in the kitchen. The description of the knife is "It's a kitchen knife. It looks very well used, and it is probably wickedly sharp. You notice a gleam from its edge."
The memoryKey of the knife is "knife".

The memoryKey of the kitchen is "kitchen".

Table of Memories
item	memory	commentary	reaction	reuse
"bedroom"	"I had a poster of Kitt"	"I never liked that show."	"I think you had to be a certain age"	1
"kitchen"	"I used to sit here after school and do homework over a bowl of Captain Crunch."	"That cereal always cut my mouth up."
"knife"	"Uncle Rob gave me a really nice knife once."	"You lost it at scout camp."	"I ... lost it."	2

To render a memory for (k - text):
	If k is an item listed in the Table of Memories:
		if there is a reuse entry and the reuse entry is 0, stop;
		let reactionOK be false;
		If there is a memory entry and the memory entry is not "": 
			say "[blockquote style][memory entry][roman type][paragraph break]";
			now reactionOK is true;
		If there is a commentary entry and the commentary entry is not "" and the player is wearing the cap: 
			say "[special-style-1]([commentary entry])[roman type][paragraph break]";
			now reactionOK is true;
		If 	reactionOK is true and there is a reaction entry and the reaction entry is not "":
			say "[reaction entry][paragraph break]";
		if there is a reuse entry and the reuse entry is greater than 0, decrement the reuse entry.

After printing the locale description of a room (called the locale): 
	unless the memoryKey of the locale is "":
		let k be the memoryKey of the locale;
		render a memory for k;

After examining a thing (called the target):
	unless the memoryKey of the target is "":
		let k be the memoryKey of the target;
		render a memory for k.
	
