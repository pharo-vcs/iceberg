tests
testCreateTreeWithPackage

	| tree importer |
	tree := IceNode new.
	importer := IceMCPackageImporter new
		package: (IcePackage named: 'MonticelloMocks' repository: nil);
		version: self;
		yourself.
		
	importer importOn: tree.
	
	self assert: (tree / 'MonticelloMocks') isPackageDefinition.
	self assert: (tree / 'MonticelloMocks' / 'MCMockClassA') isClassDefinition.
	self assert: (tree / 'MonticelloMocks' / 'MCMockClassA') isMeta not.
	self assert: (tree / 'MonticelloMocks' / 'MCMockClassA' / 'a') isMethodDefinition.	

	self assert: (tree / 'MonticelloMocks' / 'MCMockClassA class') isClassDefinition.
	self assert: (tree / 'MonticelloMocks' / 'MCMockClassA class') isMeta.
	self assert: (tree / 'MonticelloMocks' / 'MCMockClassA class' / 'cVar') isMethodDefinition.
	
	self assert: (tree / 'MonticelloMocks' / 'MCSnapshotTest') isExtensionDefinition.
	self assert: (tree / 'MonticelloMocks' / 'MCSnapshotTest' / 'mockClassExtension') isMethodDefinition.