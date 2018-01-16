API-commits
referenceCommit
	"Returns the single current loaded commit, if we are in a single commit state.
	Throw an exception otherwise"
	
	^ self workingCopyState referenceCommit