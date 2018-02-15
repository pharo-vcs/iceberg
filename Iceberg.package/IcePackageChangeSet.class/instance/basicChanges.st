initialization
basicChanges
	| mine theirs |

	mine := self parent diff mySnapshot: self package.
	theirs := (self package isExported 
		ifTrue: [ self parent diff theirSnapshot: self package ]
		ifFalse: [ MCSnapshot empty ]).
	^ (mine notNil and: [ theirs notNil ]) 
		ifTrue: [ (MCPatch fromBase: theirs target: mine) operations ]
		ifFalse: [ #() ]