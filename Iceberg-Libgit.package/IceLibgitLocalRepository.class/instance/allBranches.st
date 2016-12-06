querying
allBranches
	self withRepoDo: [ :repo | 	
		^ OrderedCollection new: 10 streamContents: [ :stream |
			repo allBranchesDo: [ :name :isLocal | 
				stream nextPut: (
					IceBranch 
						named: name 
						local: isLocal
						inRepository: self frontend) ]]]
	
