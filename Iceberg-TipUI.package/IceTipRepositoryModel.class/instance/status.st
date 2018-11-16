accessing
status
	[
		| status incoming outgoing | 

		self verifyDirectoryStructureIfMissing: [ :message | ^ message ].
		
		entity workingCopy workingCopyState isUnknownCommitState 
			ifTrue: [ ^ self toErrorMessage: entity workingCopy workingCopyState description ].	
		entity workingCopy isDetached 
			ifTrue: [  ^ self toErrorMessage: 'Detached Working Copy' ].
		(entity head isDetached and: [ entity head tags notEmpty ])
			ifTrue: [ ^ self toWarningMessage: 'Detached HEAD' ].
		entity head isDetached 
			ifTrue: [ ^ self toErrorMessage: 'Detached HEAD' ].

		entity workingCopy project isUnborn
			ifTrue: [ ^ self toErrorMessage: 'No Project Found' ].

		self isLoaded ifFalse: [ ^ 'Not loaded' ].

		status := OrderedCollection new.
		entity isModified ifTrue: [ status add: 'Uncommited changes' ].
		
		incoming := self incomingCommits size.
		incoming > 0 ifTrue: [ status add: ('{1} incoming' format: { incoming })].
		
		outgoing := self outgoingCommits size.
		outgoing > 0 ifTrue: [ status add: ('{1} not published' format: { outgoing })].

		status ifEmpty: [ status add: 'Up to date' ].
		
		^ ', ' join: status
	] 
	on: Error do: [ :error | ^ self toErrorMessage: error description ]
