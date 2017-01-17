tests
testCreateRepoOnTopOfMonticelloLoadedCode
	self scenarioCodeLoadedFromMonticelloDo: [
		repository loadedPackages do: [ :pkg |
			(IcePackageModel modelFor: pkg) status
		]
	].
