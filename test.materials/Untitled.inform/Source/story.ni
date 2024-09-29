"Cubie" by Kent Quirk

Include Extended Table Queries by Kent Quirk.

The Cubicle is a room.

Table of arbitrary text
pattern	result
"default"	"something I don't know"
"bug\ *hammer"	"for squashing bugs"
"bug"	"that thing you do"
"(software )?engineer"	"a machine for turning coffee into bugs"
"hammer"	"for pounding in nails"


Understand "what is [text]" as querying about.

Querying about is an action applying to one topic.

Carry out querying about:
	let q be the topic understood;
	let tbl be the table of arbitrary text;
	let match be the regexp-match tbl for q;
	let r be the regexp-index tbl for q;
	choose row r in tbl;
	say "[if match is not empty]Hmm... '[match]'[else]Ah, that[end if] is [regexp-query tbl for q]. [pattern entry]";

Test me with "what is a bug / what is a hammer / what is a bughammer / what is a software engineer?"
	

