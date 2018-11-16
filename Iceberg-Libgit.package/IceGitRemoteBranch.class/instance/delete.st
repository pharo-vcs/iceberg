API-branches
delete
	
	repository handleLibgitError: [ | found |
		found := self repositoryHandle lookupRemoteBranch: self name ifAbsent: [ nil ].
		self repositoryHandle deleteBranch: found ]