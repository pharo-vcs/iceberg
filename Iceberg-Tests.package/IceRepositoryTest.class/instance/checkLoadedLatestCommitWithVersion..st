auxiliar
checkLoadedLatestCommitWithVersion: 	loadedVersionNumber
	| loadedVersion |
	loadedVersion := (repository packageNamed: packageName) loadedVersion.
	self assert: (self currentCommitMessage endsWith: loadedVersionNumber asString).
	self assert: loadedVersion commit id equals: self currentCommitId.
