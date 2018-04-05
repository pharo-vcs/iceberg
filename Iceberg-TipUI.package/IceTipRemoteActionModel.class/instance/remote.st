accessing
remote
	^ remote ifNil: [ 
		remote := self entity remotes first ]