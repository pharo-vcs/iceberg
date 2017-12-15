merging
mergeWithBranch: anIceMemoryRemoteBranch 
	
	"Ensure that all commits of the remote branch are in the local branch mc repository"
	anIceMemoryRemoteBranch commits do: [ :each |
		repository branchRepository
			versionWithInfo: each mcCommit info
			ifAbsent: [ repository branchRepository storeVersion: each mcCommit ] ].
		
	commit := self commit mergeWith: anIceMemoryRemoteBranch commit