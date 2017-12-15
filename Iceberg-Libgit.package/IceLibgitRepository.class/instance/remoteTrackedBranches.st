remote-branches
remoteTrackedBranches
	
	self withRepoDo: [ :repo | 	
		^ OrderedCollection new: 10 streamContents: [ :stream |
			repo remoteBranchesDo: [ :br :isLocal | 
				self assert: isLocal not.
				stream nextPut: (self basicNewRemoteBranchNamed: br name) ]]]