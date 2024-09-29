"test" by Kent Quirk

[Include version 13 of Room Description Control by Emily Short.
Include version 3 of Ordinary Room Description by Emily Short.]
Include version 6 of Automated Drawers by Emily Short.
Include Measured Liquid by Kent Quirk.

Use scoring.
The maximum score is 6.

Table of Liquids (continued)
liquid	potable	flavor
salt water	true	"It tastes like ocean water. You wouldn't want to drink much of it."

Chapter 1 - The components

Section 1 - Shells

[Shells should be distributed around the house. Like many people near the beach, Rob collected them as he walked the shoreline.]

A shell is a kind of thing. 
A shell can be spiral or flat. A shell is usually flat. 
A shell can be inhabitable or uninhabitable. A shell is usually uninhabitable.
A shell is submersible.

The scallop shell is a shell. The description is "It's a palm-sized scallop shell, like a crinkled potato chip, in shades of tan and white. It's pretty." 

The conch shell is a shell. The description is "It's a large and heavy spiral conch shell, bigger than your fist. You put it to your ear for a moment so you 'hear the ocean'." It is spiral.

The snail shell is a shell. The description is "A medium-sized spiral shell from a snail." It is spiral. It is inhabitable.

The tiny shell is a shell. The description is "It's a perfect -- but very tiny -- snail shell." It is spiral. 

An oyster shell is a shell. The description is "It's irregular, bluish-black and shiny, but covered with some white lumpy barnacles and stuck-on kelp." 

A mussel shell is a shell. The description is "It's a basic black mussel shell. Pretty much the least interesting shell around." 

A clam shell is a shell. The description is "This is a large New England quahog clam shell about the diameter of a softball, cream-colored with hints of gray and white." 



There is a quartz rock here. The description is "It's a fist-sized smooth white rock. A good paperweight."


There is a pencil. There is some paper. 
There is an ancient candy bar. The candy bar is edible.

Section 2 - Fishfood

There is a jar of fishfood. "It's a shaker jar of fish flakes." [The caption of the jar is "Frank's Fishy Flakes -- fine for fish! (OK for hermit crabs for a little while.)". ]The jar of fishfood is an openable closed container. The jar contains some fish flakes. Fish flakes are edible and submersible. Understand "food" as the jar of fishfood.

Section 3 - File Cabinet

The black file cabinet is a supporter. The initial appearance of the file cabinet is "On the far wall is a low, metal file cabinet, painted black, with three drawers. The fishtank is on it." The file cabinet is fixed in place. Three vertical drawers are part of the file cabinet.


When play begins:
	now the pencil is in a random drawer incorporated by the file cabinet;
	now the paper is in a random drawer incorporated by the file cabinet;
	now the jar is in a random drawer incorporated by the file cabinet;
	now the candy bar is in a random drawer incorporated by the file cabinet;
	now the snail shell is in a random drawer incorporated by the file cabinet;

Section 4 - The wastebasket

The sunporch contains an open unopenable fluid container called a wastebasket. The description of the wastebasket is "It's a small plastic trash can." The fluid capacity of the wastebasket is 2 gallons. Understand "trash can", "can", and "basket" as the wastebasket.
 
Section 5 - The Hermit crab and the fishtank

[These two things are closely tied together]
	
The hermit crab is a neuter animal. The description of the hermit crab is "It's a small hermit crab wearing [a houseshell of the hermit crab]. It looks [crab-mood for hermit crab]. But maybe that's just the way crabs look.". The hermit crab is submersible.

To say crab-mood for (crab - an animal):
	say "[if crab is hungry]hungry[otherwise if crab is cramped]awkward[otherwise if crab is captive]wistful[end if]".

The hermit crab has a shell called the houseshell. The houseshell of the hermit crab is the tiny shell.

The hermit crab can be hungry or well-fed. The hermit crab is hungry.

The hermit crab can be comfortable or cramped. The hermit crab is cramped.

The hermit crab can be captive or free. The hermit crab is captive.

