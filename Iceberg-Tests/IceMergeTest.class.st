Class {
	#name : 'IceMergeTest',
	#superclass : 'IceAbstractTestCase',
	#category : 'Iceberg-Tests-Common',
	#package : 'Iceberg-Tests',
	#tag : 'Common'
}

{ #category : 'testing' }
IceMergeTest class >> isAbstract [

	^ self == IceMergeTest
]

{ #category : 'merge-conflicts' }
IceMergeTest >> testFastForwardApplyChangesCorrectly [

	"This is a Ring working copy"
	| initialCommit change1Commit newProject |
	newProject := IceBasicProject onRepository: self repository.
	newProject sourceDirectory: 'src'.
	self repository workingCopy project: newProject.
	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy createClass: 'IceGeneratedClassForTesting' inPackage: self packageName1 asSymbol.
	initialCommit := self repository commitWithMessage: 'First commit'.

	self repository createBranch: 'change1' inCommit: initialCommit.
	self repository workingCopy createClass: 'IceGeneratedClassForTesting2' inPackage: self packageName1 asSymbol.
	change1Commit := self repository commitWithMessage: 'Change 1'.

	self repository unload.
	
	(self repository branchNamed: 'master') checkout.

	self repository workingCopy mergeCommit: change1Commit.
	
	self assert: self repository headCommit equals: change1Commit.
	self assert: (self repository workingCopy environment ask includesClassNamed: #IceGeneratedClassForTesting2)
]

{ #category : 'merge-cases' }
IceMergeTest >> testImageAndHeadBehindMergeCommitShouldMergeInImageAndAdvanceHead [

	"If the image and HEAD are behind the commit to merge, we need to advance HEAD and update the image so they correspond.
	
	(c2)  -  mergeCommit
	 |
	 v
	(c1)  -  HEAD commit / Image reference commit
	
	expected
	
	(c2)  -  HEAD commit / Image reference commit
	 |
	 v
	(c1) 
	
	(arrows meaning parent)
	"
	| headCommit mergeCommit |
	
	self workingCopy addPackageNamed: self packageName1.
	self workingCopy addPackageNamed: self packageName2.
	headCommit := self repository commitWithMessage: 'First commit'.

	self workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol.
	mergeCommit := mergeCommit := self repository commitWithMessage: 'Change 1'.
	
	((self repository branchNamed: 'master') commit: headCommit) checkout.

	self assert: self repository headCommit equals: headCommit.
	self assert: mergeCommit parent equals: headCommit.
	self assert: mergeCommit parent equals: self workingCopy referenceCommit.
	self assert: self workingCopy isModified not.
	
	self workingCopy mergeCommit: mergeCommit.
	
	self assert: self repository headCommit equals: mergeCommit.
	self assert: self workingCopy referenceCommit equals: mergeCommit.
	self assert: self workingCopy isModified not.
]

{ #category : 'merge-cases' }
IceMergeTest >> testImageAndHeadInverseMergeDivergingCommitShouldCreateMergeCommitAdvanceHeadAndImage [

	"If we want to merge the image into the head commit the usual thing would be to:
	  - checkout HEAD in the image
	  - do a normal merge.
	However, that would require lots of manual operations. Instead, we need to do an *Inverse merge*.
	We merge the changes from HEAD into the image, and create a merge commit with reverted parents into HEAD.
	Then we just need to update HEAD.
	
	(c2)  -  HEAD commit   (c3) - merge commit / Image reference commit
	 |                      |
	 v                      |
	(c1) <-------------------
	
	expected
	
	(c4) -  HEAD commit / Image reference commit
	 |--------
    |       |
	 v       v
	(c2)    (c3)
	 |       |
	 v       |
	(c1) <---- 
	
	(arrows meaning parent)
	"
	| headCommit mergeCommit mergeBaseCommit |
	
	self workingCopy addPackageNamed: self packageName1.
	self workingCopy addPackageNamed: self packageName2.
	mergeBaseCommit := self repository commitWithMessage: 'First commit'.

	self repository workingCopy
		createClass: 'IceClassInHead'
		inPackage: self packageName1 asSymbol.
	headCommit := self repository commitWithMessage: 'Change 1'.
	
	((self repository branchNamed: 'master') commit: mergeBaseCommit) checkout.

	self repository workingCopy
		createClass: 'IceClassToMerge'
		inPackage: self packageName1 asSymbol.
	mergeCommit := self repository commitWithMessage: 'Change 2'.
	(self repository branchNamed: 'master') commit: headCommit.

	self assert: self repository workingCopy referenceCommit equals: mergeCommit.
	self assert: self repository headCommit equals: headCommit.
	self assert: self repository headCommit parent equals: mergeBaseCommit.
	self assert: mergeCommit parent equals: mergeBaseCommit.
	self assert: self repository workingCopy isModified not.
	
	self repository workingCopy mergeCommit: mergeCommit.
	
	self assert: self repository headCommit parent equals: headCommit.
	self assert: self repository workingCopy referenceCommit equals: self repository headCommit.
	self assert: self repository headCommit ancestors size equals: 2.
	self assert: (self repository headCommit ancestors includes: mergeCommit).
	self assert: self repository workingCopy isModified not.
]

{ #category : 'merge-cases' }
IceMergeTest >> testImageAndHeadMergeDivergingCommitShouldCreateMergeCommitAdvanceHeadAndImage [

	"If the image and HEAD diverted from the merge commit, we need to create a merge commit and advance both HEAD and the image to it.
	The case with no conflicts should do the merge automatically.
	The merge commmit should have two parents. The first parent should be HEAD.
	
	(c2)  -  HEAD commit / Image reference commit   (c3) - merge commit
	 |                                               |
	 v                                               |
	(c1) <--------------------------------------------
	
	expected
	
	(c4) -  HEAD commit / Image reference commit
	 |--------
    |       |
	 v       v
	(c2)    (c3)
	 |       |
	 v       |
	(c1) <---- 
	
	(arrows meaning parent)
	"
	| headCommit mergeCommit mergeBaseCommit |
	
	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy addPackageNamed: self packageName2.
	mergeBaseCommit := self repository commitWithMessage: 'First commit'.

	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol.
	mergeCommit := self repository commitWithMessage: 'Change 1'.
	
	((self repository branchNamed: 'master') commit: mergeBaseCommit) checkout.

	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting2'
		inPackage: self packageName1 asSymbol.
	headCommit := self repository commitWithMessage: 'Change 2'.

	self assert: self repository headCommit equals: self repository workingCopy referenceCommit.
	self assert: self repository headCommit equals: headCommit.
	self assert: self repository headCommit parent equals: mergeBaseCommit.
	self assert: mergeCommit parent equals: mergeBaseCommit.
	self deny: self repository workingCopy isModified.
	
	self repository workingCopy mergeCommit: mergeCommit.
	
	self assert: self repository headCommit parent equals: headCommit.
	self assert: self repository workingCopy referenceCommit equals: self repository headCommit.
	self assert: self repository headCommit ancestors size equals: 2.
	self assert: (self repository headCommit ancestors includes: mergeCommit).
	self deny: self repository workingCopy isModified.
]

{ #category : 'merge-cases' }
IceMergeTest >> testImageBehindHeadShouldOnlyMergeInImage [

	"If the image is behind HEAD and we want to merge HEAD we need to update the image to be in HEAD.
	
	(c2)  -  HEAD commit / merge commit
	 |
	 v
	(c1)  -  Image reference commit
	
	expected
	
	(c2)  -  HEAD commit / Image reference commit
	 |
	 v
	(c1) 
	
	(arrows meaning parent)
	"
	| referenceCommit headCommit mergeCommit |
	
	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy addPackageNamed: self packageName2.
	referenceCommit := self repository commitWithMessage: 'First commit'.

	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol.
	headCommit := mergeCommit := self repository commitWithMessage: 'Change 1'.
	
	referenceCommit adopt.

	self assert: self repository headCommit equals: headCommit.
	self assert: headCommit equals: mergeCommit.
	self assert: headCommit parent equals: self repository workingCopy referenceCommit.
	
	"Experimental issue. If we merge and we have dirty package we should just resume"
	[self repository workingCopy mergeCommit: mergeCommit]
		on: Warning
		do: #resume.
	
	self assert: self repository headCommit equals: headCommit.
	self assert: headCommit equals: self repository workingCopy referenceCommit.
]

{ #category : 'merge-cases' }
IceMergeTest >> testMergeAheadImageCommitShouldFastForwardHEAD [

	"If the image corresponds to the head commit and the commit we want to merge is in the history of the head commit, the merge should be ignored.
	
	(c2)  -  merge commit / Image reference commit
	 |
	 v
	(c1)  -  HEAD commit

	expected:
	
	(c2)  -  HEAD commit / Image reference commit
	 |
	 v
	(c1)
	
	(arrows meaning parent)
	"
	| headCommit mergeCommit |
	
	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy addPackageNamed: self packageName2.
	headCommit := self repository commitWithMessage: 'First commit'.

	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol.
	mergeCommit := self repository commitWithMessage: 'Change 1'.

	self repository branch commit: headCommit.

	self assert: headCommit equals: self repository workingCopy referenceCommit parent.
	self assert: self repository workingCopy referenceCommit equals: mergeCommit.
	self assert: self repository workingCopy isModified not.
	
	self repository workingCopy mergeCommit: mergeCommit.
	
	self assert: self repository headCommit equals: mergeCommit.
	self assert: self repository workingCopy referenceCommit equals: mergeCommit.
	self assert: self repository workingCopy isModified not.
]

{ #category : 'merge-conflicts' }
IceMergeTest >> testMergeChangesInDifferentClassesButSamePackageCausesNoConflicts [

	"This is a Ring working copy"
	| initialCommit change1Commit change2Commit |
	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy addPackageNamed: self packageName2.
	initialCommit := self repository commitWithMessage: 'First commit'.

	self repository createBranch: 'change1' inCommit: initialCommit.
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol.
	change1Commit := self repository commitWithMessage: 'Change 1'.

	self repository unload.
	self repository createBranch: 'change2' inCommit: initialCommit.
	self repository head checkout.
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting2'
		inPackage: self packageName1 asSymbol.
	change2Commit := self repository commitWithMessage: 'Change 2'.
	
	(self repository branchNamed: 'change1') checkout.
	
	self repository workingCopy mergeCommit: change2Commit.
	
	self assert: self repository headCommit isMergeCommit.
	self assert: (self repository headCommit ancestors includes: change1Commit).
	self assert: (self repository headCommit ancestors includes: change2Commit).
]

{ #category : 'merge-conflicts' }
IceMergeTest >> testMergeChangesInDifferentMethodsButSameClassCausesNoConflicts [

	"This is a Ring working copy"
	| initialCommit change1Commit change2Commit |
	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy addPackageNamed: self packageName2.
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol.
	initialCommit := self repository commitWithMessage: 'First commit'.

	self repository createBranch: 'change1' inCommit: initialCommit.
	self repository workingCopy
		createMethod: 'test ^ 1' inClass: 'IceGeneratedClassForTesting' asSymbol.
	change1Commit := self repository commitWithMessage: 'Change 1'.

	self repository unload.
	self repository createBranch: 'change2' inCommit: initialCommit.
	self repository head checkout: IceCheckoutAllPackages new.
	self repository workingCopy
		createMethod: 'test2 ^ 2' inClass: 'IceGeneratedClassForTesting' asSymbol.
	change2Commit := self repository commitWithMessage: 'Change 2'.
	
	(self repository branchNamed: 'change1') checkout.
	
	self repository workingCopy mergeCommit: change2Commit.
	
	self assert: self repository headCommit isMergeCommit.
	self assert: (self repository headCommit ancestors includes: change1Commit).
	self assert: (self repository headCommit ancestors includes: change2Commit).
]

{ #category : 'merge-conflicts' }
IceMergeTest >> testMergeChangesInDifferentPackagesCausesNoConflicts [

	"This is a Ring working copy"
	| initialCommit change1Commit change2Commit |
	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy addPackageNamed: self packageName2.
	initialCommit := self repository commitWithMessage: 'First commit'.

	self repository createBranch: 'change1' inCommit: initialCommit.
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol.
	change1Commit := self repository commitWithMessage: 'Change 1'.

	self repository unload.
	self repository createBranch: 'change2' inCommit: initialCommit.
	self repository head checkout.
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting2'
		inPackage: self packageName2 asSymbol.
	change2Commit := self repository commitWithMessage: 'Change 2'.
	
	self repository unload.
	(self repository branchNamed: 'change1') checkout.
	
	self repository workingCopy mergeCommit: change2Commit.
	
	self assert: self repository headCommit isMergeCommit.
	self assert: (self repository headCommit ancestors includes: change1Commit).
	self assert: (self repository headCommit ancestors includes: change2Commit).
]

{ #category : 'merge-conflicts' }
IceMergeTest >> testMergeChangesInSameClassesSamePackageCausesConflicts [

	"This is a Ring working copy"
	| initialCommit change1Commit change2Commit |
	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy addPackageNamed: self packageName2.
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol.
	initialCommit := self repository commitWithMessage: 'First commit'.

	self repository createBranch: 'change1' inCommit: initialCommit.
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol
		with: [ :class | class superclass name: 'ASuperclass' ].
	change1Commit := self repository commitWithMessage: 'Change 1'.

	self repository unload.
	self repository createBranch: 'change2' inCommit: initialCommit.
	self repository head checkout.
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol
		with: [ :class | class superclass name: 'ADifferentSuperclass' ].
	change2Commit := self repository commitWithMessage: 'Change 2'.
	
	(self repository branchNamed: 'change1') checkout.
	self should: [self repository workingCopy mergeCommit: change2Commit] raise: IceMergeResolutionRequest
]

{ #category : 'merge-conflicts' }
IceMergeTest >> testMergeChangesInSameMethodSameClassSamePackageCausesConflicts [

	"This is a Ring working copy"
	| initialCommit change1Commit change2Commit |
	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy addPackageNamed: self packageName2.
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol.
	self repository workingCopy
		createMethod: 'test ^ 1' inClass: 'IceGeneratedClassForTesting' asSymbol.
	initialCommit := self repository commitWithMessage: 'First commit'.

	self repository createBranch: 'change1' inCommit: initialCommit.
	self repository workingCopy
		createMethod: 'test ^ 2' inClass: 'IceGeneratedClassForTesting' asSymbol.
	change1Commit := self repository commitWithMessage: 'Change 1'.

	self repository unload.
	self repository createBranch: 'change2' inCommit: initialCommit.

	self repository head checkout: IceCheckoutAllPackages new.
	self repository workingCopy
		createMethod: 'test ^ 3' inClass: 'IceGeneratedClassForTesting' asSymbol.
	change2Commit := self repository commitWithMessage: 'Change 2'.
	
	(self repository branchNamed: 'change1') checkout.
	self should: [self repository workingCopy mergeCommit: change2Commit] raise: IceMergeResolutionRequest
]

{ #category : 'merge-cases' }
IceMergeTest >> testMergeCommitInHistoryShouldDoNothing [

	"If the image corresponds to the head commit and the commit we want to merge is in the history of the head commit, the merge should be ignored.
	
	(c2)  -  HEAD commit / Image reference commit
	 |
	 v
	(c1)  -  merge commit
	
	expected
	
	(c2)  -  HEAD commit / Image reference commit
	 |
	 v
	(c1)
	
	(arrows meaning parent)
	"
	| headCommit mergeCommit |
	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy addPackageNamed: self packageName2.
	mergeCommit := self repository commitWithMessage: 'First commit'.

	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol.
	headCommit := self repository commitWithMessage: 'Change 1'.

	self assert: headCommit equals: self repository workingCopy referenceCommit.
	self assert: headCommit parent equals: mergeCommit.
	self assert: self repository workingCopy isModified not.
	
	self repository workingCopy mergeCommit: mergeCommit.
	
	self assert: self repository headCommit equals: headCommit.
	self assert: headCommit equals: self repository workingCopy referenceCommit.
	self assert: self repository workingCopy isModified not.
]

{ #category : 'merge-operations' }
IceMergeTest >> testMergeFastForwardClassRemovalIsAppliedToWorkingCopy [

	| headCommit mergeCommit |
	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol.

	headCommit := self repository commitWithMessage: 'First commit'.

	self repository workingCopy removeClassNamed: 'IceGeneratedClassForTesting'.
	mergeCommit := self repository commitWithMessage: 'Removal 1'.

	self repository branch commit: headCommit.
	self repository branch checkout.
	self assertClassExists: 'IceGeneratedClassForTesting'.

	self repository workingCopy mergeCommit: mergeCommit.
	self denyClassExists: 'IceGeneratedClassForTesting'.
]

{ #category : 'merge-operations' }
IceMergeTest >> testMergeFastForwardMethodRemovalIsAppliedToWorkingCopy [

	| headCommit mergeCommit |
	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol;
		createMethod: 'm ^ 42' inClass: 'IceGeneratedClassForTesting'.

	headCommit := self repository commitWithMessage: 'First commit'.

	self repository workingCopy removeMethod: #m fromClass:  'IceGeneratedClassForTesting'.
	mergeCommit := self repository commitWithMessage: 'Removal 1'.

	self repository branch commit: headCommit.
	self repository branch checkout.
	self assertClassExists: 'IceGeneratedClassForTesting'.
	self assertMethodExists: #m inClass: 'IceGeneratedClassForTesting'.
	
	self repository workingCopy mergeCommit: mergeCommit.

	self denyMethodExists: #m inClass: 'IceGeneratedClassForTesting'.

]

{ #category : 'merge-cases' }
IceMergeTest >> testMergeImageReferenceCommitInHistoryShouldDoNothing [

	"If the image corresponds to the merge commit and is in the history of the head commit, the merge should be ignored.
	
	(c2)  -  HEAD commit
	 |
	 v
	(c1)  -  Image reference commit / merge commit
	
	expected
	
	(c2)  -  HEAD commit
	 |
	 v
	(c1)  -  Image reference commit
	
	(arrows meaning parent)
	"
	| headCommit mergeCommit |
	
	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy addPackageNamed: self packageName2.
	mergeCommit := self repository commitWithMessage: 'First commit'.

	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol.
	headCommit := self repository commitWithMessage: 'Change 1'.
	
	mergeCommit checkout.

	self assert: headCommit parent equals: self repository workingCopy referenceCommit.
	self assert: mergeCommit equals: self repository workingCopy referenceCommit.
	self assert: self repository workingCopy isModified not.
	
	self repository workingCopy mergeCommit: mergeCommit.
	
	self assert: headCommit parent equals: self repository workingCopy referenceCommit.
	self assert: mergeCommit equals: self repository workingCopy referenceCommit.
	self assert: self repository workingCopy isModified not.
]

{ #category : 'merge-operations' }
IceMergeTest >> testMergeNonFastForwardClassRemovalIsAppliedToWorkingCopy [

	| headCommit mergeCommit |
	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol.

	headCommit := self repository commitWithMessage: 'First commit'.

	self repository workingCopy removeClassNamed: 'IceGeneratedClassForTesting'.
	mergeCommit := self repository commitWithMessage: 'Removal 1'.

	self repository branch commit: headCommit.
	self repository branch checkout.
	self assertClassExists: 'IceGeneratedClassForTesting'.
	
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting2'
		inPackage: self packageName1 asSymbol.

	self repository commitWithMessage: 'Other commit'.

	self repository workingCopy mergeCommit: mergeCommit.

	self assertClassExists: 'IceGeneratedClassForTesting2'.
	self denyClassExists: 'IceGeneratedClassForTesting'.
]

{ #category : 'merge-operations' }
IceMergeTest >> testMergeNonFastForwardLocalMethodAdditionIsNotInMergeTree [

	| headCommit mergeCommit mergeTree |
	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol;
		createMethod: 'm ^ 42' inClass: 'IceGeneratedClassForTesting'.

	headCommit := self repository commitWithMessage: 'First commit'.

	self repository workingCopy removeMethod: #m fromClass:  'IceGeneratedClassForTesting'.
	mergeCommit := self repository commitWithMessage: 'Removal 1'.

	self repository branch commit: headCommit.
	self repository branch checkout.
	self assertClassExists: 'IceGeneratedClassForTesting'.
	self assertMethodExists: #m inClass: 'IceGeneratedClassForTesting'.
	
	self repository workingCopy
		createMethod: 'm2 ^ 43' inClass: 'IceGeneratedClassForTesting'.

	self repository commitWithMessage: 'Other commit'.

	
	mergeTree := IceMerge new
		repository: self repository;
		mergeCommit: mergeCommit;
		mergeTree.

	self deny: ((mergeTree / self packageName1 / 'IceGeneratedClassForTesting')
		includesKey: #m2).


]

{ #category : 'merge-operations' }
IceMergeTest >> testMergeNonFastForwardLocalMethodModificationIsNotInMergeTree [

	| headCommit mergeCommit mergeTree |
	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol;
		createMethod: 'm ^ 42' inClass: 'IceGeneratedClassForTesting';
		createMethod: 'm2 ^ 43' inClass: 'IceGeneratedClassForTesting'.

	headCommit := self repository commitWithMessage: 'First commit'.

	self repository workingCopy removeMethod: #m fromClass:  'IceGeneratedClassForTesting'.
	mergeCommit := self repository commitWithMessage: 'Removal 1'.

	self repository branch commit: headCommit.
	self repository branch checkout.
	self assertClassExists: 'IceGeneratedClassForTesting'.
	self assertMethodExists: #m inClass: 'IceGeneratedClassForTesting'.
	
	self repository workingCopy createMethod: 'm2 ^ 44' inClass: 'IceGeneratedClassForTesting'.

	self repository commitWithMessage: 'Other commit'.

	
	mergeTree := IceMerge new
		repository: self repository;
		mergeCommit: mergeCommit;
		mergeTree.

	self deny: ((mergeTree / self packageName1 / 'IceGeneratedClassForTesting')
		includesKey: #m2).


]

{ #category : 'merge-operations' }
IceMergeTest >> testMergeNonFastForwardLocalMethodRemovalIsNotInMergeTree [

	| headCommit mergeCommit mergeTree |
	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol;
		createMethod: 'm ^ 42' inClass: 'IceGeneratedClassForTesting';
		createMethod: 'm2 ^ 43' inClass: 'IceGeneratedClassForTesting'.

	headCommit := self repository commitWithMessage: 'First commit'.

	self repository workingCopy removeMethod: #m fromClass:  'IceGeneratedClassForTesting'.
	mergeCommit := self repository commitWithMessage: 'Removal 1'.

	self repository branch commit: headCommit.
	self repository branch checkout.
	self assertClassExists: 'IceGeneratedClassForTesting'.
	self assertMethodExists: #m inClass: 'IceGeneratedClassForTesting'.
	
	self repository workingCopy removeMethod: #m2 fromClass:  'IceGeneratedClassForTesting'.

	self repository commitWithMessage: 'Other commit'.

	
	mergeTree := IceMerge new
		repository: self repository;
		mergeCommit: mergeCommit;
		mergeTree.

	self deny: ((mergeTree / self packageName1 / 'IceGeneratedClassForTesting')
		includesKey: #m2).


]

{ #category : 'merge-operations' }
IceMergeTest >> testMergeNonFastForwardMethodRemovalIsAppliedToWorkingCopy [

	| headCommit mergeCommit |
	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol;
		createMethod: 'm ^ 42' inClass: 'IceGeneratedClassForTesting'.

	headCommit := self repository commitWithMessage: 'First commit'.

	self repository workingCopy removeMethod: #m fromClass:  'IceGeneratedClassForTesting'.
	mergeCommit := self repository commitWithMessage: 'Removal 1'.

	self repository branch commit: headCommit.
	self repository branch checkout.
	self assertClassExists: 'IceGeneratedClassForTesting'.
	self assertMethodExists: #m inClass: 'IceGeneratedClassForTesting'.
	
	self repository workingCopy
		createMethod: 'm2 ^ 43' inClass: 'IceGeneratedClassForTesting'.

	self repository commitWithMessage: 'Other commit'.

	self repository workingCopy mergeCommit: mergeCommit.

	self assertMethodExists: #m2 inClass: 'IceGeneratedClassForTesting'.
	self denyMethodExists: #m inClass: 'IceGeneratedClassForTesting'.

]

{ #category : 'merge-cases' }
IceMergeTest >> testTrimergeShouldRaiseError [
	"If the image, HEAD and merge commit are three different commits, we should avoid merging.
	
	(c3)  -  HEAD commit
	 |
	 v
	(c2)  -  merge commit
	 |
	 v
	(c1)  -  Image reference commit
	
	expected
	
	 * IceMergeAborted
	
	(arrows meaning parent)
	"

	| referenceCommit headCommit mergeCommit |
	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy addPackageNamed: self packageName2.
	referenceCommit := self repository commitWithMessage: 'First commit'.
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol.
	mergeCommit := self repository commitWithMessage: 'Change 1'.
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting2'
		inPackage: self packageName1 asSymbol.
	headCommit := self repository commitWithMessage: 'Change 2'.
	referenceCommit adopt.
	self assert: headCommit parent equals: mergeCommit.
	self assert: mergeCommit parent equals: self repository workingCopy referenceCommit.
	self
		should: [ "Experimental issue. If we merge and we have dirty package we should just resume"
			[ self repository workingCopy mergeCommit: mergeCommit ]
				on: Warning
				do: #resume ]
		raise: IceMergeAborted.
	self assert: headCommit parent equals: mergeCommit.
	self assert: mergeCommit parent equals: self repository workingCopy referenceCommit
]
