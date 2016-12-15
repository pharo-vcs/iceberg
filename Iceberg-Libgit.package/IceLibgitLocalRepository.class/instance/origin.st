accessing
origin
	| remotes |
	remotes := self remotes.
	^ remotes
		detect: [ :each | each isOrigin ]
		ifNone: [ remotes first ]