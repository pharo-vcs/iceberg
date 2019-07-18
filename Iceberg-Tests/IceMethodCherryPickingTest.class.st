Class {
	#name : #IceMethodCherryPickingTest,
	#superclass : #IceCherryPickingTest,
	#category : #'Iceberg-Tests-Cherrypicking'
}

{ #category : #tests }
IceMethodCherryPickingTest >> testAddExtensionMethodInExistingClass [
	
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
IceMethodCherryPickingTest >> testAddExtensionMethodInExistingTrait [
	
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
IceMethodCherryPickingTest >> testAddMethodInClassAsDependency [
	
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
IceMethodCherryPickingTest >> testAddMethodInExistingClass [
	
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
IceMethodCherryPickingTest >> testAddMethodInExistingTrait [
	
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
IceMethodCherryPickingTest >> testAddMethodInTraitAsDependency [
	
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
IceMethodCherryPickingTest >> testAddMethodReferingAnAddedMethod [
	
	| commitToCherryPick diff |
		
	self repository createBranch: 'b2'.
	self repository workingCopy addPackageNamed: self packageName1.	
	self repository workingCopy createMethod: 'm2 ^ 42' inClass: 'TestClass'.
	self repository commitWithMessage: 'Adding Method'.

	self repository workingCopy createMethod: 'm1 ^ self m2' inClass: 'TestClass'.
	self repository commitWithMessage: 'Adding Refering Method'.
	commitToCherryPick := fixture repository head.

	self repository checkoutBranch: 'master'.
	diff := fixture repository cherryPickFrom: commitToCherryPick.

	self assert: diff codeSubdirectoryNode children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName1) children size equals: 1.

	self deny: (diff codeSubdirectoryNode / self packageName1 / 'TestClass') value isModification.
	self deny: (diff codeSubdirectoryNode / self packageName1 / 'TestClass') value isAddition.

	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestClass' / 'm1') value isAddition.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestClass' / 'm2') value isAddition.
]

{ #category : #tests }
IceMethodCherryPickingTest >> testAddMethodThatVariablesThatAreNotDependencies [
	
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
IceMethodCherryPickingTest >> testAddMethodWithClassAndSuperclassAsDependency [
	
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
IceMethodCherryPickingTest >> testAddMethodWithClassVariableAsDependency [
	
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
IceMethodCherryPickingTest >> testAddMethodWithClassVariableAsDependencyWithSuperclassAlreadyCommited [
	
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
IceMethodCherryPickingTest >> testAddMethodWithInstanceVariableAsDependency [
	
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
IceMethodCherryPickingTest >> testAddMethodWithInstanceVariableAsDependencyWithSuperclassAlreadyCommited [
	
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
IceMethodCherryPickingTest >> testAddMethodWithReferencedClassAsDependency [
	
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
IceMethodCherryPickingTest >> testAddMethodWithReferencedTraitAsDependency [
	
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
