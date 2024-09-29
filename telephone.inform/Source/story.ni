
"Telephone"

Include version 5 of Glulx Text Effects by Emily Short.

Table of User Styles (continued)
style name    	relative size    	color    	indentation  	italic 	font weight
blockquote-style    	--    	"#008800"	15	false  	regular-weight
special-style-1	-1	"#888888"	5	true	regular-weight

Use scoring.

Section 1 - Telephones and Connections

A telephone is a kind of thing. Understand "phone" as a telephone.

Understand "call [any telephone] on [something]" as calling it on. Understand "call [any telephone]" as calling it on. Understand the commands "dial" or "phone" or "telephone" as "call". Understand "call [any known person]" as calling it by name on.

Connection relates one thing to another (called the other party).

The verb to reach means the connection relation.

Calling it on is an action applying to one visible thing and one thing.

Check calling it on:
	if the second noun is not a telephone, say "[The second noun] is unlikely to be much use in that respect." instead;
	if the second noun is the noun, say "You get a busy signal." instead.

Carry out calling it on:
	if a person (called the listener) can see the noun, now the player reaches the listener.

[Because we've said that connection is a reciprocal, one-to-one relationship, Inform will do the rest of the bookkeeping: if (for instance) we telephone someone else, the first connection will be broken automatically.]

Report calling it on:
	say "'Hello?' says [the other party of the player]."

[To avoid annoyance, we should also let the player use CALL #### as well as CALL #### ON TELEPHONE. A rule from the chapter on Activities comes in handy here:]

Rule for supplying a missing second noun while calling something on:
	assign a phone.

To assign a phone:
	if the player can touch a telephone (called the current phone):
		say "(on [the current phone])[line break]";
		now the second noun is the current phone;
	otherwise:
		say "You don't have a phone handy."

[Things might be a little more complicated if we had cell phones that could be moved around, but for right now the player can only touch a maximum of one phone at a time.]

[Suppose we further want to allow the player to call people up by name, but only if they've already been encountered or are familiar to the player for some reason.]

A person can be known or unknown.

Understand "call [any known person]" as calling it by name on.

Understand "call [any known person] on [something]" as calling it by name on.

Rule for supplying a missing second noun while calling something by name on:
	assign a phone.

Calling it by name on is an action applying to one visible thing and one thing.

Check calling it by name on:
	if the noun is in the location, say "[The noun] is right here." instead.

Carry out calling it by name on:
	if the noun can touch a telephone (called the link), try calling the link on the second noun;
	otherwise say "You can't reach [the noun]." instead.

Before calling something on something when the player reaches someone:
	say "(first ending your conversation with [the other party of the player])[command clarification break]";
	end current conversation.

Understand "hang up [something]" and "goodbye [something]" as hanging up.

Hanging up is an action applying to one thing.

Check hanging up:
	if the noun is not a telephone, say "You can't hang up [the noun]." instead;
	if the player does not reach someone, say "You're not on the line with anyone." instead.

Carry out hanging up:
	now the player does not reach anyone.

Report hanging up:
	say "You put down [the noun], cutting the connection."

Before going somewhere when the player reaches someone:
	say "(first hanging up on [the other party of the player])[command clarification break]";
	end current conversation.
	
[And finally we want to make sure that calling random other numbers produces a sensible result:]

Understand "call [text]" as misdialling. Misdialling is an action applying to one topic. Carry out misdialling: say "The phone rings and rings but no one answers."

Understand "call 911" or "call 999" or "call police" or "call fire department" as a mistake ("After strict warnings, you've given up making prank calls to emergency services.").

Before misdialling when the player reaches someone:
	say "(first ending your conversation with [the other party of the player])[command clarification break]";
	end current conversation.

To end current conversation:
	let the current phone be a random telephone which can be touched by the player;
	silently try hanging up the current phone.

After deciding the scope of the player while the player reaches someone:
	place the other party of the player in scope, but not its contents.

[A note about this scope addition: the player can refer to the other party whenever he has the other person on the phone. He can't, however, see or refer to anything that person might be holding or wearing, thanks to the "but not its contents" option.]

[Furthermore, the player can't actually do anything to that person that requires touching. That's because of the reaching inside rules, which govern whether the player can reach through intervening barriers such as rooms. (See the Advanced Actions chapter for more about changing reachability.) There are two things we might want to be careful about, though.]

[First, we should specifically disallow the player from looking at the person on the other end of the line. Since sight doesn't require touching, the reaching inside rules will not be consulted about a command such as EXAMINE BOSS or LOOK UNDER BOSS. We can, however, intervene in such cases using the visibility rules, which are consulted for any actions that "require light" (including EXAMINE and LOOK UNDER). Here again we borrow some options from the Advanced Actions chapter:]

To decide whether acting through the line:
	if the noun is something and the location of the noun is not the location of the player:
		yes;
	if the second noun is something and the location of the second noun is not the location of the player:
		yes;
	no.

Visibility rule when acting through the line:
	there is insufficient light.

Rule for printing a refusal to act in the dark when acting through the line:
	say "You're not on a video call, so you can only hear." instead.

[Second, though the existing reaching inside rules are adequate to stop us from touching the person on the other end of the line, the response that's currently printed is a bit generic: it just says "You can't reach into [the room containing the person]." Let's add our own custom reply, instead:]

A rule for reaching inside a room (called destination):
	if the other party of the player is enclosed by the destination:
		say "Though you're on the line with [the other party of the player], you can't physically reach to [the destination].";
		deny access.

Section 2 - Conversation over the Phone, In General

[This portion supplies a simple method of conversation; but we could substitute some completely different conversation system if appropriate. The effect of the telephones is that we are allowed to talk to characters in distant locations under certain circumstances, after which the usual conversation rules apply.]

Instead of listening to a telephone when the player reaches someone:
	say "You can hear [the other party of the player] breathing."

Before listening to someone when the player cannot touch the noun:
	say "[The noun] is waiting for you to carry on the conversation." instead.

A person has a table name called chatter.

Before telling someone about something:
	try asking the noun about it instead.

Before answering someone that something:
	say "Best to confine your conversation to questions and answers." instead.
	
To say robcomment for (message - text):
	if message is not "":
		say "[special-style-1]([message])[roman type]";
	otherwise:
		say "".

Before asking someone about something:
	if the topic understood is a topic listed in the chatter of the noun:		
		if there is a score entry and the score entry is greater than 0:
			increase score by the score entry;
			blank out the score entry;
		say "[reply entry][line break][robcomment for commentary entry][conditional paragraph break]" instead;
	otherwise:
		 say "[The noun] does not reply." instead.

Section 3 - The Scenario

The Guard House is a room. "Here you spend all your nights. Bullet-proof windows offer a panoramic view of serene cliffs, palm trees, and a moonlit ocean. Occasionally someone is foolish enough to try a cliff ascent or even an attack by helicopter, but lately things have been pretty quiet.

The mansion is up the hill behind you, security lights ablaze."

The grey telephone is a telephone in the Guard House. Understand "6885" as the grey telephone. "Before you is a grey telephone. In black marker someone has written on it: MAIN OFFICE 2802."

Before going a direction in the Guard House, say "And leave your post? The boss would have you flayed. No kidding." instead.

[In a game where the player could walk around, we would of course want to add a before rule so that he automatically hung up any phone he was using before leaving the room.]

The Family Home is a room. Mom is a known woman in the Family Home. A telephone called the family telephone is in the Family Home. Understand "2802" as the family telephone.

The Police Station is a room. The Police Officer is an unknown man in the Station. A telephone called the station telephone is in the Police Station. Understand "1911" as the station telephone.

Potter's Pizza is a room. The pizza delivery boy is a known man in Pizza. A telephone called the saucy telephone is in Pizza. Understand "8885" as the saucy telephone.

The chatter of Mom is the Table of Mom Conversation. The chatter of the delivery boy is the Table of Pizza Conversation. The chatter of the Police Officer is the Table of Cop Conversation.

After calling the family telephone on something for the first time:
	say "'You can't be done yet,' your mother answers with annoyance. You'd think she'd be a little less businesslike, given that her brother just died."

Table of Mom Conversation
topic	score	commentary	reply
"me"	0	"Hah. He's probably drinking and watching the game."	"'Stop complaining. Your brother is so busy and you've certainly got nothing better to do, as far as I can tell.'"
"funeral/burial/service"	0	""	"'Oh, it was just lovely to see all of those people ... who have ignored Rob for years.' Sometimes Mom can be pretty sarcastic."
"Rob/brother" or "her brother"	1	""	"'Well, what do you want to know about him?'" 
"hat"	2	"Please don't do that yet."	"'His HAT? Why?!?...nevermind. Yeah, he always wore a stupid baseball hat. He thought it was hilarious. If you find it, burn it.'"
"bicycle/bike/cycling"	1	""	"'He had a nice bike, but I haven't seen him ride it lately.'"
"alarm"	0	"Gee, thanks."	"'Oh, I forgot to mention, the alarm code is the house number.'"
"police/cop/cops"	0	""	"'Oh COME ON! You've been there for like 5 minutes and the police have already arrived?'"
"military"	1	"Huh. She actually noticed."	"She is quiet for a moment. 'I think he was proud of his service in Afghanistan, but he never ever wanted to talk about it with me. I think you'd have to find someone he knew with a military background.'"

Table of Pizza Conversation
topic	score	commentary	reply
"pizza"	0	""	"'Pepperoni special tonight!' he says proudly."
"pepperoni"	0	""	"'Pepperoni is included free on ALL our pizzas,' he says proudly."
"no pepperoni"	0	""	"'Well, I don't see why you'd want that,' replies the boy sniffily. 'It's free!'"
"jalapeno"	0	""	"'Sorry, we're out of jalapenos this evening. There was a run on them.'"
"sausage"	0	""	"'Sausage, sure, we can do you sausage.'"
"canadian bacon"	0	""	"'There's currently an embargo on Canadian pig products.'"
"cheese"	0	""	"'We use four kinds,' says the boy, then lowers his voice confidentially. 'Actually, two of them are the same. Nobody ever counts. The stringy one, the one that comes in dollops and the orangey one. You know.'"
"pineapple"	0	""	"'We could put pineapple on there, sure,' says the delivery boy, in a tone that lets you know his opinion of people who order fruit-based pizzas."
"pineapple and garlic"	0	""	"'What kind of crazy combination is that?' demands the delivery boy, finally losing all self-control."
"delivery"	0	""	"'Well, I don't know,' says the boy in a worried voice. 'Last time I came there were attack dogs. And ninjas.'"
"massive gratuity"	0	""	"'There's no use in a big tip you don't live to spend,' says the delivery boy quite firmly."

Table of Cop Conversation
topic	score	commentary	reply
"me"	0	""	"'I can tell you're not from around here.'"
"Rob"	1	""	"'Yes, I knew him socially. What did you want to talk about?'"
"military"	2	""	"'Your uncle didn't want to talk about it much, but I know he saw a few things that he would rather not have seen. All I will say is that he should be honored for his service.'"
"alarm"	0	""	"'Be careful with that thing; a couple more false alarms and they'll charge you for coming out here.'"

Test me with "call 2802 / examine boss / ask boss about night of passion / ask boss about pizza / listen to telephone / call delivery boy on telephone / ask boy about cheese / tell boy about no pepperoni / ask boy about delivery / tell boy about massive gratuity / attack boy".


