querying
displayName
	^ self isLocal
		ifTrue: [ self name ]
		ifFalse: [ self name allButFirst: 'remotes/' size ]