"arbitraryText" by Kent Quirk

Example Location is a room. 

The default-value-pattern is some text that varies. The default-value-pattern is "default".

Noisewords is a list of text that varies. Noisewords is {"a", "an", "and", "the" }.

Table of arbitrary text
pattern	result
"default"	"something I don't know"
"bug\ *hammer"	"for squashing bugs"
"bug"	"that thing you do"
"matter|matta"	"nuttin!"
"hammer"	"for pounding in nails"
"entity"	"mysterious"


Table of Word Lookups
pattern	result
"north south east west"	"direction"
"foo bar bazz and"	"jargon"
"shiner/pixel"	"doggo"
"kitty"	"cat"


Understand "what is [text]" as querying about.

Querying about is an action applying to one topic.

Carry out querying about:
	let q be the topic understood;
	let tbl be the table of arbitrary text;
	let match be the tablematch tbl for q;
	say "[if match is not empty]A [match][else]Ah, that[end if] is [tablequery tbl for q].";

Understand "lookup [text]" as lookuping.

Lookuping is an action applying to one topic.

Carry out lookuping:
	let q be the topic understood;
	let tbl be the table of word lookups;
	let result be the tablewords tbl for q;
	say "[if result is empty]shrug[else][result][end if].";

To decide what text is tablequery (tbl - a table name) for (t - a text): 
	repeat through tbl:
		let re be the pattern entry;
		[first we see if the whole phrase matches]
		if t matches the regular expression re:
			decide on "[result entry]";
		otherwise:
			[now look for a match for each word in turn]
			repeat with index running from 1 to the number of words in t:
				let w be word number index in t;
				if w matches the regular expression re:
					decide on "[result entry]";
	[if we didn't find a match, look for an entry matching default-value-pattern.]
	decide on the exactmatch tbl for default-value-pattern.

To decide what text is tablematch (tbl - a table name) for (t - a text): 
	repeat through tbl:
		let re be the pattern entry;
		if t matches the regular expression re:
			decide on "[text matching regular expression]";
		otherwise:
			repeat with index running from 1 to the number of words in t:
				let w be word number index in t;
				if w matches the regular expression re:
					decide on "[text matching regular expression]";
	decide on "".
	
To decide what text is tablewords (tbl - a table name) for (t - a text): 
	repeat through tbl:
		let pat be the pattern entry;
		repeat with tix running from 1 to the number of words in t:
			let tw be word number tix in t;
			if tw is a noiseword:
				next;
			[now look for a match for each word in turn]
			repeat with pix running from 1 to the number of words in pat:
				let pw be word number pix in pat;
				if pw is tw:
					decide on "[result entry]";
	[if we didn't find a match, look for an entry matching default-value-pattern.]
	decide on the exactmatch tbl for default-value-pattern.

To decide what text is exactmatch (tbl - a table name) for (t - a text):
	if there is a pattern of t in tbl:
		decide on the result corresponding to the pattern of t in tbl;
	decide on "";

To decide whether (w - a text) is a noiseword:
	if w is listed in noisewords:
		decide yes;
	decide no.

