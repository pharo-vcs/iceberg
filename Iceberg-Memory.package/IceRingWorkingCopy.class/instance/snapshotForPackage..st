actions
snapshotForPackage: aPackage

	^ (ringEnvironment ensurePackageNamed: aPackage name) asMCSnapshot.