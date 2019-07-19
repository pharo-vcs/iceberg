Class {
	#name : #IceConflictsCherryPickingTest,
	#superclass : #IceCherryPickingTest,
	#category : #'Iceberg-Tests-Cherrypicking'
}

{ #category : #tests }
IceConflictsCherryPickingTest >> testAddPackageConflict [
	
	| commitToCherryPick diff |

	self repository createBranch: 'b2'.
			
	self repository workingCopy addPackageNamed: self packageName2.
	self repository workingCopy createClass: 'TestClass' inPackage: self packageName2 asSymbol.
	self repository commitWithMessage: 'Adding the package'.
	commitToCherryPick := fixture repository head.

	self repository checkoutBranch: 'master'.
	self repository workingCopy addPackageNamed: self packageName2.
	self repository workingCopy createClass: 'TestClass' inPackage: self packageName2 asSymbol.
	self repository workingCopy createMethod: 'm1 ^42' inClass: 'TestClass'.
	self repository commitWithMessage: 'Adding the package a second time'.

	diff := fixture repository cherryPickFrom: commitToCherryPick.

	self assert: diff codeSubdirectoryNode children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName2) value isConflict.

]

{ #category : #tests }
IceConflictsCherryPickingTest >> testMethodModificationConflict [
	
	| commitToCherryPick diff |
		
	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy createClass: 'TestClass2' inPackage: self packageName1 asSymbol.
	self repository commitWithMessage: 'Adding test class'.


	self repository createBranch: 'b2'.

	self repository workingCopy addPackageNamed: self packageName1.	
	self repository workingCopy createMethod: 'm1 ^42' inClass: 'TestClass2'.
	self repository commitWithMessage: 'Adding Method'.
	commitToCherryPick := fixture repository head.


	self repository checkoutBranch: 'master'.
	self repository workingCopy addPackageNamed: self packageName1.	
	self repository workingCopy createMethod: 'm1 ^36' inClass: 'TestClass2'.
	self repository commitWithMessage: 'Adding the same method in master'.

	diff := fixture repository cherryPickFrom: commitToCherryPick.

	self assert: diff codeSubdirectoryNode children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName1) children size equals: 1.

	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestClass2') value isNoModification.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestClass2') children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'TestClass2' / 'm1') value isConflict.

]
