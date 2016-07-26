querying
lookupCommitsInBranch: branchName
	"Load versions from the real repository, latest first"
	| commits | 
	commits := OrderedCollection new.
	
	self commitsInBranch: branchName do: [ :commit |
		commits add: (IceCommitInfo new
			commitId: commit id hexString;
			username: commit committer name;
			datetime: commit time asDateAndTime;
			parentIds: (commit parents collect: [ :parent | parent id hexString ]);
			comment: commit message
		).
	].

	^ commits reversed