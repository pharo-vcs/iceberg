API-branches
createNewBranch: branchName
	"Creates a new branch starting on HEAD commit and switch to it"

	self createBranch: branchName inCommit: self headCommit