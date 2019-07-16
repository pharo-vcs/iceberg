Class {
	#name : #IceCherryPickingTest,
	#superclass : #IceAbstractTestCase,
	#category : #'Iceberg-Tests-Cherrypicking'
}

{ #category : #running }
IceCherryPickingTest >> newFixture [

	^ IceBasicCherryPickingFixture inGit
]

{ #category : #tests }
IceCherryPickingTest >> testAddClassDependingInATrait [
	
	| commitToCherryPick diff |
		
	self repository createBranch: 'b2'.

	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy 
		createTrait: 'TestTrait'
		inPackage: self packageName1 asSymbol.
	self repository commitWithMessage: 'Adding a TestTrait'.

	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy 
		createClass: 'TestClass2' 
		inPackage: self packageName1 asSymbol 
		with: [:class |
			| composition transformations | 
			composition := RG2TraitCompositionDefinition parent: class.
			transformations := RG2TraitCompositionVisitor new parse: 'TestTrait' for: composition.
			class traitComposition: composition.
			transformations do: [ :each |
				composition addTransformation: each ]].
	
	self repository commitWithMessage: 'Adding a class using a trait'.

	commitToCherryPick := fixture repository head.

	self repository checkoutBranch: 'master'.
	diff := fixture repository cherryPickFrom: commitToCherryPick.

	self assert: diff codeSubdirectoryNode children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName1) children size equals: 2.

	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestClass2') value isAddition.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestClass2') children size equals: 0.

	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestTrait') value isAddition.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestTrait') children size equals: 0.

]

{ #category : #tests }
IceCherryPickingTest >> testAddClassDependingInATraitWithComposition [
	
	| commitToCherryPick diff |
		
	self repository createBranch: 'b2'.

	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy 
		createTrait: 'TestTrait'
		inPackage: self packageName1 asSymbol.
	self repository commitWithMessage: 'Adding a TestTrait'.

	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy 
		createClass: 'TestClass2'
		inPackage: self packageName1 asSymbol
		with: [:class |
			| composition transformations| 
			composition := RG2TraitCompositionDefinition parent: class.
			transformations := RG2TraitCompositionVisitor new parse: 'TestTrait - {#hello. #world}' for: composition.

			class traitComposition: composition.

			transformations do: [ :each |
				composition addTransformation: each ].
			].
	
	self repository commitWithMessage: 'Adding a trait using a trait'.

	commitToCherryPick := fixture repository head.

	self repository checkoutBranch: 'master'.
	diff := fixture repository cherryPickFrom: commitToCherryPick.

	self assert: diff codeSubdirectoryNode children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName1) children size equals: 2.

	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestClass2') value isAddition.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestClass2') children size equals: 0.

	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestTrait') value isAddition.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestTrait') children size equals: 0.

]

{ #category : #tests }
IceCherryPickingTest >> testAddClassSideMethodInExistingClass [
	
	| commitToCherryPick diff |
		
	self repository createBranch: 'b2'.
	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy createMethod: 'm1 ^42' inClass: 'TestClass' isMeta: true.
	self repository commitWithMessage: 'Adding Method'.
	commitToCherryPick := fixture repository head.

	self repository checkoutBranch: 'master'.
	diff := fixture repository cherryPickFrom: commitToCherryPick.

	self assert: diff codeSubdirectoryNode children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName1) children size equals: 1.

	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestClass class') value isAddition.

	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestClass class' / 'm1') value isAddition.

]

