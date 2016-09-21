querying
lookupCommitsInBranch: branchName into: aCommitRegistry
	"Load versions from the real repository, latest first"
	| commits | 
	commits := OrderedCollection new.
	
	self commitsInBranch: branchName do: [ :commit |
		aCommitRegistry addCommit: 
			(IceCommitInfo new
				commitId: commit id hexString;
				username: commit committer name;
				datetime: commit time asDateAndTime;
				parentIds: (commit parents collect: [ :parent | parent id hexString ]);
				comment: commit message)].

	^ commits reversed