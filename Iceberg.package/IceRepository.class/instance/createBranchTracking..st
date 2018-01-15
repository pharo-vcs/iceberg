API-branches
createBranchTracking: aString 
	
	| commit |
	commit := (self pullRemote remoteBranchNamed: aString) commit.
	^ self createBranch: aString inCommit: commit