{ #category : #tests }
IceCherryPickingTest >> testAddClassUsingASharedPool [
	
	| commitToCherryPick diff |
		
	self repository createBranch: 'b2'.

	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy 
		createClass: 'TestSharedPool' 
		inPackage: self packageName1 asSymbol 
		with: [:class | class superclass: (class environment ask behaviorNamed: #SharedPool)].
	self repository commitWithMessage: 'Adding a Shared Pool'.

	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy 
		createClass: 'TestClass2' 
		inPackage: self packageName1 asSymbol 
		with: [:class | class sharedPools: #(TestSharedPool)  ].
	self repository commitWithMessage: 'Adding a class using sharedpools'.

	commitToCherryPick := fixture repository head.

	self repository checkoutBranch: 'master'.
	diff := fixture repository cherryPickFrom: commitToCherryPick.

	self assert: diff codeSubdirectoryNode children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName1) children size equals: 2.

	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestClass2') value isAddition.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestClass2') children size equals: 0.

	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestSharedPool') value isAddition.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestSharedPool') children size equals: 0.

]

{ #category : #tests }
IceCherryPickingTest >> testAddClassWithSuperclassAsDependency [
	
	| commitToCherryPick diff |
		
	self repository createBranch: 'b2'.

	self repository workingCopy createClass: #A inPackage: self packageName1 asSymbol.
	self repository workingCopy createClass: #C inPackage: self packageName1 asSymbol.
	self repository commitWithMessage: 'Adding 2 classes'.

	self repository workingCopy createClass: #B inPackage: self packageName1 asSymbol 
		with: [ :class | class superclass: (class environment ask behaviorNamed: #A) ].

	self repository commitWithMessage: 'Adding a subclass of A'.
	commitToCherryPick := self repository head.

	self repository checkoutBranch: 'master'.
	diff := fixture repository cherryPickFrom: commitToCherryPick.

	self assert: diff codeSubdirectoryNode children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName1) children size equals: 2.
	self should: [diff codeSubdirectoryNode / self packageName1 / 'C'] raise: NotFound .

	self assert: (diff codeSubdirectoryNode / self packageName1 / 'A') value definition isClassDefinition.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'A') value isAddition.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'B') value isAddition.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'B') value definition isClassDefinition.

]

{ #category : #tests }
IceCherryPickingTest >> testAddClassWithoutDependencies [
	
	| commitToCherryPick diff |
		
	self repository createBranch: 'b2'.
	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy createClass: 'TestClass2' inPackage: self packageName1 asSymbol.
	self repository commitWithMessage: 'Adding Test Class'.
	commitToCherryPick := self repository head.

	self repository checkoutBranch: 'master'.
	diff := fixture repository cherryPickFrom: commitToCherryPick.

	self assert: diff codeSubdirectoryNode children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName1) children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestClass2') value isAddition.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestClass2') value definition isClassDefinition.

]

{ #category : #tests }
IceCherryPickingTest >> testAddExtensionMethodInExistingClass [
	
	| commitToCherryPick diff |
		
	self repository createBranch: 'b2'.
	self repository workingCopy addPackageNamed: self packageName2.
	self repository workingCopy createMethod: 'm1 ^42' extendingClass: 'TestClass' inPackage: self packageName2.
	self repository commitWithMessage: 'Adding extension method'.
	commitToCherryPick := fixture repository head.

	self repository checkoutBranch: 'master'.
	diff := fixture repository cherryPickFrom: commitToCherryPick.

	self assert: diff codeSubdirectoryNode children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName2) children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName2 / 'TestClass') value isAddition.
	self assert: (diff codeSubdirectoryNode / self packageName2 / 'TestClass' / 'm1') value isAddition.

]

{ #category : #tests }
IceCherryPickingTest >> testAddExtensionMethodInExistingTrait [
	
	| commitToCherryPick diff |
		
	self repository createBranch: 'b2'.
	self repository workingCopy addPackageNamed: self packageName2.
	self repository workingCopy createMethod: 'm1 ^42' extendingClass: 'TestTraitInitial' inPackage: self packageName2.

	self repository commitWithMessage: 'Adding extension method'.
	commitToCherryPick := fixture repository head.

	self repository checkoutBranch: 'master'.
	diff := fixture repository cherryPickFrom: commitToCherryPick.

	self assert: diff codeSubdirectoryNode children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName2) children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName2 / 'TestTraitInitial') value isAddition.
	self assert: (diff codeSubdirectoryNode / self packageName2 / 'TestTraitInitial' / 'm1') value isAddition.

]

{ #category : #tests }
IceCherryPickingTest >> testAddMethodInClassAsDependency [
	
	| commitToCherryPick diff |
		
	self repository createBranch: 'b2'.

	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy createClass: 'TestClass2' inPackage: self packageName1 asSymbol.
	self repository commitWithMessage: 'Adding test class'.

	self repository workingCopy addPackageNamed: self packageName1.	
	self repository workingCopy createMethod: 'm1 ^42' inClass: 'TestClass2'.

	self repository commitWithMessage: 'Adding Method'.
	commitToCherryPick := fixture repository head.

	self repository checkoutBranch: 'master'.
	diff := fixture repository cherryPickFrom: commitToCherryPick.

	self assert: diff codeSubdirectoryNode children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName1) children size equals: 1.

	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestClass2') value isAddition.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestClass2') children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestClass2' / 'm1') value isAddition.

]

