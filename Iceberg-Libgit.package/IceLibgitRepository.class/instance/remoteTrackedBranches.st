remote-branches
remoteTrackedBranches
	^ OrderedCollection
		new: 10
		streamContents: [ :stream | 
			self repositoryHandle
				remoteBranchesDo: [ :br :isLocal | 
					self assert: isLocal not.
					stream nextPut: (self basicNewRemoteBranchNamed: br name) ] ]