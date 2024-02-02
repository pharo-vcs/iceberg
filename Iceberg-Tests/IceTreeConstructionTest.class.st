Class {
	#name : 'IceTreeConstructionTest',
	#superclass : 'TestCase',
	#category : 'Iceberg-Tests-Changes',
	#package : 'Iceberg-Tests',
	#tag : 'Changes'
}

{ #category : 'helpers' }
IceTreeConstructionTest >> includesPackageNamed: aString [ 
	
	^ aString = 'MonticelloMocks'
]

{ #category : 'tests' }
IceTreeConstructionTest >> newWorkingCopy [

	^ IceWorkingCopy repository: IceMemoryRepository new
]

{ #category : 'helpers' }
IceTreeConstructionTest >> snapshotForPackage: anIcePackage [ 
	
	^ anIcePackage name asPackage mcWorkingCopy snapshot
]

{ #category : 'tests' }
IceTreeConstructionTest >> testCreateDirectoryWithDirectory [

	| tree child |
	tree := IceNode new.
	child := tree addChild: (IceDirectoryDefinition named: 'src').
	child  addChild: (IceDirectoryDefinition named: 'tmp').
	
	self assert: (tree / 'src' / 'tmp') value isDirectoryDefinition
]

{ #category : 'tests' }
IceTreeConstructionTest >> testCreateDirectoryWithFile [

	| tree child |
	tree := IceNode new.
	child := tree addChild: (IceDirectoryDefinition named: 'src').
	child  addChild: (IceFileDefinition named: 'tmp').
	
	self assert: (tree / 'src' / 'tmp') value isFileDefinition
]

{ #category : 'tests' }
IceTreeConstructionTest >> testCreateDirectoryWithPackage [

	| tree importer child |
	tree := IceNode new.
	child := tree addChild: (IceDirectoryDefinition named: 'src').
	importer := IceMCPackageImporter new
		            package: (IcePackage
				             named: 'MonticelloMocks'
				             repository: self newWorkingCopy repository);
		            version: self;
		            yourself.
	importer importOn: child.

	self assert:
		(tree / 'src' / 'MonticelloMocks') value isPackageDefinition.
	self assert:
		(tree / 'src' / 'MonticelloMocks' / 'MCMockClassA') value
			isClassDefinition.
	self assert:
		(tree / 'src' / 'MonticelloMocks' / 'MCMockClassA') value isMeta not.
	self assert:
		(tree / 'src' / 'MonticelloMocks' / 'MCMockClassA' / 'a') value
			isMethodDefinition.

	self assert:
		(tree / 'src' / 'MonticelloMocks' / 'MCMockClassA class') value
			isClassDefinition.
	self assert:
		(tree / 'src' / 'MonticelloMocks' / 'MCMockClassA class') value
			isMeta.
	self assert:
		(tree / 'src' / 'MonticelloMocks' / 'MCMockClassA class' / 'cVar')
			value isMethodDefinition.

	self assert:
		(tree / 'src' / 'MonticelloMocks' / 'MCSnapshotTest') value
			isExtensionDefinition.
	self assert: (tree / 'src' / 'MonticelloMocks' / 'MCSnapshotTest'
		 / 'mockClassExtension') value isMethodDefinition
]

{ #category : 'tests' }
IceTreeConstructionTest >> testCreateTreeWithDirectory [

	| tree |
	tree := IceNode new.
	tree addChild: (IceDirectoryDefinition named: 'src').
	
	self assert: (tree / 'src') value isDirectoryDefinition
]

{ #category : 'tests' }
IceTreeConstructionTest >> testCreateTreeWithFile [

	| tree |
	tree := IceNode new.
	tree addChild: (IceFileDefinition named: 'Readme.md').
	
	self assert: (tree / 'Readme.md') value isFileDefinition
]

{ #category : 'tests' }
IceTreeConstructionTest >> testCreateTreeWithPackage [

	| tree importer workingCopy |
	tree := IceNode new.
	workingCopy := self newWorkingCopy.
	workingCopy addPackageNamed: 'MonticelloMocks'.
	importer := IceMCPackageImporter new
		            package: (workingCopy packageNamed: 'MonticelloMocks');
		            version: self;
		            yourself.
	importer importOn: tree.

	self assert: (tree / 'MonticelloMocks') value isPackageDefinition.
	self assert:
		(tree / 'MonticelloMocks' / 'MCMockClassA') value isClassDefinition.
	self assert:
		(tree / 'MonticelloMocks' / 'MCMockClassA') value isMeta not.
	self assert: (tree / 'MonticelloMocks' / 'MCMockClassA' / 'a') value
			isMethodDefinition.

	self assert: (tree / 'MonticelloMocks' / 'MCMockClassA class') value
			isClassDefinition.
	self assert:
		(tree / 'MonticelloMocks' / 'MCMockClassA class') value isMeta.
	self assert:
		(tree / 'MonticelloMocks' / 'MCMockClassA class' / 'cVar') value
			isMethodDefinition.

	self assert: (tree / 'MonticelloMocks' / 'MCSnapshotTest') value
			isExtensionDefinition.
	self assert:
		(tree / 'MonticelloMocks' / 'MCSnapshotTest' / 'mockClassExtension')
			value isMethodDefinition
]

{ #category : 'tests' }
IceTreeConstructionTest >> testEmptyTreeIsRootNode [

	| tree |
	tree := IceNode value: IceRootDefinition new.
	
	self assert: tree value isRootDefinition
]
