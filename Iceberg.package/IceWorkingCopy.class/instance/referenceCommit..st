accessing
referenceCommit: aCommit

	self loadedPackages do: [ :each | self updatePackage: each toCommit: aCommit ]