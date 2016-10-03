highlighting
highlight: aString
	"entity could be a repository or a package"

	| text modified incomming outgoing |	
	text := Text fromString: aString.

	entity isLoaded 
		ifFalse: [ text makeAllColor: Color darkGray ]
		ifTrue: [  
			modified := entity isModified.
			incomming := self incommingCommits notEmpty.
			outgoing := self outgoingCommits notEmpty.

			modified ifTrue: [ text prepend: '* ' ].
			modified | incomming | outgoing ifTrue: [ 
				text allBold; makeAllColor: (
					modified 
						ifTrue: [ self colorModified ] 
						ifFalse: [ incomming 
							ifTrue: [ self colorIncomming ] 
							ifFalse: [ self colorOutgoing ]])].
		 ].

	^ text