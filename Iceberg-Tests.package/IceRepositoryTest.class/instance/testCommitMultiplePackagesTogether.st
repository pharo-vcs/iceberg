tests - commit
testCommitMultiplePackagesTogether
	| oldCommits | 
	oldCommits := repository branch commits size.
	self scenarioTwoDirtyPackages.
	
	repository commitWithMessage: 'Committing two packages together'.
	self assert: repository branch commits size equals: oldCommits + 1.
	self assert: repository workingCopy referenceCommit equals: repository headCommit.

	{ packageName. otherPackageName } do: [ :name | | package |
		package := repository packageNamed: name.
		self assert: package currentCommit equals: repository headCommit.
	]