accessing
commit
	| gitCommit gitId |
	gitId := (self repositoryHandle lookupLocalBranch: self name) targetId.
	gitCommit := LGitCommit of: self repositoryHandle fromId: gitId.
	^ self repository commitFromGitCommit: gitCommit