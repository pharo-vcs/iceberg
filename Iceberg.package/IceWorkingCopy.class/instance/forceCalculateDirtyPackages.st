API-changes
forceCalculateDirtyPackages

	| diff |
	diff := IceDiff new
		sourceVersion: self;
		targetVersion: self referenceCommit;
		buildFull.

	self loadedPackages do: [ :each |
		each beDirty: (diff includesPackageNamed: each name) ].