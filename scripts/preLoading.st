"Remove iceberg from system (so I can reload it)"
MetacelloPharoPlatform select.
#(
	'BaselineOfTonel'
	'BaselineOfLibGit'
	'BaselineOfIceberg'
	'Iceberg-UI' 
	'Iceberg-Plugin-GitHub' 
	'Iceberg-Plugin' 
	'Iceberg-Metacello-Integration' 
	'Iceberg-Libgit-Tonel' 
	'Iceberg-Libgit-Filetree' 
	'Iceberg-Libgit' 
	'Iceberg' 
	'LibGit-Core') 
do: [ :each | (each asPackageIfAbsent: [ nil ]) ifNotNil: #removeFromSystem ].