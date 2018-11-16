API-branches
remoteBranchNamed: aString
	"Access a remote branch by name.
	Throws an IceBranchNotFound is the branch does not exist in the repository."
	
	^ self
		remoteBranchNamed: aString
		ifPresent: [ :branch | ^ branch ]
		ifAbsent: [ IceBranchNotFound new
			branchName: aString;
			signal ]