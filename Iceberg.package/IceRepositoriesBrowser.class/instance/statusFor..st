building
statusFor: package
	| status incomming | 
	package isLoaded ifFalse: [ ^ 'Not loaded.' ].

	status := OrderedCollection new.
	package isModified ifTrue: [ status add: 'Local modifications' ].
	
	incomming := package incommingVersions size.
	incomming > 0 ifTrue: [ status add: ('{1} Incomming commits' format: { incomming })].

	^ status ifEmpty: 'Up to date' ifNotEmpty: [ '.' join: status ]