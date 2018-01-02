operations
checkout
	
	super checkout
	"| newLocalBranch |
	repository branchNamed: self name ifPresent: [ :branch |
		^ branch checkout ].

	newLocalBranch := repository
		createBranch: self name
		inCommit: self commit.
	newLocalBranch checkout.
	^ newLocalBranch"