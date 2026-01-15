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
IceTipBranchConflictResolutionDialog class >> onRepository: aRepository remoteBranch: aRemote existingBranch: aBranch [

	^ (self on: (IceTipRepositoryModel on: aRepository))
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
	allTypes := { (IceTipCancelBranchPanel on: self model) }.
	allTypes do: [ :each | each onAccept: [ self closeWindow ] ].

	^ allTypes
]

{ #category : 'layout' }
IceTipBranchConflictResolutionDialog >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  add: reasonPanel withConstraints: [ :constraints |
				  constraints
					  expand: false;
					  fill: false;
					  height: 20 ];
		  spacing: 10;
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
	self initializeReasonPanel
]

{ #category : 'initialization' }
IceTipBranchConflictResolutionDialog >> initializePresenters [

	super initializePresenters.
	reasonPanel := self newLabel
		               addStyle: 'iceTipReadonly';
		               yourself.
	
	self allTypes
]

{ #category : 'initialization' }
IceTipBranchConflictResolutionDialog >> initializeReasonPanel [

	reasonPanel label: 'The branch ' , existingBranch name , ' already exists in your local repository.' , String cr
		, 'Iceberg cannot check out the remote branch because doing so would overwrite the existing local branch.' , String cr
		, 'What would you like to do?'
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
