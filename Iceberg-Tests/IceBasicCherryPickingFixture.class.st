Class {
	#name : 'IceBasicCherryPickingFixture',
	#superclass : 'IceBasicRepositoryFixture',
	#category : 'Iceberg-Tests-Cherrypicking',
	#package : 'Iceberg-Tests',
	#tag : 'Cherrypicking'
}

{ #category : 'running' }
IceBasicCherryPickingFixture >> setUp [ 

	super setUp.
	
	repository workingCopy addPackageNamed: self packageName1.
	repository workingCopy createClass: 'TestClass' inPackage: self packageName1 asSymbol.

	repository workingCopy addPackageNamed: self packageName1.
	repository workingCopy createTrait: 'TestTraitInitial' inPackage: self packageName1 asSymbol.

	repository commitWithMessage: 'Initial commit'.

]
