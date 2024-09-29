"desksdrawers" by Kent Quirk

A drawered-thing is a kind of supporter.

A two-drawered-desk is a kind of drawered-thing.
opedfasdf
A three-drawered-cabinet is a kind of drawered-thing.

A drawer is a kind of container. It is openable. It is usually closed.

A drawer (called its left drawer) is part of every two-drawered-desk.
A drawer (called its right drawer) is part of every two-drawered-desk.

A drawer (called its top drawer) is part of every three-drawered-cabinet.
A drawer (called its middle drawer) is part of every three-drawered-cabinet.
A drawer (called its bottom drawer) is part of every three-drawered-cabinet.

The Study is a room.

The desk is a two-drawered-desk. The desk is in the study. The description of the desk is "It's a basic wooden desk with two drawers."
The pencil is in the desk's left drawer. The paper is in the desk's right drawer.
The pen is in the desk's left drawer.
The stapler is in the desk's left drawer.

The file cabinet is a three-drawered-cabinet. The file cabinet is in the study.
The incriminating letter is in the file cabinet's bottom drawer.

after examining a drawered-thing:
	repeat with item running through the things enclosed by the noun:
		if the item is a drawer and the item is open:
			let items be the list of things enclosed by the item;
			say "[The item] is open[if number of entries in items is not 0], and contains [items with indefinite articles][end if].";
			
A kitchen-cabinet is a kind of supporter. 

A cabinet-interior is a kind of container. It is openable. It is usually closed.

A cabinet-interior (called its interior) is part of every kitchen-cabinet.

To decide what number is item-count of (box - a cabinet-interior):
	decide on the number of entries in the list of things enclosed by the box.

To say list-contents of (box - a cabinet-interior):
	if the box is open:
		if the item-count of the box is 0:
			say "nothing[no line break]";
		otherwise:
			say "[list of things enclosed by the box with indefinite articles][no line break]".


After examining a kitchen-cabinet (called the parent) when a cabinet-interior (called the item) is part of the noun:
	if the item is open:
		say "[The parent] is open[if item-count of item is not 0], containing [list-contents of the item][end if].";
	else:
		say "[The parent] is closed.";
			
instead of opening a kitchen-cabinet (called kc) when a cabinet-interior (called the item) is part of the noun:
	try silently opening the item;
	say "You open [the kc], revealing [list-contents of the item].";
			
instead of closing a kitchen-cabinet (called kc) when a cabinet-interior (called the item) is part of the noun:
	try silently closing the item;
	say "You close [the kc].";
	
instead of inserting something (called the object) into a kitchen-cabinet (called kc) when a cabinet-interior (called the item) is part of the second noun:
	try silently inserting the object into the item;
	say "You place [the object] into [the kc].";
	rule succeeds;
			
The Kitchen is a room. The kitchen is north of the study.

The left cabinet is a kitchen-cabinet in the Kitchen.
The right cabinet is a kitchen-cabinet in the Kitchen.

The left cabinet's interior contains a a container called the bucket.
On the right cabinet is a mixer.

The right cabinet's interior contains a severed head.

