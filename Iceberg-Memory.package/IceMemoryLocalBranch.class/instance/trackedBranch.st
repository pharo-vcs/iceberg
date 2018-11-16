accessing
trackedBranch
	
	^ repository remoteTrackedBranches detect: [ :each | each name = name ]