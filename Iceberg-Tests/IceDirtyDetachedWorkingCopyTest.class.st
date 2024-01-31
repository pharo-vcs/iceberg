Class {
	#name : 'IceDirtyDetachedWorkingCopyTest',
	#superclass : 'IceAbstractTestCase',
	#category : 'Iceberg-Tests-Common',
	#package : 'Iceberg-Tests',
	#tag : 'Common'
}

{ #category : 'testing' }
IceDirtyDetachedWorkingCopyTest class >> isAbstract [

	^ self == IceDirtyDetachedWorkingCopyTest
]

{ #category : 'tests' }
IceDirtyDetachedWorkingCopyTest >> testIsDetached [

	self assert: self repository workingCopy isDetached
]

{ #category : 'tests' }
IceDirtyDetachedWorkingCopyTest >> testPackageIsDirty [

	"There are uncommitted changes"
	self assert: self repository workingCopy isModified
]

{ #category : 'tests' }
IceDirtyDetachedWorkingCopyTest >> testReattachInNewBranchIsStillDirty [

	self repository createBranch: 'test' inCommit: self repository workingCopy referenceCommit.
	self assert: self repository workingCopy isModified.
]

{ #category : 'tests' }
IceDirtyDetachedWorkingCopyTest >> testReattachInNewBranchMakesNoMoreDetached [

	self repository createBranch: 'test' inCommit: self repository workingCopy referenceCommit.
	self deny: self repository workingCopy isDetached.
]

{ #category : 'tests' }
IceDirtyDetachedWorkingCopyTest >> testWorkingCopyDiffIsAgainstReferenceCommitAndNotHead [

	self assert: self repository workingCopyDiff targetVersion equals: self repository workingCopy referenceCommit.
	self deny: self repository workingCopyDiff targetVersion equals: self repository headCommit.
]
