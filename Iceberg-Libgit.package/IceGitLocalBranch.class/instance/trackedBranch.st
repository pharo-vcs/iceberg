accessing
trackedBranch
	
	| upstream |
	upstream := self upstream.
	upstream ifNil: [ 
		upstream := self setUpstream: (self lookupRemoteBranch: '/origin/', self name) ].
	
	^ upstream