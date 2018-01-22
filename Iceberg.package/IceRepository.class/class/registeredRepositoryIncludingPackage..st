accessing
registeredRepositoryIncludingPackage: aPackage 
	^ self registry 
		detect: [ :each | each includesPackageNamed: aPackage ]
		ifNone: [ nil ]