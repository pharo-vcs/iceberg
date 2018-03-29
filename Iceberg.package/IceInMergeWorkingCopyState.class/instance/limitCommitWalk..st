merging
limitCommitWalk: aCommitWalk

	self referenceCommits do: [ :each | each limitCommitWalk: aCommitWalk ]