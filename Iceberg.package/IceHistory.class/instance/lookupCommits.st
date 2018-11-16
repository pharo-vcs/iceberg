history
lookupCommits
	
	| newCommitDictionary newCommits |
	newCommitDictionary := Dictionary new.
	newCommits := OrderedCollection new.
	commitish commitsDo: [ :each | | commit |
		commit := IceHistoryCommit commit: each history: self.
		newCommits add: commit.
		newCommitDictionary at: each id put: commit ].
	commitDictionary := newCommitDictionary.
	commits := newCommits.