Class {
	#name : 'IceDetachedWorkingCopyTest',
	#superclass : 'IceAbstractTestCase',
	#category : 'Iceberg-Tests-Common',
	#package : 'Iceberg-Tests',
	#tag : 'Common'
}

{ #category : 'testing' }
IceDetachedWorkingCopyTest class >> isAbstract [

	^ self == IceDetachedWorkingCopyTest
]

{ #category : 'tests' }
IceDetachedWorkingCopyTest >> testIsDetached [

	self assert: self repository workingCopy isDetached
]

{ #category : 'tests' }
IceDetachedWorkingCopyTest >> testPackageIsNotDirty [

	"There is no difference between the code in the image and the checkout'd code"
	self deny: self repository workingCopy isModified
]

{ #category : 'tests' }
IceDetachedWorkingCopyTest >> testReattachInNewBranchMakesNoMoreDetached [

	self repository createBranch: 'test' inCommit: self repository workingCopy referenceCommit.
	self deny: self repository workingCopy isDetached.
]

{ #category : 'tests' }
IceDetachedWorkingCopyTest >> testReattachInNewBranchMakesNoMoreDirty [

	self repository createBranch: 'test' inCommit: self repository workingCopy referenceCommit.
	self deny: self repository workingCopy isModified.
]
