initialization
basicChanges
	| mine theirs |

	self package isLoaded ifFalse: [ ^ #() ].
	self package workingCopy modified ifFalse: [ ^ #() ].
	
	mine := self parent mySnapshot: package.
	theirs := self parent theirSnapshot: package.
	^ (mine notNil and: [ theirs notNil ]) 
		ifTrue: [ (MCPatch fromBase: theirs target: mine) operations ]
		ifFalse: [ #() ]