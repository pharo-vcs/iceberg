initialization
basicChanges
	| mine theirs |

	mine := self parent mySnapshot: self package.
	theirs := (self package isExported 
		ifTrue: [ self parent theirSnapshot: self package ]
		ifFalse: [ MCSnapshot empty ]).
	^ (mine notNil and: [ theirs notNil ]) 
		ifTrue: [ (MCPatch fromBase: theirs target: mine) operations ]
		ifFalse: [ #() ]