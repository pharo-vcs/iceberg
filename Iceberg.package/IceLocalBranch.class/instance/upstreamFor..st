private
upstreamFor: aRemote
	^ self backend 
		lookupBranchNamed: self name 
		inRemote: aRemote remoteName
