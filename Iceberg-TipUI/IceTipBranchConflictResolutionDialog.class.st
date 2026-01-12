Class {
	#name : 'IceTipBranchConflictResolutionDialog',
	#superclass : 'IceTipOptionDialogPresenter',
	#instVars : [
		'model',
		'types'
	],
	#category : 'Iceberg-TipUI-View-Branch',
	#package : 'Iceberg-TipUI',
	#tag : 'View-Branch'
}

{ #category : 'instance creation' }
IceTipBranchConflictResolutionDialog class >> onRepository: aRepository [

	^ self on: (IceTipRepositoryModel on: aRepository)
]

{ #category : 'accessing' }
IceTipBranchConflictResolutionDialog >> allTypes [

	^ types ifNil: [ types := self createConflictBranchTypes ]
]

{ #category : 'as yet unclassified' }
IceTipBranchConflictResolutionDialog >> createConflictBranchTypes [

^nil
]

{ #category : 'actions' }
IceTipBranchConflictResolutionDialog >> doAccept [

	self selectedType doAccept
]

{ #category : 'accessing' }
IceTipBranchConflictResolutionDialog >> windowTitle [

	^ 'Resolve branch conflict'
]
