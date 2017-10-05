script
preLoadPharo60
	Iceberg enableMetacelloIntegration: false.
	(Smalltalk classNamed: #MetacelloPharo30Platform) 
		ifNotNil: #select
		ifNil: [ (Smalltalk classNamed: #MetacelloPharoPlatform) select ].
	#(
		'Iceberg-UI' 
		'Iceberg-Plugin-GitHub' 
		'Iceberg-Plugin' 
		'Iceberg-Metacello-Integration' 
		'Iceberg-Libgit' 
		'Iceberg' 
		'LibGit-Core' 
		'BaselineOfLibGit') 
	do: [ :each | each asPackage removeFromSystem ].
		
	