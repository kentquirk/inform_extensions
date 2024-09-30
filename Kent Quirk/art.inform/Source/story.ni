"art" by Kent Quirk

Framed Art is a kind of thing. 

The null secret is a thing.
Framed Art has a thing called the secret. The secret of the framed art is usually the null secret.

After dropping Framed Art (called the painting):
	If the secret of the painting is not the null secret:
		Now the secret of the painting is nowhere;
		say "You hang [the painting] over [the secret of the painting], hiding it from view.";
	otherwise:
		say "You hang it carefully on the wall.";

Understand "hang [something]" as dropping.

After taking Framed art (called the painting):
	If the secret of the painting is not the null secret:
		move the secret of the painting to the location of the player;
		say "Behind [the painting] you uncover [the secret of the painting].";
	continue the action;


The Gallery is a room. 

Mona Lisa is Framed Art in the Gallery. The description of Mona Lisa is "Her mysterious smile has captivated people for hundreds of years. She appears to be slightly amused at something beyond your shoulder, while at the same time the Italian countryside is arrayed beyond her shoulder in exchange."

Guernica is Framed Art in the Gallery. The description of Guernica is "This cubist masterpiece is both strange and chilling, depicting the sack of the Spanish city of Guernica from all angles at once."

The wall safe is a thing. The secret of the Mona Lisa is the wall safe. 
