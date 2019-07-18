Class {
	#name : #IceTraitsCherryPickingTest,
	#superclass : #IceCherryPickingTest,
	#category : #'Iceberg-Tests-Cherrypicking'
}

{ #category : #tests }
IceTraitsCherryPickingTest >> testAddTraitDependingInATrait [
	
	| commitToCherryPick diff |
		
	self repository createBranch: 'b2'.

	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy 
		createTrait: 'TestTrait'
		inPackage: self packageName1 asSymbol.
	self repository commitWithMessage: 'Adding a TestTrait'.

	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy 
		createTrait: 'TestTrait2'
		inPackage: self packageName1 asSymbol
		with: [:class |
			| composition transformations | 
			composition := RG2TraitCompositionDefinition parent: class.
			transformations := RG2TraitCompositionVisitor new parse: 'TestTrait' for: composition.
			class traitComposition: composition.
			transformations do: [ :each |
				composition addTransformation: each ]].
	
	self repository commitWithMessage: 'Adding a trait using a trait'.

	commitToCherryPick := fixture repository head.

	self repository checkoutBranch: 'master'.
	diff := fixture repository cherryPickFrom: commitToCherryPick.

	self assert: diff codeSubdirectoryNode children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName1) children size equals: 2.

	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestTrait2') value isAddition.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestTrait2') children size equals: 0.

	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestTrait') value isAddition.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestTrait') children size equals: 0.

]
