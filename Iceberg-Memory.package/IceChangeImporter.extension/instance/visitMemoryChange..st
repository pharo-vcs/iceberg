*Iceberg-Memory
visitMemoryChange: anIceMemoryChange 
	
	| importer |
	importer := IceMCPackageImporter new
		package: anIceMemoryChange package;
		version: version;
		yourself.
	^ importer importOn: parentNode