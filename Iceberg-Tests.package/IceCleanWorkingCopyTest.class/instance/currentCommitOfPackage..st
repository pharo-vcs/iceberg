helpers
currentCommitOfPackage: aPackageName

	^ (repository workingCopy packageNamed: aPackageName) currentCommit