{ #category : #tests }
IceCherryPickingTest >> testAddMethodInExistingClass [
	
	| commitToCherryPick diff |
		
	self repository createBranch: 'b2'.
	self repository workingCopy addPackageNamed: self packageName1.	
	self repository workingCopy createMethod: 'm1 ^42' inClass: 'TestClass'.
	self repository commitWithMessage: 'Adding Method'.
	commitToCherryPick := fixture repository head.

	self repository checkoutBranch: 'master'.
	diff := fixture repository cherryPickFrom: commitToCherryPick.

	self assert: diff codeSubdirectoryNode children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName1) children size equals: 1.

	self deny: (diff codeSubdirectoryNode / self packageName1 / 'TestClass') value isModification.
	self deny: (diff codeSubdirectoryNode / self packageName1 / 'TestClass') value isAddition.

	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestClass' / 'm1') value isAddition.

]

{ #category : #tests }
IceCherryPickingTest >> testAddMethodInExistingTrait [
	
	| commitToCherryPick diff |
		
	self repository createBranch: 'b2'.

	self repository workingCopy addPackageNamed: self packageName1.	
	self repository workingCopy createMethod: 'm1 ^42' inClass: 'TestTraitInitial'.
	self repository commitWithMessage: 'Adding Method'.
	commitToCherryPick := fixture repository head.

	self repository checkoutBranch: 'master'.
	diff := fixture repository cherryPickFrom: commitToCherryPick.

	self assert: diff codeSubdirectoryNode children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName1) children size equals: 1.

	self deny: (diff codeSubdirectoryNode / self packageName1 / 'TestTraitInitial') value isModification.
	self deny: (diff codeSubdirectoryNode / self packageName1 / 'TestTraitInitial') value isAddition.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestTraitInitial') children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestTraitInitial' / 'm1') value isAddition.

]

{ #category : #tests }
IceCherryPickingTest >> testAddMethodInTraitAsDependency [
	
	| commitToCherryPick diff |
		
	self repository createBranch: 'b2'.

	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy createTrait: 'TestTrait' inPackage: self packageName1 asSymbol.
	self repository commitWithMessage: 'Adding test trait'.

	self repository workingCopy addPackageNamed: self packageName1.	
	self repository workingCopy createMethod: 'm1 ^42' inClass: 'TestTrait'.

	self repository commitWithMessage: 'Adding Method'.
	commitToCherryPick := fixture repository head.

	self repository checkoutBranch: 'master'.
	diff := fixture repository cherryPickFrom: commitToCherryPick.

	self assert: diff codeSubdirectoryNode children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName1) children size equals: 1.

	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestTrait') value isAddition.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestTrait') children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestTrait' / 'm1') value isAddition.

]

{ #category : #tests }
IceCherryPickingTest >> testAddMethodThatVariablesThatAreNotDependencies [
	
	| commitToCherryPick diff |
		
	self repository createBranch: 'b2'.

	self repository workingCopy addPackageNamed: self packageName1.	
	self repository workingCopy createMethod: 'm1 ^{self. super. true. false. nil. Smalltalk}' inClass: 'TestClass'.
	self repository commitWithMessage: 'Adding a method'.
	commitToCherryPick := fixture repository head.

	self repository checkoutBranch: 'master'.
	diff := fixture repository cherryPickFrom: commitToCherryPick.

	self assert: diff codeSubdirectoryNode children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName1) children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestClass' / 'm1') value isAddition.

]

