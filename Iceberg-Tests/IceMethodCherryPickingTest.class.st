Class {
	#name : 'IceMethodCherryPickingTest',
	#superclass : 'IceCherryPickingTest',
	#category : 'Iceberg-Tests-Cherrypicking',
	#package : 'Iceberg-Tests',
	#tag : 'Cherrypicking'
}

{ #category : 'tests' }
IceMethodCherryPickingTest >> testAddMethodInClassAsDependency [
	| commitToCherryPick diff mergeTree |
	self repository createBranch: 'b2'.

	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createClass: 'TestClass2'
		inPackage: self packageName1 asSymbol.
	self repository commitWithMessage: 'Adding test class'.

	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createMethod: 'm1 ^42'
		inClass: 'TestClass2'.

	self repository commitWithMessage: 'Adding Method'.
	commitToCherryPick := fixture repository head.

	self repository checkoutBranch: 'master'.
	mergeTree := fixture repository cherryPickFrom: commitToCherryPick.
	diff := mergeTree collect: [ :each | each chosenOperation ].

	self assert: diff children size equals: 1.
	self
		assert: (diff / self packageName1) children size
		equals: 2.

	self
		assert:
			(diff / self packageName1 / 'TestClass2') value
				isAddition.
	self
		assert:
			(diff / self packageName1 / 'TestClass2')
				children size
		equals: 1.
	self
		assert:
			(diff / self packageName1 / 'TestClass2' / 'm1')
				value isAddition
]

{ #category : 'tests' }
IceMethodCherryPickingTest >> testAddMethodInExistingClass [
	| commitToCherryPick diff mergeTree |
	self repository createBranch: 'b2'.
	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createMethod: 'm1 ^42'
		inClass: 'TestClass'.
	self repository commitWithMessage: 'Adding Method'.
	commitToCherryPick := fixture repository head.

	self repository checkoutBranch: 'master'.
	mergeTree := fixture repository cherryPickFrom: commitToCherryPick.
	diff := mergeTree collect: [ :each | each chosenOperation ].

	self assert: diff children size equals: 1.
	self
		assert: (diff / self packageName1) children size
		equals: 1.

	self
		deny:
			(diff / self packageName1 / 'TestClass') value
				isModification.
	self
		deny:
			(diff / self packageName1 / 'TestClass') value
				isAddition.

	self
		assert:
			(diff / self packageName1 / 'TestClass' / 'm1')
				value isAddition
]

{ #category : 'tests' }
IceMethodCherryPickingTest >> testAddMethodInExistingTrait [
	| commitToCherryPick diff mergeTree |
	self repository createBranch: 'b2'.

	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createMethod: 'm1 ^42'
		inClass: 'TestTraitInitial'.
	self repository commitWithMessage: 'Adding Method'.
	commitToCherryPick := fixture repository head.

	self repository checkoutBranch: 'master'.
	mergeTree := fixture repository cherryPickFrom: commitToCherryPick.
	diff := mergeTree collect: [ :each | each chosenOperation ].

	self assert: diff children size equals: 1.
	self
		assert: (diff / self packageName1) children size
		equals: 1.

	self
		deny:
			(diff / self packageName1 / 'TestTraitInitial')
				value isModification.
	self
		deny:
			(diff / self packageName1 / 'TestTraitInitial')
				value isAddition.
	self
		assert:
			(diff / self packageName1 / 'TestTraitInitial')
				children size
		equals: 1.
	self
		assert:
			(diff / self packageName1 / 'TestTraitInitial'
				/ 'm1') value isAddition
]

{ #category : 'tests' }
IceMethodCherryPickingTest >> testAddMethodInTraitAsDependency [
	| commitToCherryPick diff mergeTree |
	self repository createBranch: 'b2'.

	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createTrait: 'TestTrait'
		inPackage: self packageName1 asSymbol.
	self repository commitWithMessage: 'Adding test trait'.

	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createMethod: 'm1 ^42'
		inClass: 'TestTrait'.

	self repository commitWithMessage: 'Adding Method'.
	commitToCherryPick := fixture repository head.

	self repository checkoutBranch: 'master'.
	mergeTree := fixture repository cherryPickFrom: commitToCherryPick.
	diff := mergeTree collect: [ :each | each chosenOperation ].

	self assert: diff children size equals: 1.
	self
		assert: (diff / self packageName1) children size
		equals: 2.

	self
		assert:
			(diff / self packageName1 / 'TestTrait') value
				isAddition.
	self
		assert:
			(diff / self packageName1 / 'TestTrait') children
				size
		equals: 1.
	self
		assert:
			(diff / self packageName1 / 'TestTrait' / 'm1')
				value isAddition
]

{ #category : 'tests' }
IceMethodCherryPickingTest >> testAddMethodReferingAnAddedMethod [
	| commitToCherryPick diff mergeTree |
	self repository createBranch: 'b2'.
	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createMethod: 'm2 ^ 42'
		inClass: 'TestClass'.
	self repository commitWithMessage: 'Adding Method'.

	self repository workingCopy
		createMethod: 'm1 ^ self m2'
		inClass: 'TestClass'.
	self repository commitWithMessage: 'Adding Refering Method'.
	commitToCherryPick := fixture repository head.

	self repository checkoutBranch: 'master'.
	mergeTree := fixture repository cherryPickFrom: commitToCherryPick.
	diff := mergeTree collect: [ :each | each chosenOperation ].

	self assert: diff children size equals: 1.
	self
		assert: (diff / self packageName1) children size
		equals: 1.

	self
		deny:
			(diff / self packageName1 / 'TestClass') value
				isModification.
	self
		deny:
			(diff / self packageName1 / 'TestClass') value
				isAddition.

	self
		assert:
			(diff / self packageName1 / 'TestClass' / 'm1')
				value isAddition.
	self
		assert:
			(diff / self packageName1 / 'TestClass' / 'm2')
				value isAddition
]

{ #category : 'tests' }
IceMethodCherryPickingTest >> testAddMethodThatVariablesThatAreNotDependencies [
	| commitToCherryPick diff mergeTree |
	self repository createBranch: 'b2'.

	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createMethod: 'm1 ^{self. super. true. false. nil. Smalltalk}'
		inClass: 'TestClass'.
	self repository commitWithMessage: 'Adding a method'.
	commitToCherryPick := fixture repository head.

	self repository checkoutBranch: 'master'.
	mergeTree := fixture repository cherryPickFrom: commitToCherryPick.
	diff := mergeTree collect: [ :each | each chosenOperation ].

	self assert: diff children size equals: 1.
	self
		assert: (diff / self packageName1) children size
		equals: 1.
	self
		assert:
			(diff / self packageName1 / 'TestClass' / 'm1')
				value isAddition
]

{ #category : 'tests' }
IceMethodCherryPickingTest >> testAddMethodUsingASharedPoolAsDependency [
	| commitToCherryPick diff mergeTree |
	self repository createBranch: 'b2'.

	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createClass: 'TestSharedPool'
		inPackage: self packageName1 asSymbol
		with:
			[ :class | class superclass: (class environment ask behaviorNamed: #SharedPool) ].
	self repository commitWithMessage: 'Adding a Shared Pool'.

	self repository workingCopy
		createClass: 'TestClass2'
		inPackage: self packageName1 asSymbol
		with: [ :class | class sharedPools: #(TestSharedPool) ].
	self repository commitWithMessage: 'Adding a class using sharedpools'.


	self repository workingCopy
		createMethod: 'm1 ^ TestSharedPool bindingOf: varname'
		inClass: 'TestClass2'.
	self repository
		commitWithMessage: 'Adding a Method using sharedpools'.

	commitToCherryPick := fixture repository head.

	self repository checkoutBranch: 'master'.
	mergeTree := fixture repository cherryPickFrom: commitToCherryPick.
	diff := mergeTree collect: [ :each | each chosenOperation ].

	self assert: diff children size equals: 1.
	self
		assert: (diff / self packageName1) children size
		equals: 4.

	self
		assert:
			(diff / self packageName1 / 'TestClass2') value
				isAddition.
	self
		assert:
			(diff / self packageName1 / 'TestClass2')
				children size
		equals: 1.

	self
		assert:
			(diff / self packageName1 / 'TestSharedPool')
				value isAddition.
	self
		assert:
			(diff / self packageName1 / 'TestSharedPool')
				children size
		equals: 0
]

{ #category : 'tests' }
IceMethodCherryPickingTest >> testAddMethodUsingASharedPoolAsDependencyWithClassAlreadyCommited [
	| commitToCherryPick diff mergeTree |
	self repository workingCopy addPackageNamed: self packageName1.

	self repository workingCopy
		createClass: 'SharedPool'
		inPackage: self packageName1 asSymbol.

	self repository workingCopy
		createClass: 'TestSharedPool'
		inPackage: self packageName1 asSymbol
		with:
			[ :class | class superclass: (class environment ask behaviorNamed: #SharedPool) ].
	self repository commitWithMessage: 'Adding a Shared Pool'.

	self repository workingCopy
		createClass: 'TestClass2'
		inPackage: self packageName1 asSymbol
		with: [ :class | class sharedPools: #(TestSharedPool) ].
	self repository commitWithMessage: 'Adding a class using sharedpools'.

	self repository createBranch: 'b2'.

	self repository workingCopy
		addClassVariable: 'TestVariable'
		to: 'TestSharedPool'.


	self repository workingCopy
		createMethod: 'm1 ^ TestSharedPool bindingOf: varname'
		inClass: 'TestClass2'.
	self repository
		commitWithMessage: 'Adding a Method using sharedpools'.

	commitToCherryPick := fixture repository head.

	self repository checkoutBranch: 'master'.
	mergeTree := fixture repository cherryPickFrom: commitToCherryPick.
	diff := mergeTree collect: [ :each | each chosenOperation ].

	self assert: diff children size equals: 1.
	self
		assert: (diff / self packageName1) children size
		equals: 2.

	self
		assert:
			(diff / self packageName1 / 'TestClass2') value
				isNoModification.
	self
		assert:
			(diff / self packageName1 / 'TestClass2')
				children size
		equals: 1.

	self
		assert:
			(diff / self packageName1 / 'TestSharedPool')
				value isModification.
	self
		assert:
			(diff / self packageName1 / 'TestSharedPool')
				children size
		equals: 0
]

{ #category : 'tests' }
IceMethodCherryPickingTest >> testAddMethodWithClassAndSuperclassAsDependency [
	| commitToCherryPick diff mergeTree |
	self repository createBranch: 'b2'.

	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createClass: 'TestClass2'
		inPackage: self packageName1 asSymbol
		with:
			[ :class | class superclass: (class environment ask behaviorNamed: #TestClass) ].
	self repository commitWithMessage: 'Adding a test class'.

	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createClass: 'TestClass3'
		inPackage: self packageName1 asSymbol
		with:
			[ :class | class superclass: (class environment ask behaviorNamed: #TestClass2) ].
	self repository commitWithMessage: 'Adding another test class'.

	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createMethod: 'm1 ^42'
		inClass: 'TestClass3'.

	self repository commitWithMessage: 'Adding a method'.
	commitToCherryPick := fixture repository head.

	self repository checkoutBranch: 'master'.
	mergeTree := fixture repository cherryPickFrom: commitToCherryPick.
	diff := mergeTree collect: [ :each | each chosenOperation ].

	self assert: diff children size equals: 1.
	self
		assert: (diff / self packageName1) children size
		equals: 4.

	self
		assert:
			(diff / self packageName1 / 'TestClass2') value
				isAddition.
	self
		assert:
			(diff / self packageName1 / 'TestClass2')
				children size
		equals: 0.

	self
		assert:
			(diff / self packageName1 / 'TestClass3') value
				isAddition.
	self
		assert:
			(diff / self packageName1 / 'TestClass3')
				children size
		equals: 1.
	self
		assert:
			(diff / self packageName1 / 'TestClass3' / 'm1')
				value isAddition
]

{ #category : 'tests' }
IceMethodCherryPickingTest >> testAddMethodWithClassVariableAsDependency [

	| commitToCherryPick diff mergeTree |
	self repository createBranch: 'b2'.

	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createClass: 'TestClass2'
		inPackage: self packageName1 asSymbol
		with: [ :class | class addClassVariable: (RGClassVariable named: 'TestClassVariable' asSymbol parent: class) ].
	self repository commitWithMessage: 'Adding a test class with class variable'.

	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createClass: 'TestClass3'
		inPackage: self packageName1 asSymbol
		with: [ :class | class superclass: (class environment ask behaviorNamed: #TestClass2) ].
	self repository commitWithMessage: 'Adding another test class'.

	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy createMethod: 'm1 ^TestClassVariable' inClass: 'TestClass3' asSymbol.
	self repository commitWithMessage: 'Adding method using test class variable'.

	commitToCherryPick := fixture repository head.

	self repository checkoutBranch: 'master'.
	mergeTree := fixture repository cherryPickFrom: commitToCherryPick.
	diff := mergeTree collect: [ :each | each chosenOperation ].

	self assert: diff children size equals: 1.
	self assert: (diff / self packageName1) children size equals: 4.

	self assert: (diff / self packageName1 / 'TestClass2') value isAddition.
	self assert: (diff / self packageName1 / 'TestClass2') children size equals: 0.

	self assert: (diff / self packageName1 / 'TestClass3') value isAddition.
	self assert: (diff / self packageName1 / 'TestClass3') children size equals: 1.

	self assert: (diff / self packageName1 / 'TestClass3' / 'm1') value isAddition
]

{ #category : 'tests' }
IceMethodCherryPickingTest >> testAddMethodWithClassVariableAsDependencyWithSuperclassAlreadyCommited [

	| commitToCherryPick diff mergeTree |
	self repository createBranch: 'b2'.

	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createClass: 'TestClass'
		inPackage: self packageName1 asSymbol
		with: [ :class | class addClassVariable: (RGClassVariable named: 'TestClassVariable' asSymbol parent: class) ].
	self repository commitWithMessage: 'Adding a test class with class variable'.

	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createClass: 'TestClass2'
		inPackage: self packageName1 asSymbol
		with: [ :class | class superclass: (class environment ask behaviorNamed: #TestClass) ].
	self repository commitWithMessage: 'Adding another test class'.

	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy createMethod: 'm1 ^TestClassVariable' inClass: 'TestClass2' asSymbol.
	self repository commitWithMessage: 'Adding method using test class variable'.

	commitToCherryPick := fixture repository head.

	self repository checkoutBranch: 'master'.
	mergeTree := fixture repository cherryPickFrom: commitToCherryPick.
	diff := mergeTree collect: [ :each | each chosenOperation ].

	self assert: diff children size equals: 1.
	self assert: (diff / self packageName1) children size equals: 3.

	self assert: (diff / self packageName1 / 'TestClass') value isModification.

	self assert: (diff / self packageName1 / 'TestClass2') value isAddition.
	self assert: (diff / self packageName1 / 'TestClass2') children size equals: 1.
	self assert: (diff / self packageName1 / 'TestClass2' / 'm1') value isAddition
]

{ #category : 'tests' }
IceMethodCherryPickingTest >> testAddMethodWithInstanceVariableAsDependency [
	| commitToCherryPick diff mergeTree |
	self repository createBranch: 'b2'.

	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createClass: 'TestClass2'
		inPackage: self packageName1 asSymbol
		with: [ :class | class instanceVariables: #(aInstanceVariable) ].
	self repository
		commitWithMessage: 'Adding a test class with an instance variable'.

	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createClass: 'TestClass3'
		inPackage: self packageName1 asSymbol
		with:
			[ :class | class superclass: (class environment ask behaviorNamed: #TestClass2) ].
	self repository commitWithMessage: 'Adding another test class'.

	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createMethod: 'm1 ^aInstanceVariable'
		inClass: 'TestClass3' asSymbol.
	self repository
		commitWithMessage: 'Adding method using test an instance variable'.

	commitToCherryPick := fixture repository head.

	self repository checkoutBranch: 'master'.
	mergeTree := fixture repository cherryPickFrom: commitToCherryPick.
	diff := mergeTree collect: [ :each | each chosenOperation ].

	self assert: diff children size equals: 1.
	self
		assert: (diff / self packageName1) children size
		equals: 4.

	self
		assert:
			(diff / self packageName1 / 'TestClass2') value
				isAddition.
	self
		assert:
			(diff / self packageName1 / 'TestClass2')
				children size
		equals: 0.

	self
		assert:
			(diff / self packageName1 / 'TestClass3') value
				isAddition.
	self
		assert:
			(diff / self packageName1 / 'TestClass3')
				children size
		equals: 1.

	self
		assert:
			(diff / self packageName1 / 'TestClass3' / 'm1')
				value isAddition
]

{ #category : 'tests' }
IceMethodCherryPickingTest >> testAddMethodWithInstanceVariableAsDependencyWithSuperclassAlreadyCommited [
	| commitToCherryPick diff mergeTree |
	self repository createBranch: 'b2'.

	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createClass: 'TestClass'
		inPackage: self packageName1 asSymbol
		with: [ :class | class instanceVariables: #(aInstanceVariable) ].
	self repository
		commitWithMessage: 'Adding a test class with an instance variable'.

	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createClass: 'TestClass2'
		inPackage: self packageName1 asSymbol
		with:
			[ :class | class superclass: (class environment ask behaviorNamed: #TestClass) ].
	self repository commitWithMessage: 'Adding another test class'.

	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createMethod: 'm1 ^aInstanceVariable'
		inClass: 'TestClass2' asSymbol.
	self repository
		commitWithMessage: 'Adding method using test an instance variable'.

	commitToCherryPick := fixture repository head.

	self repository checkoutBranch: 'master'.
	mergeTree := fixture repository cherryPickFrom: commitToCherryPick.
	diff := mergeTree collect: [ :each | each chosenOperation ].

	self assert: diff children size equals: 1.
	self
		assert: (diff / self packageName1) children size
		equals: 3.

	self
		assert:
			(diff / self packageName1 / 'TestClass') value
				isModification.

	self
		assert:
			(diff / self packageName1 / 'TestClass2') value
				isAddition.
	self
		assert:
			(diff / self packageName1 / 'TestClass2')
				children size
		equals: 1.
	self
		assert:
			(diff / self packageName1 / 'TestClass2' / 'm1')
				value isAddition
]

{ #category : 'tests' }
IceMethodCherryPickingTest >> testAddMethodWithReferencedClassAsDependency [
	| commitToCherryPick diff mergeTree |
	self repository createBranch: 'b2'.

	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createClass: 'TestClass2'
		inPackage: self packageName1 asSymbol.
	self repository commitWithMessage: 'Adding a test class'.

	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createMethod: 'm1 ^TestClass2'
		inClass: 'TestClass'.
	self repository commitWithMessage: 'Adding a method'.
	commitToCherryPick := fixture repository head.

	self repository checkoutBranch: 'master'.
	mergeTree := fixture repository cherryPickFrom: commitToCherryPick.
	diff := mergeTree collect: [ :each | each chosenOperation ].

	self assert: diff children size equals: 1.
	self
		assert: (diff / self packageName1) children size
		equals: 3.

	self
		assert:
			(diff / self packageName1 / 'TestClass2') value
				isAddition.
	self
		assert:
			(diff / self packageName1 / 'TestClass2')
				children size
		equals: 0.

	self
		assert:
			(diff / self packageName1 / 'TestClass' / 'm1')
				value isAddition
]

{ #category : 'tests' }
IceMethodCherryPickingTest >> testAddMethodWithReferencedTraitAsDependency [
	| commitToCherryPick diff mergeTree |
	self repository createBranch: 'b2'.

	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createTrait: 'TestTrait'
		inPackage: self packageName1 asSymbol.
	self repository commitWithMessage: 'Adding a test trait'.

	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createMethod: 'm1 ^TestTrait'
		inClass: 'TestClass'.
	self repository commitWithMessage: 'Adding a method'.
	commitToCherryPick := fixture repository head.

	self repository checkoutBranch: 'master'.
	mergeTree := fixture repository cherryPickFrom: commitToCherryPick.
	diff := mergeTree collect: [ :each | each chosenOperation ].

	self assert: diff children size equals: 1.
	self
		assert: (diff / self packageName1) children size
		equals: 3.

	self
		assert:
			(diff / self packageName1 / 'TestTrait') value
				isAddition.
	self
		assert:
			(diff / self packageName1 / 'TestTrait') children
				size
		equals: 0.

	self
		assert:
			(diff / self packageName1 / 'TestClass' / 'm1')
				value isAddition
]

{ #category : 'tests' }
IceMethodCherryPickingTest >> testAddMethodWithTwoCommits [
	| commitToCherryPick diff mergeTree |
	self repository createBranch: 'b2'.
	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createMethod: 'm1 ^42'
		inClass: 'TestClass'.
	self repository commitWithMessage: 'Adding Method'.
		self repository workingCopy
		createMethod: 'm1 ^36'
		inClass: 'TestClass'.
	self repository commitWithMessage: 'Modifing Method'.

	commitToCherryPick := fixture repository head.

	self repository checkoutBranch: 'master'.
	mergeTree := fixture repository cherryPickFrom: commitToCherryPick.
	diff := mergeTree collect: [ :each | each chosenOperation ].

	self assert: diff children size equals: 1.
	self assert: (diff / self packageName1) children size equals: 1.

	self
		deny: (diff / self packageName1 / 'TestClass') value isModification.
	self deny: (diff / self packageName1 / 'TestClass') value isAddition.

	self
		assert: (diff / self packageName1 / 'TestClass' / 'm1') value isAddition;
		assert: (diff / self packageName1 / 'TestClass' / 'm1') value definition sourceCode equals: 'm1 ^36'.
]

{ #category : 'tests' }
IceMethodCherryPickingTest >> testRemoveClassWithMethods [
	| commitToCherryPick diff mergeTree |
	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createClass: 'TestClass2'
		inPackage: self packageName1 asSymbol.
	self repository commitWithMessage: 'Adding test class'.

	self repository workingCopy
		createMethod: 'm1 ^42'
		inClass: 'TestClass2'.
	self repository commitWithMessage: 'Adding Method'.

	self repository createBranch: 'b2'.
	self repository workingCopy removeClassNamed: 'TestClass2'.
	self repository commitWithMessage: 'Removing test class'.

	commitToCherryPick := fixture repository head.

	self repository checkoutBranch: 'master'.
	mergeTree := fixture repository cherryPickFrom: commitToCherryPick.
	diff := mergeTree collect: [ :each | each chosenOperation ].

	self assert: diff children size equals: 1.
	self assert: (diff / self packageName1) children size equals: 2.

	self
		assert: (diff / self packageName1 / 'TestClass2') value isRemoval.
	self
		assert: (diff / self packageName1 / 'TestClass2') children size
		equals: 1.
	self
		assert: (diff / self packageName1 / 'TestClass2' / 'm1') value isRemoval
]

{ #category : 'tests' }
IceMethodCherryPickingTest >> testRemoveMethodInExistingClass [
	| commitToCherryPick diff mergeTree |

	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createMethod: 'm1 ^42'
		inClass: 'TestClass'.
	self repository commitWithMessage: 'Adding Method m1'.


	self repository createBranch: 'b2'.

	self repository workingCopy removeMethod: 'm1' fromClass: 'TestClass'.
	self repository commitWithMessage: 'Remove Method m1'.


	commitToCherryPick := fixture repository head.

	self repository checkoutBranch: 'master'.
	mergeTree := fixture repository cherryPickFrom: commitToCherryPick.
	diff := mergeTree collect: [ :each | each chosenOperation ].

	self assert: diff children size equals: 1.
	self assert: (diff / self packageName1) children size equals: 1.

	self
		deny: (diff / self packageName1 / 'TestClass') value isModification.
	self deny: (diff / self packageName1 / 'TestClass') value isAddition.

	self
		assert: (diff / self packageName1 / 'TestClass' / 'm1') value isRemoval
]

{ #category : 'tests' }
IceMethodCherryPickingTest >> testRemoveMethodInExistingTrait [
	| commitToCherryPick diff mergeTree |
	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createMethod: 'm1 ^42'
		inClass: 'TestTraitInitial'.
	self repository commitWithMessage: 'Adding Method'.

	self repository createBranch: 'b2'.

	self repository workingCopy
		removeMethod: 'm1'
		fromClass: 'TestTraitInitial'.
	self repository commitWithMessage: 'Remove Method'.


	commitToCherryPick := fixture repository head.

	self repository checkoutBranch: 'master'.
	mergeTree := fixture repository cherryPickFrom: commitToCherryPick.
	diff := mergeTree collect: [ :each | each chosenOperation ].

	self assert: diff children size equals: 1.
	self assert: (diff / self packageName1) children size equals: 1.

	self
		deny: (diff / self packageName1 / 'TestTraitInitial') value isModification.
	self
		deny: (diff / self packageName1 / 'TestTraitInitial') value isAddition.
	self
		assert: (diff / self packageName1 / 'TestTraitInitial') children size
		equals: 1.
	self
		assert:
			(diff / self packageName1 / 'TestTraitInitial' / 'm1') value isRemoval
]
