tests
testCreateDirectoryWithPackage

	| tree srcDirectory importer |
	tree := IceNode new.
	srcDirectory := (tree ensureDirectoryNamed: 'src').
	importer := IceMCPackageImporter new
		package: (IcePackage named: 'MonticelloMocks' repository: nil);
		version: self;
		yourself.
		
	importer importOn: srcDirectory.
	
	self assert: (tree / 'src' / 'MonticelloMocks') isPackageNode.
	self assert: (tree / 'src' / 'MonticelloMocks' / 'MCMockClassA') isClassDefinition.
	self assert: (tree / 'src' / 'MonticelloMocks' / 'MCMockClassA') isMeta not.
	self assert: (tree / 'src' / 'MonticelloMocks' / 'MCMockClassA' / 'a') isMethodDefinition.	

	self assert: (tree / 'src' / 'MonticelloMocks' / 'MCMockClassA class') isClassDefinition.
	self assert: (tree / 'src' / 'MonticelloMocks' / 'MCMockClassA class') isMeta.
	self assert: (tree / 'src' / 'MonticelloMocks' / 'MCMockClassA class' / 'cVar') isMethodDefinition.
	
	self assert: (tree / 'src' / 'MonticelloMocks' / 'MCSnapshotTest') isExtensionDefinition.
	self assert: (tree / 'src' / 'MonticelloMocks' / 'MCSnapshotTest' / 'mockClassExtension') isMethodDefinition.