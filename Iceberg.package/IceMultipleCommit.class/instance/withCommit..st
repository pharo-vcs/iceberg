intersection
withCommit: anIceGitCommit 
	
	(commits includes: anIceGitCommit)
		ifFalse: [
			^ IceMultipleCommit
				with: (commits copyWith: anIceGitCommit)
				repository: repository ].
	^ self