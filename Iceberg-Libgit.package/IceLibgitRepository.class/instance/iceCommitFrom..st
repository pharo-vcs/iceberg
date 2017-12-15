accessing
iceCommitFrom: aCommitish
	"The type of 'aCommitish' depends on how each backend internal representation. "
	^ self
		commitAt: (self commitIdFrom: aCommitish )
		ifAbsentPut: [ self commitFromGitCommit: aCommitish ]