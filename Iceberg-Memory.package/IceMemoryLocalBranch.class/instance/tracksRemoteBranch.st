tracking
tracksRemoteBranch
	
	^ repository remoteTrackedBranches anySatisfy: [ :branch | branch name = self name ]