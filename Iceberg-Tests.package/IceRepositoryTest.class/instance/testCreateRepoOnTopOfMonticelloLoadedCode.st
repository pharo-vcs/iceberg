tests - create repository
testCreateRepoOnTopOfMonticelloLoadedCode
	self scenarioCodeLoadedFromMonticelloDo: [
		| package |
		self assert: repository loadedPackages isNotEmpty.
		package := repository packageNamed: packageName. 

		self assert: repository loadedCode loadedVersions isNotEmpty.
		self assert: repository incommingCommits isEmpty.
		self assert: repository headCommit equals: repository loadedCode referenceCommit.


		self shouldnt: [ package incommingCommits ] raise: Error.
		self assert: (package loadedVersionName matchesRegex: package name, '.*\.\d+').
		
		repository loadedPackages do: [ :pkg |
			IceRepositoriesBrowser statusFor: pkg
		]
	].

	"Exercise"
	"writableRepository := self package iceRepository.
	[
		writableRepository ensureLocalRepository.

		""Test""
		self assert: self defaultLocationForGithubClonedRepository exists.
		self assert: (self defaultLocationForGithubClonedRepository / '.git') exists.
		
		self assert: writableRepository currentBranch name equals: 'forBecomeWriteable'.
		self assert: writableRepository backend currentBranch equals: 'forBecomeWriteable'.
		
		writableRepository pull.
		self assert: ((Smalltalk at: #Test) canUnderstand: #forBecomeWritable)
	]
	ensure: [ writableRepository forget ]	"