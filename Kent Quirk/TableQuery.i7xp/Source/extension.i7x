Version 1/210311 of Extended Table Queries by Kent Quirk begins here.
"An extension for searching tables in various ways, including regular expressions."

Use authorial modesty.

Section 1 - Overrideable entities

The default-value-pattern is some text that varies. The default-value-pattern is "default".

Table of Noisewords
item
"a"
"an"
"and"
"the"

Table of Demonstration Regex
pattern	reply
"xyzzy"	"wrong game"


Section 2 - Decision Phrases

[This queries the table based on regexp and returns the reply]
To decide what number is regexp-index (tbl - a table name) for (t - a text):
	repeat with rowix running from 1 to the number of rows in tbl:
		choose row rowix from tbl;
		if there is no pattern entry:
			next;
		let re be the pattern entry;
		[first we see if the whole phrase matches]
		if t matches the regular expression re:
			decide on rowix;
		otherwise:
			[now look for a match for each word in turn]
			repeat with index running from 1 to the number of words in t:
				let w be word number index in t;
				if w matches the regular expression re:
					decide on rowix;
	[if we didn't find a match, look for an entry matching default-value-pattern.]
	decide on the exact-index tbl for default-value-pattern.

[This queries the table based on regexp and returns the reply]
To decide what text is regexp-query (tbl - a table name) for (t - a text):
	let r be the regexp-index tbl for t;
	if r is 0:
		decide on the exact-match tbl for default-value-pattern;
	choose row r in tbl;
	decide on reply entry.

[This queries the table based on regexp and returns the text that actually matched. If nothing
matched, it returns an empty string.]
To decide what text is regexp-match (tbl - a table name) for (t - a text):
	repeat through tbl:
		if there is no pattern entry:
			next;
		let re be the pattern entry;
		if t matches the regular expression re:
			decide on "[text matching regular expression]";
		otherwise:
			repeat with index running from 1 to the number of words in t:
				let w be word number index in t;
				if w matches the regular expression re:
					decide on "[text matching regular expression]";
	decide on "".

[This queries the table based on looking for word matches and returns the reply]
To decide what number is word-index (tbl - a table name) for (t - a text):
	repeat with rowix running from 1 to the number of rows in tbl:
		choose row rowix from tbl;
		if there is no pattern entry:
			next;
		let pat be the pattern entry;
		repeat with tix running from 1 to the number of words in t:
			let tw be word number tix in t;
			if tw is a noiseword:
				next;
			[now look for a match for each word in turn]
			repeat with pix running from 1 to the number of words in pat:
				let pw be word number pix in pat;
				if pw is tw:
					decide on rowix;
	[if we didn't find a match, look for an entry matching default-value-pattern.]
	decide on the exact-index tbl for default-value-pattern.

[This queries the table based on looking for word matches and returns the reply]
To decide what text is word-query (tbl - a table name) for (t - a text):
	let r be the word-index tbl for t;
	if r is 0:
		decide on the exact-match tbl for default-value-pattern;
	choose row r in tbl;
	decide on reply entry.

[This queries the table based on word matches and returns the word that matched, or an empty string.]
To decide what text is word-match (tbl - a table name) for (t - a text):
	repeat through tbl:
		if there is no pattern entry:
			next;
		let pat be the pattern entry;
		repeat with tix running from 1 to the number of words in t:
			let tw be word number tix in t;
			if tw is a noiseword:
				next;
			[now look for a match for each word in turn]
			repeat with pix running from 1 to the number of words in pat:
				let pw be word number pix in pat;
				if pw is tw:
					decide on tw;
	decide on "".

[This queries the table based on an exact match of the pattern column]
To decide what text is exact-match (tbl - a table name) for (t - a text):
	if there is a pattern of t in tbl:
		decide on the reply corresponding to the pattern of t in tbl;
	decide on "";

To decide what number is exact-index (tbl - a table name) for (t - a text):
	repeat with rowix running from 1 to the number of rows in tbl:
		choose row rowix from tbl;
		if there is no pattern entry:
			next;
		let p be the pattern entry;
		if t is p:
			decide on rowix;
	decide on 0;

To decide whether (w - a text) is a noiseword:
	if w is an item listed in the Table of Noisewords:
		decide yes;
	decide no.

Extended Table Queries ends here.

---- DOCUMENTATION ----

This provides several decision phrases to allow players to be less rigid about their query syntax. This is mainly intended to allow for building smarter conversation systems.

This system searches tables with columns called "pattern" and "reply". The meaning of the pattern column varies with the query used.

If the table has a row whose pattern is the same as default-value-pattern, its reply will be returned in situations where no pattern matches.

The queries always return the first matching value, so take care when using overlapping patterns to list them in priority order.

The phrases included are:

regexp-query -- look up a value in a table, assuming that the "pattern" column of the table consists of regexp patterns. Each pattern is first matched against the entire query string as in tablematch. If that fails for a given row, then the query string is broken into individual words. If any of those words individually matches the pattern, the reply entry from that row is returned.

regexp-index -- perform the same lookup as regexp-query, but return a number corresponding to the row in the table.

regexp-match -- Same as regexp-query, but it returns the portion of the query that matched. This can be useful in dialogs so that the player knows what was understood.

word-query -- look up a value in a table, assuming that the "pattern" column of the table consists of a list of individual words, separated by punctuation or whitespace. Similarly, the query string is broken into words, and iterated. Noise words are ignored, and the reply entry is returned from the first row that has a non-noiseword that matches one of the words in the query string.

word-index -- perform the same lookup as word-query, but return a number corresponding to the row in the table.

word-match -- does a query like word-query, but returns the word that matched.

exact-match -- looks in the table for an exact match of the query string and the pattern. This is just a convenient table lookup that is compatible with the phrases above.

noiseword -- a boolean decision matching a word with a noiseword.

The list called noisewords can be replaced or added to.

Example: *** The Lookup - Regular expressions for table queries.

	*: "The Lookup"

	Include Extended Table Queries by Kent Quirk.

	The Cubicle is a room.

	Table of demonstration text (continued)
	pattern	reply
	"default"	"something I don't know"
	"bug\ *hammer"	"for squashing bugs"
	"bug"	"that thing you do"
	"(software )?engineer"	"a machine for turning coffee into bugs"
	"hammer"	"for pounding in nails"

	Understand "what is [text]" as querying about.

	Querying about is an action applying to one topic.

	Carry out querying about:
		let q be the topic understood;
		let tbl be the table of demonstration text;
		let match be the regexp-match tbl for q;
		say "[if match is not empty]Hmm... '[match]'[else]Ah, that[end if] is [regexp-query tbl for q].";

	Test me with "what is a bug / what is a hammer / what is the bughammer / what is a software engineer? / what is my favorite color?"


