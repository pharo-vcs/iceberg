tests - create repository
testCreateRepoOnTopOfGitFileTreeLoadedCode
	self scenarioCodeLoadedFromGitFileTreeDo: [
		| package |
		self assert: repository loadedPackages isNotEmpty.
		package := repository packageNamed: packageName. 

		self assert: repository loadedCode loadedVersions isNotEmpty.
		self assert: repository incomingCommits isEmpty.
		self assert: repository headCommit equals: repository loadedCode referenceCommit.

		self assert: package incomingCommits isEmpty.
	].
