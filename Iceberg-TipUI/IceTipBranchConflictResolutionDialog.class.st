Class {
	#name : 'IceTipBranchConflictResolutionDialog',
	#superclass : 'IceTipOptionDialogPresenter',
	#instVars : [
		'existingBranch',
		'types',
		'model',
		'reasonPanel'
	],
	#category : 'Iceberg-TipUI-View-Branch',
	#package : 'Iceberg-TipUI',
	#tag : 'View-Branch'
}

{ #category : 'instance creation' }
IceTipBranchConflictResolutionDialog class >> onRepository: aRepository [

	^ self on: (IceTipRepositoryModel on: aRepository)
]

{ #category : 'instance creation' }
IceTipBranchConflictResolutionDialog class >> onRepository: aRepository existingBranch: aBranch [

	^ (self on: (IceTipRepositoryModel on: aRepository))
		  existingBranch: aBranch;
		  yourself
]

{ #category : 'accessing' }
IceTipBranchConflictResolutionDialog >> allTypes [

	^ types ifNil: [ types := self createConflictBranchTypes ]
]

{ #category : 'as yet unclassified' }
IceTipBranchConflictResolutionDialog >> createConflictBranchTypes [

	| allTypes |
	"Collect types new+local+remotes"
	allTypes := { (IceTipCancelBranchPanel on: self model) }.
	allTypes do: [ :each | each onAccept: [ self closeWindow ] ].

	^ allTypes
]

{ #category : 'layout' }
IceTipBranchConflictResolutionDialog >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  add: reasonPanel;
		  spacing: 40;
		  add: super defaultLayout;
		  yourself
]

{ #category : 'actions' }
IceTipBranchConflictResolutionDialog >> doAccept [

	self selectedType doAccept
]

{ #category : 'accessing' }
IceTipBranchConflictResolutionDialog >> existingBranch: aBranch [

	existingBranch := aBranch
]

{ #category : 'initialization' }
IceTipBranchConflictResolutionDialog >> initializePresenters [

	super initializePresenters.
	reasonPanel := self newText
		               beNotEditable;
		               addStyle: 'iceTipReadonly';
		               beWrapWord;
		               yourself.
	self initializeReasonPanel.
	self allTypes
]

{ #category : 'initialization' }
IceTipBranchConflictResolutionDialog >> initializeReasonPanel [

	reasonPanel text: 'The branch already exists in your local repository. 
Iceberg cannot check out the remote branch because doing so would overwrite the existing local branch. 
What would you like to do?'
]

{ #category : 'accessing' }
IceTipBranchConflictResolutionDialog >> model [

	^ model
]

{ #category : 'accessing - model' }
IceTipBranchConflictResolutionDialog >> setModelBeforeInitialization: anObject [

	model := anObject
]

{ #category : 'accessing' }
IceTipBranchConflictResolutionDialog >> windowTitle [

	^ 'Resolve branch conflict'
]
