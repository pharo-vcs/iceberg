testing
isUnborn
	[ self command: 'rev-parse HEAD --' ]
	on: MCFileTreeGitError do: [ :e | ^ true ].
	^ false