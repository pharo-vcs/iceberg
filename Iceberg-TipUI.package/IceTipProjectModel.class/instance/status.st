accessing
status
	[
		| status incoming outgoing | 

		self verifyDirectoryStructureIfMissing: [ :message | ^ message ].
		self isLoaded ifFalse: [ ^ 'Not loaded' ].
		
		entity workingCopy workingCopyState isUnknownCommitState 
			ifTrue: [ ^ self makeError: entity workingCopy workingCopyState description ].
		entity workingCopy isDetached 
			ifTrue: [ ^ self makeError: 'Detached Working Copy' ].
		entity head isDetached 
			ifTrue: [ ^ self makeError: 'Detached HEAD' ].

		status := OrderedCollection new.
		entity isModified ifTrue: [ status add: 'Uncommited changes' ].
		
		incoming := self incomingCommits size.
		incoming > 0 ifTrue: [ status add: ('{1} incoming' format: { incoming })].
		
		outgoing := self outgoingCommits size.
		outgoing > 0 ifTrue: [ status add: ('{1} not published' format: { outgoing })].

		status ifEmpty: [ status add: 'Up to date' ].
		
		^ ', ' join: status
	] 
	on: Error do: [ :error | ^ self makeError: error description ]
