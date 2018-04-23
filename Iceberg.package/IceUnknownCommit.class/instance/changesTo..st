API-changes
changesTo: aCommitish

	aCommitish = self
		ifTrue: [ ^ #() ].
	^ aCommitish changesFromNoCommit: self