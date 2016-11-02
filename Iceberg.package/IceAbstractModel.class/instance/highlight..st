highlighting
highlight: aString
	[ 
		| text modified incomming outgoing |	
		text := Text fromString: aString.

		self repository isMissing ifTrue: [ ^ text allBold; makeAllColor: self colorError ].
		self isLoaded ifFalse: [ ^ text makeAllColor: self colorNotLoaded ].

		modified := entity isModified.
		incomming := self incommingCommits notEmpty.
		outgoing := self outgoingCommits notEmpty.

		modified ifTrue: [ text prepend: '* ' ].
		modified | incomming | outgoing ifTrue: [ text allBold ].

		modified ifTrue: [ ^ text makeAllColor: self colorModified ].
		incomming ifTrue: [ ^ text makeAllColor: self colorIncomming ].
		outgoing ifTrue: [ ^ text makeAllColor: self colorOutgoing ].
		^ text
	]
	on: Error do: [ ^ aString ]