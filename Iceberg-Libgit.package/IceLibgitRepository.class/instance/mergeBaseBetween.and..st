API-accessing
mergeBaseBetween: aCommitId and: anotherCommitId
	
	self handleLibgitError: [ ^ (self repositoryHandle
			mergeBaseBetween: (LGitId fromHexString: aCommitId)
			and: (LGitId fromHexString: anotherCommitId)) hexString ]