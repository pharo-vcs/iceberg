private pulling
pullRepository: repo merge: myCommit with: theirCommit
	| mergedIndex treeId signature |
			
	"Merge both commits"
	mergedIndex := myCommit merge: theirCommit.
	
	"Commit index"
	signature := repo defaultSignature.
	treeId := mergedIndex writeTreeAndReturnOid.

	(LGitCommitBuilder of: repo)
		tree: (LGitTree of: repo fromId: treeId);
		message: 'Merge with ', repo head upstream name;
		parents: { myCommit. theirCommit };
		updateReference: repo head name;
		author: signature;
		committer: signature;
		writeCommit