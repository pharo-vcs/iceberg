checking
checkMissing
	
	self isMissing ifTrue: [ 
		IceError signal: ('You have no repository atttached to project "{1}"' format: { self name }) ]