[This allows us to keep the hermit crab from nagging the player right after they've done something right.]
The hermit crab can be quiet or chatty. The hermit crab is chatty.

To say still: [player has solved part of the crab but we want them to know there's still more to do.]
	if the hermit crab is comfortable or the hermit crab is well-fed:
		say "still ";

Every turn while the hermit crab is visible:
	if the hermit crab is quiet:
		now the hermit crab is chatty;
	otherwise if a random chance of 1 in 2 succeeds:
		If the hermit crab is hungry:
			say "[The hermit crab] [still]seems [one of]to stare at you accusingly[or]to be wanting something[or]hungry[or]to need attention[at random].";
		else if the hermit crab is cramped:
			say "[The hermit crab] [one of]looks like it barely fits into its shell[or][still]seems uncomfortable in that tiny shell[or]seems to need a new shell[stopping].";
		else if the hermit crab is captive:
			say "[The hermit crab] [one of]appears to be gazing longingly toward the ocean[or]seems to be pining for the great outdoors[or]seems to be dreaming of the open sea[at random]."

The block giving rule is not listed in the check giving it to rules.

Instead of giving [something] to [an animal]:
	try inserting the noun into the fishtank instead.
	
Check of inserting [something] into the fishtank:
	if the noun is the jar:
		try inserting flakes into the fishtank instead.
	
To say crab-movement:
	say "[one of]crawls[or]scuttles[or]climbs[or]scrambles[or]clambers[or]chitters[at random]"
	
After inserting [something] into the fishtank:
	if the noun is a shell:
		if the hermit crab is comfortable:
			say "[The hermit crab] seems to be pretty happy with its current shell.";
		otherwise:
			say "You place [the noun] into the aquarium. [one of]As soon as you get your hand out[or]Once you let it go[or]Immediately[or]Soon[at random], [the hermit crab] [crab-movement] over to inspect [the noun]. [If the noun is flat]It steps onto the surface of the shell, looks up in your direction, as if to say 'what am I supposed to do with this flat thing?' [else if the noun is uninhabitable] It leaves its own shell behind and [crab-movement] in. After a long pause, it [crab-movement] back into its original shell. You could swear you saw it shake its tiny head.[else] It pauses, then rushes into the new shell, disappearing inside. After a moment, it pops its head out. It already seems happier.[end if] Then it [crab-movement] back to [one of]its home on[or]its place on[or]the top of[at random] [the plastic castle].";
			if the noun is spiral and the noun is inhabitable:
				now the houseshell of the hermit crab is the noun;
				now the tiny shell is in the fishtank;
				now the hermit crab is comfortable;
				now the hermit crab is quiet;
				increase score by 2;
	otherwise if the noun is edible:
		say "As you shake the food on the water, [the hermit crab] seems to practically leap off its perch. The food quickly disappears and the crab [crab-movement] back to its castle.";
		now the hermit crab is well-fed;
		now the hermit crab is quiet;
		now the noun is nowhere;
		increase score by 1;
	otherwise:
		say "[The noun] falls to the bottom of the tank."
		
Check taking the plastic castle:
	if the castle supports the hermit crab:
		if the hermit crab is well-fed and the hermit crab is comfortable:
			say "[The hermit crab] politely [crab-movement] out of your way, onto the floor of the aquarium.";
			now the hermit crab is in the fishtank;
		otherwise:
			say "[The hermit crab] lifts its tiny gripping claw in a wordless challenge, and you back off. Perhaps it needs something from you." instead.

There is an open unopenable fluid container called the fishtank. The initial appearance of the fishtank is "You see a small, generic, rectangular fishtank, containing what looks like salt water, with a sandy bottom and a plastic castle. Sitting on the castle is a hermit crab." The fluid capacity of the fishtank is 10 gallons. The fluid content of the fishtank is 7 gallons. The liquid of the fishtank is salt water. Understand "tank" and "aquarium" as the fishtank.

The fishtank contains a supporter called a plastic castle. A hermit crab is a neuter animal on the castle. The description of the castle is "To no one's surprise -- not even [the hermit crab]'s -- it's a little plastic castle just like everyone buys for their first fish tank." The castle is submersible and portable.

Before taking the fishtank:
	If the fishtank is not pourable:
		say "It's [one of]got so much [liquid] in it that you will surely spill it[or]too full to move safely[or]going to slosh if try you move it like this[at random]. [first time]Maybe you should take some of the [liquid] out.[only]" instead;
	otherwise:
		repeat with item running through things that are enclosed by the fishtank:
			if item is not the hermit crab and item is not a shell:
				say "It's going to be awkward to carry with [the item] in it." instead;
				break;
	
Instead of pouring the fishtank into the ocean:
	say "[We] carefully [dump] [the liquid] out of [the noun]. [If the the hermit crab is in the fishtank]The hermit crab seizes its opportunity and leaps into [the second noun]. You catch a glimpse of it happily crawling across the bottom before it goes out of sight.[end if]";
	now the fluid content of the fishtank is null volume;
	now the hermit crab is nowhere;
	increase score by 3;
	end the story finally saying "Congratulations! You have freed the grateful hermit crab.";
	rule succeeds;
	

Before filling the wastebasket with the fishtank:
	if the fluid content of the fishtank is less than the fluid capacity of the wastebasket:
		say "You can't get any more [liquid of the fishtank] out of the tank with [a noun]." instead.


Chapter 2 - The porch

Section 1 - Porch

The Sunporch is a room. "It's an open-air porch that is bordered by the ocean, only steps away. Apparently you can do that in this part of the world."

The sunporch contains a liquid lake called the ocean. The liquid of the ocean is salt water.

The sunporch contains the file cabinet and the conch and the scallop shell.

The file cabinet supports the fishtank.

Test me with "x tank / x crab / take castle / open top / open bottom / take jar / open jar / feed flakes to crab / put conch in tank / put snail in tank / fill can from tank / pour can in ocean / fill can from tank / pour can in ocean / take castle / drop castle / take tank / pour tank in ocean "

