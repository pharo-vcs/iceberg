API-loading
checkoutBranch: branchName
	"Convenience method to checkout all packages from a branch given a branch name"

	(self
		branchNamed: branchName
		ifAbsent: [
			self createBranch: branchName ]) checkout