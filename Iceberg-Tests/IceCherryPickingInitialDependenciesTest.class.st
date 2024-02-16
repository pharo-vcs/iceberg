Class {
	#name : 'IceCherryPickingInitialDependenciesTest',
	#superclass : 'IceCherryPickingTest',
	#category : 'Iceberg-Tests-Cherrypicking',
	#package : 'Iceberg-Tests',
	#tag : 'Cherrypicking'
}

{ #category : 'tests' }
IceCherryPickingInitialDependenciesTest >> testAddClassWithMethod [
	| commitToCherryPick initialDiff commonAncestor extendedDiff receiverDiff cherrypicker |
	self repository createBranch: 'b2'.
	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createClass: 'TestClass2'
		inPackage: self packageName1 asSymbol.
	self repository workingCopy
		createMethod: 'm1 ^42'
		inClass: 'TestClass2'.
	self repository commitWithMessage: 'Adding Test Class With a Method'.
	commitToCherryPick := self repository head.
	self repository checkoutBranch: 'master'.


	initialDiff := commitToCherryPick commit diffToParent.
	commonAncestor := commitToCherryPick
		commonAncestorWith: self repository head commit.
	extendedDiff := commitToCherryPick diffTo: commonAncestor.
	receiverDiff := self repository head commit diffTo: commonAncestor.

	cherrypicker := IceCherrypicker new
		sourceDiff: initialDiff;
		targetDiff: extendedDiff;
		receiverToAncestorDiff: receiverDiff.
	cherrypicker addInitialDependencies.
	self
		assert:
			(cherrypicker dependencies
				select: [ :dependency | dependency class = IceClassDependency ])
				size
		equals: 1.
	self
		assert:
			(cherrypicker dependencies
				select: [ :dependency | dependency class = IceMethodDependency ])
				size
		equals: 1.
]

{ #category : 'tests' }
IceCherryPickingInitialDependenciesTest >> testRemoveClassWithMethod [
	| commitToCherryPick initialDiff commonAncestor extendedDiff receiverDiff cherrypicker |

	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createClass: 'TestClass2'
		inPackage: self packageName1 asSymbol.
	self repository workingCopy
		createMethod: 'm1 ^42'
		inClass: 'TestClass2'.
	self repository commitWithMessage: 'Adding Test Class With a Method'.

	self repository createBranch: 'b2'.
		self repository workingCopy
		removeClassNamed: 'TestClass2'.
	self repository commitWithMessage: 'Removing Test Class With a Method'.


	commitToCherryPick := self repository head.
	self repository checkoutBranch: 'master'.


	initialDiff := commitToCherryPick commit diffToParent.
	commonAncestor := commitToCherryPick
		commonAncestorWith: self repository head commit.
	extendedDiff := commitToCherryPick diffTo: commonAncestor.
	receiverDiff := self repository head commit diffTo: commonAncestor.

	cherrypicker := IceCherrypicker new
		sourceDiff: initialDiff;
		targetDiff: extendedDiff;
		receiverToAncestorDiff: receiverDiff.
	cherrypicker addInitialDependencies.
	self
		assert:
			(cherrypicker dependencies
				select: [ :dependency | dependency class = IceClassDependency ])
				size
		equals: 1.
]
