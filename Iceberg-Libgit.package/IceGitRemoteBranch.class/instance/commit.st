accessing
commit
	| gitCommit gitId |
	gitId := (self repositoryHandle lookupRemoteBranch: self name) targetId.
	gitCommit := LGitCommit of: self repositoryHandle fromId: gitId.
	^ self repository commitFromGitCommit: gitCommit