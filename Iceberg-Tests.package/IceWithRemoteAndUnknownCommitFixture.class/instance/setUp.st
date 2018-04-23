initialization
setUp
	super setUp.

	"Set a commit that is known in the remote repository but not in the local one"
	self repository workingCopy referenceCommit: (self repository lookupCommit: remoteRepository headCommit id)