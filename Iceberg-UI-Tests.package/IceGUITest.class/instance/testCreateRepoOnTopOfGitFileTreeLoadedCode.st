tests
testCreateRepoOnTopOfGitFileTreeLoadedCode
	self skip. "This onei is incorrect. but I still don't know where it has to go... I suspend it 
	for now."
	self scenarioCodeLoadedFromGitFileTreeDo: [
		repository loadedPackages do: [ :pkg |
			(IcePackageModel modelFor: pkg) status
		]
	].
		
