building
ensurePackageFromDirectory: aFileReference inParentNode: aParentNode
	
	| importer packageName package |
	
	packageName := version writerClass packageNameFromDirectory: aFileReference.
	
	"Package already exists"
	(aParentNode includesKey: packageName)
		ifTrue: [ ^ self ].
	
	package := IcePackage
		named: packageName
		repository: self repository.
	
	importer := IceMCPackageImporter new
		package: package;
		version: version;
		yourself.
	^ importer importOn: aParentNode