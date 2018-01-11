accessing
commit
	self repository withRepoDo: [ :repo | 
			| gitCommit gitId |
			gitId := (repo lookupRemoteBranch: self name) targetId.
			gitCommit := LGitCommit of: repo fromId: gitId.
			^ self repository iceCommitFrom: gitCommit ]