branches
switchToBranchNamed: aString onCommit: aCommit 
	
	head := self newBranchNamed: aString commit: aCommit