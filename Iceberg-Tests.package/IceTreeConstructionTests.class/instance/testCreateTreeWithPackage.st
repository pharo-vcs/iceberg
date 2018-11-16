tests
testCreateTreeWithPackage

	| tree importer |
	tree := IceNode new.
	importer := IceMCPackageImporter new
		package: (IcePackage named: 'MonticelloMocks' repository: nil);
		version: self;
		yourself.
	importer importOn: tree.
	
	self assert: (tree / 'MonticelloMocks') value isPackageDefinition.
	self assert: (tree / 'MonticelloMocks' / 'MCMockClassA') value isClassDefinition.
	self assert: (tree / 'MonticelloMocks' / 'MCMockClassA') value isMeta not.
	self assert: (tree / 'MonticelloMocks' / 'MCMockClassA' / 'a') value isMethodDefinition.	

	self assert: (tree / 'MonticelloMocks' / 'MCMockClassA class') value isClassDefinition.
	self assert: (tree / 'MonticelloMocks' / 'MCMockClassA class') value isMeta.
	self assert: (tree / 'MonticelloMocks' / 'MCMockClassA class' / 'cVar') value isMethodDefinition.
	
	self assert: (tree / 'MonticelloMocks' / 'MCSnapshotTest') value isExtensionDefinition.
	self assert: (tree / 'MonticelloMocks' / 'MCSnapshotTest' / 'mockClassExtension') value isMethodDefinition.