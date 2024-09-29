"MomInPerson" by Kent Quirk

Include Extended Table Queries by Kent Quirk.

Use scoring.

Table of Noisewords (continued)
item
"her"
"his"
"many"
"my"
"our"
"some"
"that"
"this"
"your"


Table of Mom Conversation
pattern	score	result	gift
"default"	0	"Mom [one of]shrugs vaguely[or]raises one eyebrow[or]turns back to the receiving line and greets whoever is next[or]looks around impatiently[or]points north at the exit[stopping]."	--
"me"	0	"'Stop complaining. Your brother is so busy and you've certainly got nothing better to do, as far as I can tell.'"	--
"funeral|burial|service|wake"	0	"'It will be over soon. But you can leave right now to go to Rob's house'."	--
"house"	1	"'You'll need keys. Here. Just put stuff in the van.'"	keychain
--	0	"null pattern"	--
"Rob|brother|uncle"	0	"'Listen,' she hisses. 'Your brother has already left with his kids and you're not flying back until tomorrow. Just go to the house and clean out his stuff.'"	-- 
"stuff|things"	1	"'What kind of ... [']stuff['] ... do you mean?', you ask.[paragraph break]She shoots you a whithering look. 'Don't be obtuse. The kinds of things we don't want showing up in an estate sale, of course. I'm sure you'll figure it out. You can call me if you have questions. Now get out of here! I'll deal with the funeral home.'"	totebag
"clean"	0	"'You don't actually have to clean. Just pack up some things for me and put them in the van. Keep anything you want for yourself in the totebag. And get rid of anything personal.'"	--
"van|key|keys|car|travel"	1	"'Oh, right. Just put things in the van. It's the white van out in the parking lot.' She digs in her purse. 'Here's the key.'"	van key
"mourners"	0	"'The only people still here are my friends. I'd love to introduce you...' She looks around the room without really looking. '...but it would be better for you to go to the house now.'"	--


The totebag is an openable container. The totebag is nowhere.

The keychain is a thing. The keychain is nowhere.

The van key is a thing. The van key is nowhere.


The Funeral Home Lobby is a room. "You're in the lobby of a funeral home, full of uncomfortable furniture, tissues, and small bottles of water. The exit is north. [if unvisited]It's just after Uncle Rob's wake. The last few mourners are waiting in a receiving line to pay their respects to your mother, his closest relative. You've managed to escape from your duties in the line, claiming your feet hurt. You avoid eye contact with the mourners, sipping obsessively from a tiny bottle of water, trying to avoid looking like someone people should talk to.[paragraph break]Mom is, as usual, holding it together even after a couple of hours. She looks around for you and gestures for you to join her. You take a deep breath and walk over.[paragraph break]'I need you to go to Rob's house.'[end if]".


Furniture is scenery in the lobby. "It's overstuffed and undercomfortable."

Tissues are scenery in the lobby. "Guaranteed to dry your tears and scratch your skin." Understand "tissue" as the tissues.

Small bottles of water are scenery in the lobby. "Looks risky. They might be recycled tears."

Instead of entering the furniture, say "It looks way too uncomfortable."

Instead of taking the tissues, say "You take one, blow your nose, and surreptitiously stuff the tissue into the cracks of a nearby couch."

Instead of taking the water, say "You don't know where it came from."

Instead of drinking the water, say "You're really not thirsty right now."

The parking lot is north of the lobby.

The mourners are scenery in the lobby. "They're all beginning to blur together. You don't think you even know any of the ones who still remain."

The wake is a scene. 
The wake begins when play begins. 
The wake ends when the player is holding the totebag. 

Mom is a person in the lobby. The initial appearance is "She's looking appropriately severe at the head of the receiving line, all in black, giving each mourner in turn her full attention.[paragraph break]You should ask mom about the house." The description is "She's your mom." Mom is female.

Understand "Mother" and "Mommy" and "Momma" and "Mama" as Mom.

Instead of kissing Mom, say "You kiss Mom chastely on the cheek. She smiles a bit and says 'Thank you. I raised you well.'"

Instead of asking Mom about: 
	let q be the topic understood;
	let tbl be the table of Mom Conversation;
	let r be the regexp-index tbl for q;
	choose row r from tbl;
	say "[result entry][paragraph break]";
	if there is a gift entry:
		now the player holds the gift entry;
		say "She [one of]hands[or]gives[at random] you [a gift entry].";
	if there is a score entry and the score entry is not zero:
		increase score by the score entry;
	[ we never want to erase the default entry -- this depends on it being row 1 ]
	if r is not 1:
		blank out the whole row.

Check going north when the player is in the lobby:
	If the player is not holding the keychain:
		say "You wonder how you are going to get in. Maybe you should ask Mom about the house." instead;
	If the player is not holding the van key:
		say "You should check to see if the van key is on that keychain." instead;
	If the player is not holding the totebag:
		say "You feel like you should ask Mom about that stuff." instead;

Understand "ask text" or "ask about [text]" or "ask what [text]" or "ask for [text]" as asking-anyone.

Understand "ask [anyone] what [text]" or "ask [anyone] for [text]" as asking it about.

Asking-anyone is an action applying to one topic.

Definition: a person is other if it is not the player.

Carry out asking-anyone:
	if an other person (called p) is visible:
		let t be the topic understood;
		try asking p about t.


