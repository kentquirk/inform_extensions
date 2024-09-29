"Garden" 

Include Flags and Flagpoles by Kent Quirk

Use scoring.

The maximum score is 4.

The Garden is a room. 

The pride flag is a hangable flag in the garden. The description is "A rainbow-colored pride flag."

The blue pole is a flagpole in the garden. The initial appearance of the flagpole is "There is an alarmingly blue flagpole here." The description of the flagpole is "It's a blue flagpole."


After flag-hanging for the first time, increase the score by 1.

To notice flag state (fp - a flagpole):
	say "notice: [flagHeight of fp]";
	if fp is half-mast:
		increase the score by 1;
		say "half mast!"