history
lookupCommits
	
	| newCommitDictionary |
	newCommitDictionary := Dictionary new.
	commitish commitsDo: [ :each |
		newCommitDictionary at: each id put: (IceHistoryCommit commit: each history: self) ].
	commitDictionary := newCommitDictionary