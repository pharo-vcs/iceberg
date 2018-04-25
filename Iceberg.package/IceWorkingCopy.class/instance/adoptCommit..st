accessing
adoptCommit: aCommit

	| diff |
	self referenceCommit = aCommit
		ifTrue: [ ^ self ].
	
	self referenceCommit: aCommit.

	diff := IceDiff new
		sourceVersion: self;
		targetVersion: aCommit;
		buildFull.

	self loadedPackages do: [ :each |
		each beDirty: (diff includesPackageNamed: each name) ].