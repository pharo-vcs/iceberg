API-commits
revparse: aName

	| gitCommit gitId |
	gitId := (handle revparse: aName) id.
	gitCommit := LGitCommit of: handle fromId: gitId.
	^ self commitFromGitCommit: gitCommit