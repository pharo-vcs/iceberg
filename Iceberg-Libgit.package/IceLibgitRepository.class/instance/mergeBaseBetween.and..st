accessing
mergeBaseBetween: aCommitId and: anotherCommitId
	^ (self repositoryHandle mergeBaseBetween: (LGitId fromHexString: aCommitId) and: (LGitId fromHexString: anotherCommitId))
		hexString