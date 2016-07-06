tests
testSaveSinglePackage
	| loadedVersion loadedVersionNumber |
	repository loadPackage: packageName.

	loadedVersion := (repository packageNamed: packageName) loadedVersion.
	loadedVersionNumber := (Smalltalk at: #Test) new versionNumber.
	self assert: (self currentCommitMessage endsWith: loadedVersionNumber asString).
	self assert: loadedVersion commitId equals: self currentCommitId.

	self saveNewVersion.
	
	loadedVersion := (repository packageNamed: packageName) latestVersion.
	loadedVersionNumber := (Smalltalk at: #Test) new versionNumber.
	self assert: (self currentCommitMessage endsWith: loadedVersionNumber asString).
	self assert: loadedVersion commitId equals: self currentCommitId.
