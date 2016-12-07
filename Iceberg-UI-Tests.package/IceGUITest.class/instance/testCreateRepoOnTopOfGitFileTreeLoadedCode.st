tests
testCreateRepoOnTopOfGitFileTreeLoadedCode
	self scenarioCodeLoadedFromGitFileTreeDo: [
		repository loadedPackages do: [ :pkg |
			(IcePackageModel modelFor: pkg) status
		]
	].
		
