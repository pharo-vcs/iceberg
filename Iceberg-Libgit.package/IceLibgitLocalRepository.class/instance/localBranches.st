querying
localBranches
	self withRepoDo: [ :repo | 	
		^ OrderedCollection new: 10 streamContents: [ :stream |
			repo localBranchesDo: [ :name :isLocal | 
				stream nextPut: (
					IceLocalBranch 
						named: name 
						inRepository: self frontend) ]]]
