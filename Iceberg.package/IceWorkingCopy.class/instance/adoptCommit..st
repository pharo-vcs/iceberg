accessing
adoptCommit: aCommit

	| oldCommit |
	self referenceCommit = aCommit
		ifTrue: [ ^ self ].

	oldCommit := self referenceCommit.
	self referenceCommit: aCommit.
	
	"If both commits are from a different class but still have the same ID, we do not need to force the calculation of dirty packages.
	This is required for the case when a working copy existed with an unknown comit but it was not linked to a repository"
	(oldCommit isNoCommit not and: [ oldCommit id = aCommit id ])
		ifFalse: [ self forceCalculateDirtyPackages. ]