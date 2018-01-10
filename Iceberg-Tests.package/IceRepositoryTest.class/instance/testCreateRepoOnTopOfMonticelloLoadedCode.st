tests - create repository
testCreateRepoOnTopOfMonticelloLoadedCode
	self scenarioCodeLoadedFromMonticelloDo: [
		| package |
		self assert: repository loadedPackages isNotEmpty.
		package := repository packageNamed: packageName. 

		"since the package is from monticello, I have no reference commit"
		self assert: repository workingCopy referenceCommits isEmpty.
		
		"Since we cannot know what commit is loaded, everything is incoming"
		self assert: repository incomingCommits isNotEmpty.

		self assert: package packageState isForeignPackageState.
	].
