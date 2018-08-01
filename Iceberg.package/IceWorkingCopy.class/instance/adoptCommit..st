accessing
adoptCommit: aCommit

	self referenceCommit = aCommit
		ifTrue: [ ^ self ].

	self referenceCommit: aCommit.
	self forceCalculateDirtyPackages.