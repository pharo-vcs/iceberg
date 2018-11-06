private-pushing
setUpstreamIfMissing: aRemote
	
	self hasUpstream ifTrue: [ ^ self ].
	self setUpstream: (aRemote remoteBranchNamed: self gitRef)