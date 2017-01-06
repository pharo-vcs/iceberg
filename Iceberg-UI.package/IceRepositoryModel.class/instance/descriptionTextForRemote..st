accessing
descriptionTextForRemote: aRemote
	| text |
	
	text := aRemote remoteName asText.
	(self isPullRemote: aRemote)
		ifTrue: [ text makeAllColor: self colorIncoming ].
	(self isPushRemote: aRemote)
		ifTrue: [ text makeAllColor: self colorOutgoing ].
		
	^ text