tests
testCreateDirectoryWithPackage

	| tree importer child |
	tree := IceNode new.
	child := tree addChild: (IceDirectoryDefinition named: 'src').
	importer := IceMCPackageImporter new
		package: (IcePackage named: 'MonticelloMocks' repository: nil);
		version: self;
		yourself.
	importer importOn: child.
	
	self assert: (tree / 'src' / 'MonticelloMocks') value isPackageDefinition.
	self assert: (tree / 'src' / 'MonticelloMocks' / 'MCMockClassA') value isClassDefinition.
	self assert: (tree / 'src' / 'MonticelloMocks' / 'MCMockClassA') value isMeta not.
	self assert: (tree / 'src' / 'MonticelloMocks' / 'MCMockClassA' / 'a') value isMethodDefinition.	

	self assert: (tree / 'src' / 'MonticelloMocks' / 'MCMockClassA class') value isClassDefinition.
	self assert: (tree / 'src' / 'MonticelloMocks' / 'MCMockClassA class') value isMeta.
	self assert: (tree / 'src' / 'MonticelloMocks' / 'MCMockClassA class' / 'cVar') value isMethodDefinition.
	
	self assert: (tree / 'src' / 'MonticelloMocks' / 'MCSnapshotTest') value isExtensionDefinition.
	self assert: (tree / 'src' / 'MonticelloMocks' / 'MCSnapshotTest' / 'mockClassExtension') value isMethodDefinition.