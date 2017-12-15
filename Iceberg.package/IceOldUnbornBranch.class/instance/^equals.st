comparing
= anObject
	"unborn branchs are equivallent if they are pointing to the same repository"

	anObject species = self species ifFalse: [ ^ false ].
	^ anObject repository = anObject repository