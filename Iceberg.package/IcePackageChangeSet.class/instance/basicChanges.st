initialization
basicChanges
	| mine theirs |
	self package isLoaded ifFalse: [ ^ #() ].
	(self isAnalyseFullChanges not 
		and: [ self package isModified not ]) 
		ifTrue: [ ^ #() ].
	
	mine := self parent mySnapshot: package.
	theirs := self parent theirSnapshot: package.
	^ (mine notNil and: [ theirs notNil ]) 
		ifTrue: [ (MCPatch fromBase: theirs target: mine) operations ]
		ifFalse: [ #() ]