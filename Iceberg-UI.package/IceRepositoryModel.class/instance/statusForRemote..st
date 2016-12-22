accessing
statusForRemote: aRemote
	| incoming outgoing allStatus |
	
	incoming := (self repository incomingCommitsFrom: aRemote) size.
	outgoing := (self repository outgoingCommitsTo: aRemote) size.
	
	(incoming = 0 and: [ outgoing = 0 ]) ifTrue: [ ^ 'Up to date' ].
	allStatus := OrderedCollection new.
	incoming > 0 ifTrue: [ allStatus add: ('{1} incoming' format: {incoming}) ].
	outgoing > 0 ifTrue: [ allStatus add: ('{1} not published' format: {outgoing}) ].
	^ allStatus asCommaString