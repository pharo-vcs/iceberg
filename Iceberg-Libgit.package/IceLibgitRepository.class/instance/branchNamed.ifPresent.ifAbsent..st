branches
branchNamed: aString ifPresent: presentBlock ifAbsent: absentBlock 
	
	self withRepoDo: [ :repo |
		repo lookupLocalBranch: aString ifAbsent: [ ^ absentBlock value ].
		presentBlock value: (self basicNewBranchNamed: aString) ]