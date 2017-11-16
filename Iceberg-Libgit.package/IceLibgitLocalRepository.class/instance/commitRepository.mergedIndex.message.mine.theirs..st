private merging
commitRepository: repo mergedIndex: mergedIndex message: aString mine: myCommit theirs: theirCommit
	"Commit mergedIndex"
	| signature treeId |
	
	signature := repo defaultSignature.
	treeId := mergedIndex writeTreeAndReturnOid.
	[ repo checkout_treeish: (LGitTree of: repo fromId: treeId) ]
	on: LGit_GIT_ECONFLICT 
	do: [ :e | e resignalAs: IceMergeAborted new ].
	
	(LGitCommitBuilder of: repo)
		tree: (LGitTree of: repo fromId: treeId);
		message: 'Merge with ' , aString;
		parents:{ myCommit. theirCommit };
		updateReference: repo head name;
		author: signature;
		committer: signature;
		writeCommit