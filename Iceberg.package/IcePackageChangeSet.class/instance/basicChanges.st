initialization
basicChanges
	self package isLoaded 
		ifTrue: [
			| mine theirs |
			mine := self parent mySnapshot: package.
			theirs := self parent theirSnapshot: package.
			^ (mine notNil & theirs notNil) 
				ifTrue: [ (MCPatch fromBase: theirs target: mine) operations ]
				ifFalse: #()
		]
		ifFalse: [ ^ #() ].
