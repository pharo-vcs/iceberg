registry
registeredRepositoryIncludingPackage: aPackage 
	^ self registry 
		detect: [ :each | each includesPackageNamed: aPackage name ]
		ifNone: [ nil ]