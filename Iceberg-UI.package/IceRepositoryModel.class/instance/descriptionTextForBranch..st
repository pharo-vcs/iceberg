accessing
descriptionTextForBranch: aBranch
	| text |
	
	text := aBranch name asText.
	(self isCurrentBranch: aBranch)
		ifTrue: [ text allBold ].
		
	^ text