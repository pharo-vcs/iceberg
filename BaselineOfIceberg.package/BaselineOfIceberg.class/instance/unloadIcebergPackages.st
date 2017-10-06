script
unloadIcebergPackages
	#(
		'Iceberg-UI' 
		'Iceberg-Plugin-GitHub' 
		'Iceberg-Plugin' 
		'Iceberg-Metacello-Integration' 
		'Iceberg-Libgit-Tonel' 
		'Iceberg-Libgit-Filetree' 
		'Iceberg-Libgit' 
		'Iceberg' 
		'LibGit-Core') 
	do: [ :each | 
		(RPackageOrganizer default includesPackageNamed: each)
			ifTrue: [ 
				Transcript crShow: 'Unload ', each.
				each asPackage removeFromSystem ] ]