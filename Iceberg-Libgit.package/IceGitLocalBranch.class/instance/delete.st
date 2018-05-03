API-branches
delete
	repository handleLibgitError: [ | found |
		found := self repositoryHandle lookupLocalBranch: self name ifAbsent: [ nil ].
		self repositoryHandle deleteBranch: found ]