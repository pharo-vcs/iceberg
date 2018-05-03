API-commits
revparse: aName

	self handleLibgitError: [ | gitCommit gitId |
		gitId := (handle revparse: aName) object id.
		gitCommit := LGitCommit of: handle fromId: gitId.
		^ self commitFromGitCommit: gitCommit ]