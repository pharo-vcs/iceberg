branches
switchToBranchNamed: aString 
	
	head := self branchNamed: aString.
	^ head