querying
latestVersionForPackage: package
	^ (self versionsFor: package)
		ifNotEmpty: [ :versions | 
			| latest | 
			latest := versions detectMax: #versionNumber.
			repository versionFromFileNamed: latest]
		ifEmpty: [ self error: 'Package ', package name, ' is not found in repository ', self printString ]
