branches
newBranchNamed: aString commit: aCommit

	^ IceMemoryLocalBranch new
		name: aString;
		commit: aCommit;
		repository: self;
		yourself