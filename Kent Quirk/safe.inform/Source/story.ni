"Safety"

The Vault is a room. "Snug yet paranoid, this represents the state of the art in cheerless security." 

A safe is here. "A small wall safe, labeled 'Vanguard Safe-T-Max 9000', stares back at you intimidatingly. The dial is numbered from 0 to 59." The Safe is closed and fixed in place. Understand "dial" as the Safe.

Instead of opening the safe, say "The safe opens only when spun to the correct combination."

In the Safe is a silver florin. 

The safe has a number called the combo. The combo is 0.
The safe has a number called the correct combo. The correct combo is 314159.

Understand "spin [something] to [a number]" as spinning it to.

Spinning it to is an action applying to one thing and one number. 

Check spinning it to: 
	if the noun is not the Safe:
		say "[The noun] does not spin." instead;
	if the number understood is greater than 59:
		say "The dial only goes up to 59." instead;
	if the number understood is less than 0:
		say "The range of the dial is 0 to 59." instead;

Carry out spinning it to:
	now the combo of the noun is the the combo of the noun times 100 plus the number understood;
	now the combo of the noun is the remainder after dividing the combo of the noun by 1000000;	
	If the combo of the noun is the correct combo of the noun: 
		now the noun is open; 
		say "You hear a clunk and [the noun] door swings slowly open, revealing [a list of things in the Safe].";
	Otherwise:
		say "The dial makes a quiet ratchet sound while you turn it."


Test me with "open safe / spin safe to 1131 / open safe / spin safe to 31 / spin safe to 41 / spin safe to 59 / x safe / get florin".


