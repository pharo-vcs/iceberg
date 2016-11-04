private
iceCommitFrom: aLGitCommit 
	^ self frontend
		commitAt: (self commitIdFrom: aLGitCommit )
		ifAbsentPut: [ self class parseCommitInfo: aLGitCommit ]