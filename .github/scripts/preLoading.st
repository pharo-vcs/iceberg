#( 'BaselineOfLibGit' 'BaselineOfIceberg' ) do: [ :each | 
	(PackageOrganizer default packageNamed: each ifAbsent: [ nil ]) 
		ifNotNil: [ :aPackage | aPackage removeFromSystem ] ]
