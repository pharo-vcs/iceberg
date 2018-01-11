merging
setMergeStateBetweenCommits: aCollection 
	
	self loadedPackages do: [ :each | 
		self updatePackage: each toCommits: aCollection ]