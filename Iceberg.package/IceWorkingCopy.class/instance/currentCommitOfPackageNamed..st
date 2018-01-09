accessing-monticello
currentCommitOfPackageNamed: aString 
	
	| packageCommits |
	packageCommits := self currentCommitsOfPackageNamed: aString.
	self assert: packageCommits size = 1.
	^ packageCommits first