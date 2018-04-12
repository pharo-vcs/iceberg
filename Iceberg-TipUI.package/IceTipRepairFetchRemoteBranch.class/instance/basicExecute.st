executing
basicExecute
	"Fetching remotes is necessary in case the current image commit is not in the repository.
	Could be optimized"
	| wc |
	
	self fetchAllRemotes.
	
	wc := self repository workingCopy.
	wc referenceCommit resolveCommitOnWorkingCopy: wc