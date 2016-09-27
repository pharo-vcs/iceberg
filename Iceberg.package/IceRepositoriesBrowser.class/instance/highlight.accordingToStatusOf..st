highlighting
highlight: aString accordingToStatusOf: entity
	"entity could be a repository or a package"

	| text modified incomming outgoing |	
	text := Text fromString: aString.

	entity isLoaded 
		ifFalse: [ text makeAllColor: Color darkGray ]
		ifTrue: [  
			modified := entity isModified.
			incomming := entity incommingCommits notEmpty.
			outgoing := entity outgoingCommits notEmpty.

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