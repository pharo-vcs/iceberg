accessing
origin
	| remotes |
	remotes := self remotes.
	self flag: #todo. "I need an null remote"
	remotes ifEmpty: [ ^ nil  ].
	^ remotes
		detect: [ :each | each isOrigin ]
		ifNone: [ remotes first ]