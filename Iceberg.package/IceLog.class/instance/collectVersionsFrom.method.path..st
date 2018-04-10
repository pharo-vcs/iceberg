private
collectVersionsFrom: aCollection method: aMethod path: aPath
	| lastDefinition basepath history |
		
	basepath := self basepathOf: aPath.
	lastDefinition := MCMethodDefinition new.
	history := OrderedCollection new.
	aCollection reverseDo: [ :eachCommit | | definition |
		definition := self definitionFor: aMethod path: basepath commit: eachCommit.
		lastDefinition = definition  ifFalse: [ 
			history add: (IceLogVersion 
				commit: (self repository commitFromGitCommit: eachCommit)
				definition: definition asRingDefinition).
			lastDefinition := definition ] ].

	^ history reversed