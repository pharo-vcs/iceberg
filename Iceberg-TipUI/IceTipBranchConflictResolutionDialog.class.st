Class {
	#name : 'IceTipBranchConflictResolutionDialog',
	#superclass : 'IceTipOptionDialogPresenter',
	#instVars : [
		'existingBranch',
		'types',
		'model',
		'reasonPanel',
		'resultBranch',
		'remoteBranch'
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
IceTipBranchConflictResolutionDialog class >> onRepository: aRepository remoteBranch: aRemoteBranch existingBranch: aBranch [

	^ (self on: (IceTipRepositoryModel on: aRepository))
		  remoteBranch: aRemoteBranch;
		  existingBranch: aBranch;
		  yourself
]

{ #category : 'accessing' }
IceTipBranchConflictResolutionDialog >> allTypes [

	^ types ifNil: [ types := self createConflictBranchTypes ]
]

{ #category : 'private - factory' }
IceTipBranchConflictResolutionDialog >> createConflictBranchTypes [

	| allTypes |
	"Collect types new+local+remotes"
	allTypes := {
		            (IceTipConflictCheckoutAsNewPanel on: self model).
		            (IceTipConflictCheckoutReplaceLocalPanel on: self model).
		            (IceTipCancelBranchPanel on: self model) }.
	allTypes do: [ :each | each onAccept: [ self closeWindow ] ].

	^ allTypes
]

{ #category : 'layout' }
IceTipBranchConflictResolutionDialog >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  add: reasonPanel expand: false;
		  add: super defaultLayout;
		  yourself
]

{ #category : 'actions' }
IceTipBranchConflictResolutionDialog >> doAccept [

	resultBranch := type executeFor: remoteBranch localBranch: existingBranch inRepository: self model repository
]

{ #category : 'accessing' }
IceTipBranchConflictResolutionDialog >> existingBranch: aBranch [

	existingBranch := aBranch.
	self initializeTypeVariables.
	self initializeReasonPanel
]

{ #category : 'initialization' }
IceTipBranchConflictResolutionDialog >> initializePresenters [

	super initializePresenters.
	reasonPanel := self newLabel
		               addStyle: 'iceTipReadonly';
		               yourself.
	

]

{ #category : 'initialization' }
IceTipBranchConflictResolutionDialog >> initializeReasonPanel [

	| line1 line2 line3 |
	line1 := 'The branch ' , existingBranch name , ' already exists in your local repository.'.
	line2 := 'Iceberg cannot check out the remote branch because doing so would overwrite the existing local branch.'.
	line3 := 'What would you like to do?'.

	reasonPanel := SpBoxLayout newTopToBottom
		               add: (self newLabel label: line1) expand: false;
		               add: (self newLabel label: line2) expand: false;
		               add: (self newLabel label: line3) expand: false;
		               yourself
]

{ #category : 'initialization' }
IceTipBranchConflictResolutionDialog >> initializeTypeVariables [

	types do: [ :panel |
			panel
				remoteBranch: remoteBranch;
				existingBranch: existingBranch ]
]

{ #category : 'accessing' }
IceTipBranchConflictResolutionDialog >> model [

	^ model
]

{ #category : 'accessing' }
IceTipBranchConflictResolutionDialog >> remoteBranch: aRemoteBranch [

	remoteBranch := aRemoteBranch
]

{ #category : 'accessing' }
IceTipBranchConflictResolutionDialog >> resultBranch [

	^ resultBranch
]

{ #category : 'accessing - model' }
IceTipBranchConflictResolutionDialog >> setModelBeforeInitialization: anObject [

	model := anObject
]

{ #category : 'accessing' }
IceTipBranchConflictResolutionDialog >> windowTitle [

	^ 'Resolve branch conflict'
]
