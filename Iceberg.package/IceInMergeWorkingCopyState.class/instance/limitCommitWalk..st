merging
limitCommitWalk: aCommitWalk

	mergeCommits do: [ :each | each limitCommitWalk: aCommitWalk ]