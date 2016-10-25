accessing
status
	"entity could be a repository or a package"
	[
		| status incomming outgoing | 
		self repository isMissing ifTrue: [ ^ 'Local repository missing' asText allBold makeAllColor: self colorError ].
		self isLoaded ifFalse: [ ^ 'Not loaded.' ].

		status := OrderedCollection new.
		entity isModified ifTrue: [ status add: 'Uncommited changes' ].
		
		incomming := self incommingCommits size.
		incomming > 0 ifTrue: [ status add: ('{1} incomming' format: { incomming })].
		
		outgoing := self outgoingCommits size.
		outgoing > 0 ifTrue: [ status add: ('{1} not published' format: { outgoing })].

		^ status ifEmpty: 'Up to date' ifNotEmpty: [ ', ' join: status ]
	] 
	on: Error do: [ :error | ^ error description asText makeAllColor: self colorError ]

