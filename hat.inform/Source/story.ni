"Here's your hat." by Kent Quirk

Include version 5 of Glulx Text Effects by Emily Short.

Table of User Styles (continued)
style name    	relative size    	color    	indentation  	italic 	font weight
blockquote-style    	--    	"#008800"	15	false  	regular-weight
special-style-1	--	"#888888"	5	true	regular-weight


Chapter 1 - Setup

A thing has some text called caption. The caption of a thing is usually "".

Understand the command "read" as something new. Understand "read [something]" as reading. Reading is an action applying to one thing, requiring light. Check reading: if the caption of the noun is "", say "Nothing is written on [the noun]." instead. Carry out reading: say "You read: [italic type][caption of the noun][roman type][line break]". Report reading: do nothing.

[The baseball cap is haunted by Rob, and if you're wearing it you can hear him. If you're not wearing it but you're near it, it bugs you to wear it.]
There is a baseball cap. It is wearable. The description is "It is a tattered baseball cap with a funny saying. It must have belonged to Uncle Rob, and he must have loved it, because it's pretty beat up." The caption is "Old sailors never die -- they just get a little dinghy.". Understand "hat" as the baseball cap. After wearing the baseball cap, say "[one of]It feels comfortable. It's almost like Rob is here with you[or]You feel a surprising sense of relief to have it back on your head[or]Phew, that feels better[or]Aaaah[stopping]."

[Commentary is what Rob says about things when you examine them. The best way is to use one of...stopping to make sure he says different things, and to have the last item be empty so that after a while he doesn't comment any more.]
A thing has some text called commentary. The commentary of a thing is usually "". 

To say RobCommentary:
	unless commentary of the noun is "":
		say "[line break][special-style-1]([commentary of the noun])[roman type][line break]".

After examining a thing:
 	if player is wearing the baseball cap:
		say "[RobCommentary]";
	otherwise if the baseball cap is visible and a random chance of 1 in 2 succeeds:
		say "[one of]That baseball cap looks pretty comfy[or]Your head feels a bit chilly[or]You feel a strange urge to put on a hat[or]Rob would probably be happy for you to be wearing his hat[at random]."
		
After taking off the baseball cap, say "[one of]It feels weird without a hat on[or]You feel uncomfortable not wearing the cap[or]The sun is too bright today to go without some eyeshade[or]Somehow it doesn't seem right to take it off[at random]."
	

Chapter 2 - Hallway

The Hallway is a room. The baseball cap is here.
A Rubik's Cube is here. A pocketknife is here. It has commentary "Careful. It's sharp."

The description of the Rubik's Cube is "It's a scrambled Rubik's Cube. You twist it back and forth and notice that it turns very easily. It must be a speed cube."

The commentary of the Rubik's Cube is "[one of]I was pretty good at that thing.[or]That's a good cube.[or][stopping]"


Test me with "l / x cap / x cube / x cube / wear cap / x cube / x cube / remove cap / x cube / x cube / wear cap "