Class {
	#name : #IceTipEditProjectDialogWithPackageInWorkingCopyTest,
	#superclass : #IceTipEditProjectDialogTest,
	#category : #'Iceberg-UI-Tests'
}

{ #category : #running }
IceTipEditProjectDialogWithPackageInWorkingCopyTest >> newFixture [
	^ IceCleanWorkingCopyFixture inGit 
]

{ #category : #tests }
IceTipEditProjectDialogWithPackageInWorkingCopyTest >> testHasMessagePanel [.
	self assert: (dialog messageText text) equals: dialog warningMessage .
	self assert: (dialog messageIcon image ) equals: (self iconNamed: #warning).
]
