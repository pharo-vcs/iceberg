API-accessing
iceCommitFrom: aGitCommit
	"The type of 'aCommitish' depends on how each backend internal representation. "

	^ self commitFromGitCommit: aGitCommit