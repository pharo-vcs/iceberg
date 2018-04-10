API-branches
delete
	| found |
	found := self repositoryHandle lookupRemoteBranch: self name ifAbsent: [ nil ].
	self repositoryHandle deleteBranch: found