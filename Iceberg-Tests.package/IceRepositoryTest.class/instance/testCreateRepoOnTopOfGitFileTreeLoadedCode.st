tests - create repository
testCreateRepoOnTopOfGitFileTreeLoadedCode
	self scenarioCodeLoadedFromGitFileTreeDo: [
		| package |
		self assert: repository loadedPackages isNotEmpty.
		package := repository packageNamed: packageName. 

		self assert: repository loadedCode loadedVersions isNotEmpty.
		self assert: repository incommingCommits isEmpty.
		self assert: repository headCommit equals: repository loadedCode referenceCommit.

		self assert: package incommingVersions isEmpty.
		
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