Class {
	#name : 'IceMultiplePackageRepositoryTest',
	#superclass : 'IceBornRepositoryTest',
	#category : 'Iceberg-Tests-Common',
	#package : 'Iceberg-Tests',
	#tag : 'Common'
}

{ #category : 'testing' }
IceMultiplePackageRepositoryTest class >> isAbstract [

	^ self == IceMultiplePackageRepositoryTest
]

{ #category : 'tests-commit' }
IceMultiplePackageRepositoryTest >> testAdoptCommitChangesWorkingCopyCommit [

	| message commitToAdopt |
	message := 'Added IceGeneratedClassForTesting'.
	"This is a Ring working copy"
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting' 
		inPackage: self packageName1 asSymbol.
	self repository commitWithMessage: message.

	commitToAdopt := self repository branch commit parent.
	commitToAdopt adopt.
	
	self assert: self repository workingCopy referenceCommit equals: commitToAdopt
]

{ #category : 'tests-commit' }
IceMultiplePackageRepositoryTest >> testAdoptCommitDoesNotChangeBranchCommit [

	| message commitToAdopt branchCommitBeforeAdopt |
	message := 'Added IceGeneratedClassForTesting'.
	"This is a Ring working copy"
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting' 
		inPackage: self packageName1 asSymbol.
	self repository commitWithMessage: message.

	branchCommitBeforeAdopt := self repository branch commit.
	commitToAdopt := branchCommitBeforeAdopt parent.
	commitToAdopt adopt.
	
	self assert: self repository branch commit equals: branchCommitBeforeAdopt 
]

{ #category : 'tests-commit' }
IceMultiplePackageRepositoryTest >> testAdoptCommitDoesNotChangeCheckedOutCodeInImage [

	| message commitToAdopt |
	message := 'Added IceGeneratedClassForTesting'.
	"This is a Ring working copy"
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting' 
		inPackage: self packageName1 asSymbol.
	self repository commitWithMessage: message.

	commitToAdopt := self repository branch commit parent.
	commitToAdopt adopt.
	
	self assert: (self repository workingCopy environment ask includesClassNamed: 'IceGeneratedClassForTesting')
]

{ #category : 'tests-commit' }
IceMultiplePackageRepositoryTest >> testAdoptCommitMarksPackagesAsDirty [

	| message commitToAdopt |
	message := 'Added IceGeneratedClassForTesting'.
	"This is a Ring working copy"
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting' 
		inPackage: self packageName1 asSymbol.
	self repository commitWithMessage: message.

	commitToAdopt := self repository branch commit parent.
	commitToAdopt adopt.
	
	self assert: (self repository workingCopy packageNamed: self packageName1 asSymbol) isDirty
]

{ #category : 'tests-checkout' }
IceMultiplePackageRepositoryTest >> testCheckoutBranchDoesNotLeaveDetachedHead [

	self repository branch checkout.
	self deny: self repository head isDetached
]

{ #category : 'tests-checkout' }
IceMultiplePackageRepositoryTest >> testCheckoutBranchInstallsCodeInImage [

	| message |
	message := 'Added IceGeneratedClassForTesting'.

	"This is a Ring working copy"
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting' 
		inPackage: self packageName1 asSymbol.
	self repository commitWithMessage: message.

	message := 'Added IceAnotherGeneratedClassForTesting'.
	
	"This is a Ring working copy"
	self repository workingCopy
		createClass: 'IceAnotherGeneratedClassForTesting' 
		inPackage: self packageName2 asSymbol.
	self repository commitWithMessage: message.

	self repository unload.
	self denyPackageExists: self packageName1.
	self denyPackageExists: self packageName2.
	
	self repository branch checkoutAllPackages.
	self assertClassExists: #IceGeneratedClassForTesting.
	self assertClassExists: #IceAnotherGeneratedClassForTesting.
	self assertPackageExists: self packageName1.
	self assertPackageExists: self packageName2
]

{ #category : 'tests-checkout' }
IceMultiplePackageRepositoryTest >> testCheckoutBranchInstallsPackageInImage [

	self repository branch checkout.
	self assertPackageExists: self packageName1.
	self assertPackageExists: self packageName2.
]

{ #category : 'tests-checkout' }
IceMultiplePackageRepositoryTest >> testCheckoutCodeRepositoryInstallsCodeInImage [

	| message |
	message := 'Added IceGeneratedClassForTesting'.
	"This is a Ring working copy"
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting' 
		inPackage: self packageName1 asSymbol.
	self repository commitWithMessage: message.

	message := 'Added IceAnotherGeneratedClassForTesting'.
	"This is a Ring working copy"
	self repository workingCopy
		createClass: 'IceAnotherGeneratedClassForTesting' 
		inPackage: self packageName2 asSymbol.
	self repository commitWithMessage: message.
	
	self repository unload.
	self denyPackageExists: self packageName1.
	self denyPackageExists: self packageName2.
	
	self repository checkoutAllPackages.
	self assertClassExists: #IceGeneratedClassForTesting.
	self assertClassExists: #IceAnotherGeneratedClassForTesting.
	self assertPackageExists: self packageName1.
	self assertPackageExists: self packageName2
]

{ #category : 'tests-checkout' }
IceMultiplePackageRepositoryTest >> testCheckoutCodeRepositoryInstallsPackageInImage [

	self  repository checkoutAllPackages.
	self assertPackageExists: self packageName1.
	self assertPackageExists: self packageName2
]

{ #category : 'tests-checkout' }
IceMultiplePackageRepositoryTest >> testCheckoutCommitInstallsCodeInImage [

	| message |
	message := 'Added IceGeneratedClassForTesting'.
	"This is a Ring working copy"
	self  repository workingCopy
		createClass: 'IceGeneratedClassForTesting' 
		inPackage: self packageName1 asSymbol.
	self  repository commitWithMessage: message.

	message := 'Added IceAnotherGeneratedClassForTesting'.
	"This is a Ring working copy"
	self  repository workingCopy
		createClass: 'IceAnotherGeneratedClassForTesting' 
		inPackage: self packageName1 asSymbol.
	self  repository commitWithMessage: message.
	
	self  repository unload.
	self denyPackageExists: self packageName1.
	self denyPackageExists: self packageName2.
	
	self  repository branch commit checkoutAllPackages.
	self assertClassExists: #IceGeneratedClassForTesting.
	self assertClassExists: #IceAnotherGeneratedClassForTesting.
	self assertPackageExists: self packageName1.
	self assertPackageExists: self packageName2
]

{ #category : 'tests-checkout' }
IceMultiplePackageRepositoryTest >> testCheckoutCommitInstallsPackageInImage [

	self  repository branch commit checkout.
	self assertPackageExists: self packageName1.
	self assertPackageExists: self packageName2
]

{ #category : 'tests-branch' }
IceMultiplePackageRepositoryTest >> testCheckoutDoesNotAffectBranchCommit [

	| commitAtBranchTime createdBranch message |
	
	"Create new commit for this test"
	message := 'Added IceGeneratedClassForTesting'.
	"This is a Ring working copy"
	self  repository workingCopy
		createClass: 'IceAnotherGeneratedClassForTesting' 
		inPackage: self packageName1 asSymbol.
	self  repository commitWithMessage: message.
	
	"Then create the new branch at this point"
	commitAtBranchTime := self  repository head commit.
	createdBranch := self  repository createBranch: 'new'.
	
	"And test"
	commitAtBranchTime ancestors first checkout.
	self assert: createdBranch commit equals: commitAtBranchTime
]

{ #category : 'tests-checkout' }
IceMultiplePackageRepositoryTest >> testCheckoutLatestBranchCommitLeavesDetachedHead [

	self  repository branch commit checkoutAllPackages.
	self assert: self  repository head isDetached.
]

{ #category : 'tests-checkout' }
IceMultiplePackageRepositoryTest >> testCheckoutOlderCommitLeavesRepositoryInDetachedMode [

	| message |
	message := 'Added IceGeneratedClassForTesting'.
	"This is a Ring working copy"
	self  repository workingCopy
		createClass: 'IceAnotherGeneratedClassForTesting' 
		inPackage: self packageName1 asSymbol.
	self  repository commitWithMessage: message.
	
	message := 'Added IceAnotherClass'.
	"This is a Ring working copy"
	self  repository workingCopy
		createClass: 'IceAnotherClass' 
		inPackage: self packageName1 asSymbol.
	self  repository commitWithMessage: message.
	
	self  repository branch newCommitWalk commits second checkoutAllPackages.
	self assert: self  repository head isDetached
]

{ #category : 'tests-checkout' }
IceMultiplePackageRepositoryTest >> testCheckoutRepositoryDoesNotLeaveDetachedHead [

	self  repository checkoutAllPackages.
	self deny: self  repository head isDetached
]

{ #category : 'tests-commit' }
IceMultiplePackageRepositoryTest >> testCommitModificationsCreatesNewCommit [

	| message |
	message := 'Added IceGeneratedClassForTesting'.
	"This is a Ring working copy"
	self  repository workingCopy
		createClass: 'IceAnotherGeneratedClassForTesting' 
		inPackage: self packageName1 asSymbol.
	self  repository commitWithMessage: message.
	
	self assert: self  repository branch commit comment equals:  message.
	self deny: self  repository workingCopy isDetached.
]

{ #category : 'tests-commit' }
IceMultiplePackageRepositoryTest >> testCommitModificationsDoNotCreateBranch [

	| message |
	message := 'Added IceGeneratedClassForTesting'.
	"This is a Ring working copy"
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting' 
		inPackage: self packageName1 asSymbol.
	self repository commitWithMessage: message.
	
	self assert: self repository allBranches size equals: 1.
	self deny: self repository workingCopy isDetached.
]

{ #category : 'tests-commit' }
IceMultiplePackageRepositoryTest >> testCommitWithDetachedHeadRaisesException [

	| message |
	self repository branch commit checkout.
	self assert: self repository head isDetached.
	
	message := 'Added IceGeneratedClassForTesting'.
	"This is a Ring working copy"
	self repository workingCopy
		createClass: 'IceAnotherGeneratedClassForTesting' 
		inPackage: self packageName1 asSymbol.
	
	self should: [self repository commitWithMessage: message] raise: IceWorkingCopyDesyncronized.
]

{ #category : 'tests-changes' }
IceMultiplePackageRepositoryTest >> testCreateClassInImageInNotManagedPackageKeepChangesEmpty [

	"This is a Ring working copy"
	self repository workingCopy
		createClass: 'IceAnotherGeneratedClassForTesting' 
		inPackage: (self packageName1 , 'NonManaged') asSymbol.
	self assert: self repository workingCopyDiff isEmpty
]

{ #category : 'tests-changes' }
IceMultiplePackageRepositoryTest >> testCreateClassInImageMakesChangesContainClassDefinition [

	| diff |
	"This is a Ring working copy"
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting' 
		inPackage: self packageName1 asSymbol.

	diff := self repository workingCopyDiff.
	self assert: diff tree children size equals: 1.
	self assert: (diff tree / self packageName1) children size equals: 2.
	self assert: (diff tree / self packageName1 / 'IceGeneratedClassForTesting') value isAddition.
	self assert: (diff tree / self packageName1 / 'IceGeneratedClassForTesting') value definition isClassDefinition.
	self assert: (diff tree / self packageName1 / 'IceGeneratedClassForTesting') value definition name equals: #IceGeneratedClassForTesting.
]

{ #category : 'tests-changes' }
IceMultiplePackageRepositoryTest >> testCreateClassInImageMakesChangesNonEmpty [

	"This is a Ring working copy"
	self repository workingCopy
		createClass: 'IceAnotherGeneratedClassForTesting' 
		inPackage: self packageName1 asSymbol.
	self deny: self repository workingCopyDiff isEmpty
]

{ #category : 'tests-changes' }
IceMultiplePackageRepositoryTest >> testCreateClassInImageMakesRespositoryModifications [

	"This is a Ring working copy"
	self repository workingCopy
		createClass: 'IceAnotherGeneratedClassForTesting' 
		inPackage: self packageName1 asSymbol.
	self assert: self repository isModified
]

{ #category : 'tests-queries' }
IceMultiplePackageRepositoryTest >> testCurrentBranchIsDefaultMasterBranch [

	self assert: self repository branch name equals: 'master'
]

{ #category : 'tests-commit' }
IceMultiplePackageRepositoryTest >> testDetachedHeadCannotCommit [

	self repository branch commit checkout.
	self assert: self repository head isDetached.
	self should: [self repository validateCanCommit] raise: IceWorkingCopyDesyncronized.
]

{ #category : 'tests-queries' }
IceMultiplePackageRepositoryTest >> testListBranchCommitsListsCommitsInBranch [

	| branches commits |
	branches := self repository allBranches.
	commits := branches first commits.
	
	self assert: commits size equals: self expectedCommitsInNewBranch.
	self assert: commits first comment equals: 'Initial commit'.
]

{ #category : 'tests-queries' }
IceMultiplePackageRepositoryTest >> testListPackagesListExistingPackage [

	| packages |
	packages := self repository workingCopy packageNames.
	self assert: packages size equals: 2.
	self assert: (packages includes: self packageName1).
	self assert: (packages includes: self packageName2).
]

{ #category : 'tests-changes' }
IceMultiplePackageRepositoryTest >> testNoChangesInImageMakesChangesEmpty [

	self assert: self repository workingCopyDiff isEmpty
]

{ #category : 'tests-changes' }
IceMultiplePackageRepositoryTest >> testNoChangesInImageMakesNoModifications [

	self deny: self repository isModified
]

{ #category : 'tests-commit' }
IceMultiplePackageRepositoryTest >> testResetBranchDoesNotChangeCheckedOutCodeInImage [

	| message commitToReset |
	message := 'Added IceGeneratedClassForTesting'.
	"This is a Ring working copy"
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting' 
		inPackage: self packageName1 asSymbol.
	self repository commitWithMessage: message.


	commitToReset := self repository branch commit parent.
	self repository branch resetToCommit: commitToReset.
	
	self assert: (self repository workingCopy environment ask includesClassNamed: 'IceGeneratedClassForTesting')
]

{ #category : 'tests-commit' }
IceMultiplePackageRepositoryTest >> testResetBranchDoesNotChangeCheckedOutCommit [

	| message commitToReset workingCopyCommitBeforeReset |
	message := 'Added IceGeneratedClassForTesting'.
	"This is a Ring working copy"
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting' 
		inPackage: self packageName1 asSymbol.
	self repository commitWithMessage: message.

	workingCopyCommitBeforeReset := self repository workingCopy referenceCommit.
	commitToReset := self repository branch commit parent.
	self repository branch resetToCommit: commitToReset.
	
	self assert: self repository workingCopy referenceCommit equals: workingCopyCommitBeforeReset 
]

{ #category : 'tests-commit' }
IceMultiplePackageRepositoryTest >> testResetBranchRestoresBranchCommit [

	| message commitToReset |
	message := 'Added IceGeneratedClassForTesting'.
	"This is a Ring working copy"
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting' 
		inPackage: self packageName1 asSymbol.
	self repository commitWithMessage: message.


	commitToReset := self repository branch commit parent.
	self repository branch resetToCommit: commitToReset.
	
	self assert: self repository branch commit equals: commitToReset
]
