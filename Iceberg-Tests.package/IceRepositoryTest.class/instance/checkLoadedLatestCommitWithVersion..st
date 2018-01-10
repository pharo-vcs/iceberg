auxiliar
checkLoadedLatestCommitWithVersion: 	loadedVersionNumber
	| loadedVersion |
	loadedVersion := (repository packageNamed: packageName) currentCommit.
	self assert: self currentCommitMessage equals: loadedVersion comment.
	self assert: loadedVersion commit id equals: self currentCommitId.
