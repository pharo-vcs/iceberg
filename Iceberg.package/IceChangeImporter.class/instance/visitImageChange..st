visiting
visitImageChange: anIceImageChange 

	| importer |
	importer := IceMCPackageImporter new
		package: anIceImageChange package;
		version: version;
		yourself.
	^ importer importOn: (self ensureSourceCodeParentNodeIn: parentNode)