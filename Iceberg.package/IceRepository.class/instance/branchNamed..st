API-branches
branchNamed: aName
	"Access a branch by name.
	Throws an IceBranchNotFound is the branch does not exist in the repository."
	
	^ self
		branchNamed: aName
		ifPresent: [ :branch | ^ branch ]
		ifAbsent:[ 
			IceBranchNotFound new
				branchName: aName;
				signal ]