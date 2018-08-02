API-commits
revparse: aName

	self handleLibgitError: [ | gitCommit gitId |
		gitId := (self repositoryHandle revparse: aName) object id.
		gitCommit := LGitCommit of: self repositoryHandle fromId: gitId.
		^ self commitFromGitCommit: gitCommit ]