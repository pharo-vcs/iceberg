querying
localBranches
	
	self withRepoDo: [ :repo | 
		repo isUnborn ifTrue: [ ^ { self head } ].
			
		^ OrderedCollection new: 10 streamContents: [ :stream |
			repo localBranchesDo: [ :br :isLocal | 
				stream nextPut: (self basicNewBranchNamed: br name) ]]]