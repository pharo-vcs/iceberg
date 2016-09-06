utilities
statusFor: package
	| status incomming outgoing | 
	package isLoaded ifFalse: [ ^ 'Not loaded.' ].
	
	status := OrderedCollection new.
	package isModified ifTrue: [ status add: 'Uncommited changes' ].
	
	incomming := package incommingVersions size.
	incomming > 0 ifTrue: [ status add: ('{1} incomming' format: { incomming })].
	
	package repository upstream 
		ifNil: [ status add: 'Unpublished branch' ] 
		ifNotNil: [
			outgoing := package outgoingVersions size.
			outgoing > 0 ifTrue: [ status add: ('{1} outgoing' format: { outgoing })]
		].

	^ status ifEmpty: 'Up to date' ifNotEmpty: [ ', ' join: status ]

