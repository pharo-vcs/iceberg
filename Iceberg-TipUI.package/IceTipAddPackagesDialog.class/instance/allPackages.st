accessing
allPackages
	^ RPackageOrganizer default packages
		asOrderedCollection 
		sort: [ :a :b | a name < b name ]