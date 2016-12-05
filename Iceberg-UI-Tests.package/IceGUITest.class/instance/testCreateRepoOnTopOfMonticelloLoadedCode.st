tests
testCreateRepoOnTopOfMonticelloLoadedCode
	(self respondsTo: #scenarioCodeLoadedFromMonticelloDo:) ifFalse: [ self skip ].
		
	self scenarioCodeLoadedFromMonticelloDo: [
		repository loadedPackages do: [ :pkg |
			(IcePackageModel modelFor: pkg) status
		]
	].
