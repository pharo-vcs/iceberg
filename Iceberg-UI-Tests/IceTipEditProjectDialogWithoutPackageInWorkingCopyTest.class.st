Class {
	#name : #IceTipEditProjectDialogWithoutPackageInWorkingCopyTest,
	#superclass : #IceTipEditProjectDialogTest,
	#category : #'Iceberg-UI-Tests'
}

{ #category : #'instance creation' }
IceTipEditProjectDialogWithoutPackageInWorkingCopyTest >> newFixture [
	^ IceBasicRepositoryFixture inGit 
]

{ #category : #tests }
IceTipEditProjectDialogWithoutPackageInWorkingCopyTest >> testHasMessagePanel [
	self assert: (dialog messageIcon image) equals: nil.
	self assert: (dialog messageText text) equals: ''.
]
