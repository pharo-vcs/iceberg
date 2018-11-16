API-branches
localBranches

	self handleLibgitError: [ 
		self repositoryHandle isUnborn
			ifTrue: [ ^ {self head} ].
		^ OrderedCollection
			new: 10
			streamContents: [ :stream | self repositoryHandle localBranchesDo: [ :br :isLocal | stream nextPut: (self basicNewBranchNamed: br name) ] ] ]