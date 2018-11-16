API-branches
createBranch: branchName
	"Creates a new branch from #headCommit and switch to it"
	
	^ self createBranch: branchName inCommit: self headCommit