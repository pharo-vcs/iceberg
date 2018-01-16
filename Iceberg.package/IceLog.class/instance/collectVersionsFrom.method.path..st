private
collectVersionsFrom: aCollection method: aMethod path: aPath
	| lastDefinition basepath history |
		
	basepath := self basepathOf: aPath.
	lastDefinition := MCMethodDefinition new.
	history := OrderedCollection new.
	aCollection do: [ :eachCommit | | definition |
		definition := self definitionFor: aMethod path: basepath commit: eachCommit.
		lastDefinition = definition ifFalse: [ 
			history add: (IceLogVersion 
				commit: (self iceCommitFrom: eachCommit)
				definition: definition asRing2Definition).
			lastDefinition := definition ] ].

	^ history