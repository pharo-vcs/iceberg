actions
merge: commitId
	self withRepoDo: [ :repo | 
		| remote myCommit theirCommit mergeBase |
		"Decide if we can fast-forward or we must do a real merge"
		myCommit := repo head object.
		theirCommit := LGitCommit of: repo fromHexString: commitId.
		mergeBase := repo mergeBaseBetween: myCommit id and: theirCommit id.
		
		(mergeBase = myCommit id)
			ifTrue: [ 
				"No need to merge, just fast-forward current HEAD"
				repo head resolve setTarget: theirCommit.
			]
			ifFalse: [
				| mergedIndex treeId signature |
				
				"Merge both commits"
				mergedIndex := myCommit merge: theirCommit.
				mergedIndex hasConflicts 
					ifTrue: [ 
						"Abort merge and signal for manual merge. 
						Index is not saved and repository will be discarded, 
						so no further action is needed to abort the merge" 
						IceMergeAborted signal 
					]
					ifFalse: [
						"Commit mergedIndex"
						signature := repo defaultSignature.
						treeId := mergedIndex writeTreeAndReturnOid.
			
						(LGitCommitBuilder of: repo)
							tree: (LGitTree of: repo fromId: treeId);
							message: 'Merge with ', commitId;
							parents: { myCommit. theirCommit };
							updateReference: repo head name;
							author: signature;
							committer: signature;
							writeCommit.		
					]
			]
	]