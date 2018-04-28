helpers
currentCommitOfPackage: aPackageName

	^ (self repository workingCopy packageNamed: aPackageName) currentCommit