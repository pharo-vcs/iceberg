script
unloadIcebergPackages
	#(
		'Iceberg-UI' 
		'Iceberg-Plugin-GitHub' 
		'Iceberg-Plugin' 
		'Iceberg-Metacello-Integration' 
		'Iceberg-Libgit' 
		'Iceberg' 
		'LibGit-Core' ) 
	do: [ :each | 
		(RPackageOrganizer default includesPackageNamed: each)
			ifTrue: [ each asPackage removeFromSystem ] ]