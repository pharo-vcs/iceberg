private-tracking
upstream
	
	^ repository pullRemote
		remoteBranchNamed: self name
		ifAbsent: [ nil ]