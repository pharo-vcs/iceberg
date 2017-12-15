accessing
descriptionTextForBranch: aBranch
	^ aBranch isRemote
		ifTrue: [ aBranch name ]
		ifFalse: [ | text |
			text := aBranch name asText.
			(self isCurrentBranch: aBranch)
				ifTrue: [ text allBold ].
			text ]