{ #category : #tests }
IceCherryPickingTest >> testAddMethodWithClassAndSuperclassAsDependency [
	
	| commitToCherryPick diff |
		
	self repository createBranch: 'b2'.

	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy 
		createClass: 'TestClass2' 
		inPackage: self packageName1 asSymbol 
		with: [:class | class superclass: (class environment ask behaviorNamed: #TestClass) ].
	self repository commitWithMessage: 'Adding a test class'.

	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy 
		createClass: 'TestClass3' 
		inPackage: self packageName1 asSymbol 
		with: [:class | class superclass: (class environment ask behaviorNamed: #TestClass2) ].
	self repository commitWithMessage: 'Adding another test class'.

	self repository workingCopy addPackageNamed: self packageName1.	
	self repository workingCopy createMethod: 'm1 ^42' inClass: 'TestClass3'.

	self repository commitWithMessage: 'Adding a method'.
	commitToCherryPick := fixture repository head.

	self repository checkoutBranch: 'master'.
	diff := fixture repository cherryPickFrom: commitToCherryPick.

	self assert: diff codeSubdirectoryNode children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName1) children size equals: 2.

	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestClass2') value isAddition.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestClass2') children size equals: 0.

	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestClass3') value isAddition.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestClass3') children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestClass3' / 'm1') value isAddition.

]

{ #category : #tests }
IceCherryPickingTest >> testAddMethodWithClassVariableAsDependency [
	
	| commitToCherryPick diff |
		
	self repository createBranch: 'b2'.

	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy 
		createClass: 'TestClass2' 
		inPackage: self packageName1 asSymbol 
		with: [:class | class addClassVariable: (RG2ClassVariableDefinition named: 'TestClassVariable' asSymbol parent: class) ].
	self repository commitWithMessage: 'Adding a test class with class variable'.

	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy 
		createClass: 'TestClass3' 
		inPackage: self packageName1 asSymbol 
		with: [:class | class superclass: (class environment ask behaviorNamed: #TestClass2) ].
	self repository commitWithMessage: 'Adding another test class'.

	self repository workingCopy addPackageNamed: self packageName1.	
	self repository workingCopy createMethod: 'm1 ^TestClassVariable' inClass: 'TestClass3' asSymbol.
	self repository commitWithMessage: 'Adding method using test class variable'.

	commitToCherryPick := fixture repository head.

	self repository checkoutBranch: 'master'.
	diff := fixture repository cherryPickFrom: commitToCherryPick.

	self assert: diff codeSubdirectoryNode children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName1) children size equals: 2.

	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestClass2') value isAddition.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestClass2') children size equals: 0.

	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestClass3') value isAddition.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestClass3') children size equals: 1.

	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestClass3' / 'm1') value isAddition.

]

{ #category : #tests }
IceCherryPickingTest >> testAddMethodWithClassVariableAsDependencyWithSuperclassAlreadyCommited [
	
	| commitToCherryPick diff |
		
	self repository createBranch: 'b2'.

	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy 
		createClass: 'TestClass' 
		inPackage: self packageName1 asSymbol 
		with: [:class | class addClassVariable: (RG2ClassVariableDefinition named: 'TestClassVariable' asSymbol parent: class) ].
	self repository commitWithMessage: 'Adding a test class with class variable'.

	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy 
		createClass: 'TestClass2' 
		inPackage: self packageName1 asSymbol 
		with: [:class | class superclass: (class environment ask behaviorNamed: #TestClass) ].
	self repository commitWithMessage: 'Adding another test class'.

	self repository workingCopy addPackageNamed: self packageName1.	
	self repository workingCopy createMethod: 'm1 ^TestClassVariable' inClass: 'TestClass2' asSymbol.
	self repository commitWithMessage: 'Adding method using test class variable'.

	commitToCherryPick := fixture repository head.

	self repository checkoutBranch: 'master'.
	diff := fixture repository cherryPickFrom: commitToCherryPick.

	self assert: diff codeSubdirectoryNode children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName1) children size equals: 2.

	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestClass') value isModification.

	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestClass2') value isAddition.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestClass2') children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestClass2' / 'm1') value isAddition.

]

{ #category : #tests }
IceCherryPickingTest >> testAddMethodWithInstanceVariableAsDependency [
	
	| commitToCherryPick diff |
		
	self repository createBranch: 'b2'.

	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy 
		createClass: 'TestClass2' 
		inPackage: self packageName1 asSymbol 
		with: [:class | class instanceVariables: #(aInstanceVariable)].
	self repository commitWithMessage: 'Adding a test class with an instance variable'.

	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy 
		createClass: 'TestClass3' 
		inPackage: self packageName1 asSymbol 
		with: [:class | class superclass: (class environment ask behaviorNamed: #TestClass2) ].
	self repository commitWithMessage: 'Adding another test class'.

	self repository workingCopy addPackageNamed: self packageName1.	
	self repository workingCopy createMethod: 'm1 ^aInstanceVariable' inClass: 'TestClass3' asSymbol.
	self repository commitWithMessage: 'Adding method using test an instance variable'.

	commitToCherryPick := fixture repository head.

	self repository checkoutBranch: 'master'.
	diff := fixture repository cherryPickFrom: commitToCherryPick.

	self assert: diff codeSubdirectoryNode children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName1) children size equals: 2.

	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestClass2') value isAddition.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestClass2') children size equals: 0.

	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestClass3') value isAddition.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestClass3') children size equals: 1.

	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestClass3' / 'm1') value isAddition.

]

{ #category : #tests }
IceCherryPickingTest >> testAddMethodWithInstanceVariableAsDependencyWithSuperclassAlreadyCommited [
	
	| commitToCherryPick diff |
		
	self repository createBranch: 'b2'.

	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy 
		createClass: 'TestClass' 
		inPackage: self packageName1 asSymbol 
		with: [:class | class instanceVariables: #(aInstanceVariable) ].
	self repository commitWithMessage: 'Adding a test class with an instance variable'.

	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy 
		createClass: 'TestClass2' 
		inPackage: self packageName1 asSymbol 
		with: [:class | class superclass: (class environment ask behaviorNamed: #TestClass) ].
	self repository commitWithMessage: 'Adding another test class'.

	self repository workingCopy addPackageNamed: self packageName1.	
	self repository workingCopy createMethod: 'm1 ^aInstanceVariable' inClass: 'TestClass2' asSymbol.
	self repository commitWithMessage: 'Adding method using test an instance variable'.

	commitToCherryPick := fixture repository head.

	self repository checkoutBranch: 'master'.
	diff := fixture repository cherryPickFrom: commitToCherryPick.

	self assert: diff codeSubdirectoryNode children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName1) children size equals: 2.

	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestClass') value isModification.

	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestClass2') value isAddition.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestClass2') children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestClass2' / 'm1') value isAddition.

]

{ #category : #tests }
IceCherryPickingTest >> testAddMethodWithReferencedClassAsDependency [
	
	| commitToCherryPick diff |
		
	self repository createBranch: 'b2'.

	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy 
		createClass: 'TestClass2' 
		inPackage: self packageName1 asSymbol .
	self repository commitWithMessage: 'Adding a test class'.

	self repository workingCopy addPackageNamed: self packageName1.	
	self repository workingCopy createMethod: 'm1 ^TestClass2' inClass: 'TestClass'.
	self repository commitWithMessage: 'Adding a method'.
	commitToCherryPick := fixture repository head.

	self repository checkoutBranch: 'master'.
	diff := fixture repository cherryPickFrom: commitToCherryPick.

	self assert: diff codeSubdirectoryNode children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName1) children size equals: 2.

	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestClass2') value isAddition.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestClass2') children size equals: 0.

	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestClass' / 'm1') value isAddition.

]

{ #category : #tests }
IceCherryPickingTest >> testAddMethodWithReferencedTraitAsDependency [
	
	| commitToCherryPick diff |
		
	self repository createBranch: 'b2'.

	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy 
		createTrait: 'TestTrait' 
		inPackage: self packageName1 asSymbol .
	self repository commitWithMessage: 'Adding a test trait'.

	self repository workingCopy addPackageNamed: self packageName1.	
	self repository workingCopy createMethod: 'm1 ^TestTrait' inClass: 'TestClass'.
	self repository commitWithMessage: 'Adding a method'.
	commitToCherryPick := fixture repository head.

	self repository checkoutBranch: 'master'.
	diff := fixture repository cherryPickFrom: commitToCherryPick.

	self assert: diff codeSubdirectoryNode children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName1) children size equals: 2.

	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestTrait') value isAddition.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestTrait') children size equals: 0.

	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestClass' / 'm1') value isAddition.

]

{ #category : #tests }
IceCherryPickingTest >> testAddTraitDependingInATrait [
	
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

{ #category : #tests }
IceCherryPickingTest >> testModifyClassWithoutDependencies [
	
	| commitToCherryPick diff |
		
	self repository createBranch: 'b2'.
	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy createClass: 'TestClass' inPackage: self packageName1 asSymbol 
		with: [ :class | class instanceVariables: #(someInstVar) ].
	self repository commitWithMessage: 'Modifying Test Class'.
	commitToCherryPick := self repository head.

	self repository checkoutBranch: 'master'.
	diff := fixture repository cherryPickFrom: commitToCherryPick.

	self assert: diff codeSubdirectoryNode children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName1) children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestClass') value isModification.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestClass') value definition isClassDefinition.

]
