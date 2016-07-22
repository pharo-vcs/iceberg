querying
lookupCommitsInCurrentBranch
	"Load versions from the real repository, latest first"
	| commits | 
	commits := OrderedCollection new.
	
	self commitsInCurrentBranchDo: [ :commit |
		commits add: (IceCommitInfo new
			commitId: commit id hexString;
			username: commit committer name;
			datetime: commit time asDateAndTime;
			parents: (commit parents collect: [ :parent | parent id hexString ]);
			comment: commit message
		).
	].

	^ commits reversed