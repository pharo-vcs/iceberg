tests - create repository
testCreateRepoOnTopOfMonticelloLoadedCode
	self scenarioCodeLoadedFromMonticelloDo: [
		| package |
		self assert: repository loadedPackages isNotEmpty.
		package := repository packageNamed: packageName. 

		self assert: repository loadedCode loadedVersions isNotEmpty.
		self assert: repository incomingCommits isEmpty.
		self assert: repository headCommit equals: repository loadedCode referenceCommit.

		self shouldnt: [ package incomingCommits ] raise: Error.
		self assert: (package loadedVersion description matchesRegex: package name, '.*\.\d+').
	].
